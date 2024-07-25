
CREATE VIEW [asr_open_data_query].[v_property_owner]
AS

SELECT OwnerKey, 
		ACCOUNT_NO,  
       OWNER_NAME,  
	   MAILING_ADDRESS_LINE_1,  
	   MAILING_ADDRESS_LINE_2,  
	   MAILING_CITY_NAME,  
	   MAILING_STATE,  
	   MAILING_ZIP_CODE, 
	   Location
FROM 
(
SELECT OwnerKey, 
		ACCOUNT_NO,  
       OWNER_NAME,  
	   MAILING_ADDRESS_LINE_1,  
	   MAILING_ADDRESS_LINE_2,  
	   MAILING_CITY_NAME,  
	   MAILING_STATE,  
	   MAILING_ZIP_CODE, 
	   Location, 
	   ROW_NUMBER() OVER (PARTITION BY OwnerKey ORDER BY MAILING_ZIP_CODE desc) as DedupKey
FROM
(
SELECT  ac.account_no AS ACCOUNT_NO, oa.owner_name AS OWNER_NAME, oa.address_line_1 AS MAILING_ADDRESS_LINE_1, oa.address_line_2 AS MAILING_ADDRESS_LINE_2,
        oa.city_name AS MAILING_CITY_NAME, oa.state AS MAILING_STATE, oa.zip_code AS MAILING_ZIP_CODE, 
		isnull(cast(ac.account_no as varchar(max)),'')+isnull(cast(oa.owner_name as varchar(max)),'') as OwnerKey
FROM  [prassrrpt].[assessor_datastore].[asr_datastore].[account] ac LEFT JOIN
     [prassrrpt].[assessor_datastore].[asr_datastore].[account_owner_address] oa ON ac.account_no = oa.account_no 
  where account_status = 'A' 
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
