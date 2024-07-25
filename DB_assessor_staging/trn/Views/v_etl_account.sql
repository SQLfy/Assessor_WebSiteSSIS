








CREATE VIEW [trn].[v_etl_account]
--WITH SCHEMABINDING
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/27/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all accounts

Mod #:  2
Mod Date:      9/2/2016
Developer:     Tony Golden
Comments:      Added azure building permit authority id field 

Mod #:  3
Mod Date:      10/31/2016
Developer:     Richard Edwards
Comments:      Added columns qtr, section, township and range 
               
*************************************************************************************/
AS

SELECT 
	a.ACCOUNTNO AS account_no
   ,a.PARCELNO AS state_parcel_no
   ,a.DEFAULTTAXDISTRICT AS tax_district_no
   ,sa.SUBNO AS sub_filing_recording_no
   ,t.ACCTTYPE AS account_type
   ,t.APPRAISALTYPE AS appraisal_type
   ,s.ACCTSTATUSCODE AS account_status
   ,s.ACCTSTATUSDESCRIPTION AS account_status_description
   ,al.LEGAL AS legal_description
   ,gis.longitude_x AS longitude_x
   ,gis.latitude_y AS latitude_y
   ,gis.elevation_z AS elevation_z
   ,gis.location AS location
   ,bpa.bldg_permit_auth_id as bldg_permit_auth_id
   ,GETDATE() AS create_datetime
   ,SUSER_NAME () AS create_user_id
   ,lloc.QTR AS qtr
	,lloc.SECTION AS section
	,lloc.TOWNSHIP AS township
	,lloc.RANGE AS range	
   ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(a.ACCOUNTNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(a.PARCELNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(a.DEFAULTTAXDISTRICT), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sa.SUBNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(t.ACCTTYPE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(t.APPRAISALTYPE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.ACCTSTATUSCODE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.ACCTSTATUSDESCRIPTION), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(al.LEGAL), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(gis.longitude_x), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.latitude_y), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.elevation_z), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.location), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(bpa.bldg_permit_auth_id), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(lloc.QTR), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(lloc.SECTION), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(lloc.TOWNSHIP), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(lloc.RANGE), 'DBNULL_TEXT')
				) AS rowhash						
FROM 
	[dqm].[q_tblacct] a  
	INNER JOIN [asr_staging].[s_tlkpaccttype] t
	ON t.ACCTTYPE = a.ACCTTYPE AND t.APPRAISALTYPE = a.APPRAISALTYPE
	INNER JOIN [asr_staging].[s_tlkpstatusacct] s
	ON s.ACCTSTATUSCODE = a.ACCTSTATUSCODE
	INNER JOIN [asr_staging].[s_tlkptaxdistrict] td
	ON td.TAXDISTRICT = a.DEFAULTTAXDISTRICT
	LEFT OUTER JOIN [dqm].[q_tblsubaccount] sa
	ON sa.ACCOUNTNO = a.ACCOUNTNO
	LEFT OUTER JOIN (SELECT l1.accountno, l1.legal
					 FROM [asr_staging].[s_tblacctlegal] l1
					 INNER JOIN (
								SELECT accountno, max(seqid) as max_seqid
								FROM  [asr_staging].[s_tblacctlegal]
								GROUP BY accountno ) l2
					 ON l1.accountno = l2.accountno
					 AND l1.seqid = l2.max_seqid ) al   
	ON al.ACCOUNTNO = a.ACCOUNTNO
	LEFT OUTER JOIN [asr_staging].[s_account_location] gis
	ON gis.Account_Number = a.ACCOUNTNO
	LEFT JOIN [asr_staging].[s_tblacctlegallocation] lloc
	ON lloc.ACCOUNTNO = a.ACCOUNTNO
	LEFT OUTER JOIN [dqm].[bad_account] b  --exclude accounts that have DQM rule violations
	ON a.ACCOUNTNO = b.accountno
	INNER JOIN [trn].[v_etl_bldg_permit_authority_by_account] bpa
	ON bpa.account_no = a.ACCOUNTNO
WHERE b.accountno IS NULL;









