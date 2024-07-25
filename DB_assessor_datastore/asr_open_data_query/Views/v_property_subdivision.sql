
CREATE VIEW [asr_open_data_query].[v_property_subdivision]
AS

SELECT	SubDivisionKey, 
		ACCOUNT_NO,  
		SUB_FILING_RECORDING_NO,  
		SUBDIVISION_NAME,  
		LOT_NO,  
		BLOCK_NO,  
		TRACT_NO, 
		Location
FROM 
(
SELECT SubDivisionKey, 
	   ACCOUNT_NO,  
       SUB_FILING_RECORDING_NO,  
	   SUBDIVISION_NAME,  
	   LOT_NO,  
	   BLOCK_NO,  
	   TRACT_NO, 
	   Location, 
	   ROW_NUMBER() OVER (PARTITION BY SubDivisionKey ORDER BY LOT_NO desc) as DedupKey
FROM
(
SELECT  DISTINCT ac.account_no AS ACCOUNT_NO, ac.sub_filing_recording_no, sf.subdivision_name, apl.LOT AS LOT_NO, 
                 apl.BLOCK AS BLOCK_NO, apl.TRACT AS TRACT_NO,
				 isnull(cast(ac.account_no as varchar(max)),'')+isnull(cast(ac.sub_filing_recording_no as varchar(max)),'') as SubDivisionKey
FROM [assessor_datastore].[asr_datastore].[account] ac LEFT JOIN
     [assessor_datastore].[asr_datastore].[account_platted_lot] apl ON ac.account_no = apl.ACCOUNT_NO AND ac.state_parcel_no = apl.PARCEL_NO LEFT JOIN
     [assessor_datastore].[asr_datastore].[sub_filing] sf ON ac.sub_filing_recording_no = sf.sub_filing_recording_no
  where account_status = 'A' AND LEFT(ac.account_no,1) IN ('M','R') 
  ) a
  left outer join (SELECT *
			FROM
			(Select Account_Number
					,location
					,row_number() over(partition BY Account_Number Order By location) as orderval
			FROM location.location_data 
			) ld 
  WHERE orderval = 1) b on a.ACCOUNT_NO = b.Account_Number
   ) x 
  WHERE x.DedupKey = 1
