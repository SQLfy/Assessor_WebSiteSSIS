


CREATE VIEW [asr_spatialest_query].[v_account_owner_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      6/22/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access account_owner_address for active accounts for 
			   loading data into the asssessor_app database for spatialest
**************************************************************************************
Mod #:  2
Mod Date:      8/23/2016
Developer:     Richard Edwards
Comments:      Add CSVClean function to remove problem characters for Spatialest CSV format
*************************************************************************************/
AS
SELECT oa.account_no, oa.person_code, oa.primary_owner_flag
, dbo.fn_CSVClean(oa.owner_name) AS owner_name
, oa.owner_name_1 
, oa.owner_name_2 
, oa.ownership_percent
, oa.federal_id_no
, dbo.fn_CSVClean(oa.address_line_1) AS address_line_1
, dbo.fn_CSVClean(oa.address_line_2) AS address_line_2
, dbo.fn_CSVClean(oa.city_name) AS city_name
, oa.state
, oa.zip_code
, dbo.fn_CSVClean(oa.country) AS country
, oa.create_datetime, oa.create_user_id, oa.update_datetime, oa.update_user_id
, HASHBYTES('SHA2_256', ISNULL(RTRIM(oa.account_no), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(oa.person_code),'DBNULL_TEXT') 
  + ISNULL(RTRIM(oa.primary_owner_flag), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(oa.owner_name)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(oa.ownership_percent), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(oa.federal_id_no), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(oa.address_line_1)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(oa.address_line_2)),'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(oa.city_name)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(oa.state), 'DBNULL_TEXT')
  + ISNULL(RTRIM(oa.zip_code), 'DBNULL_TEXT')
  + ISNULL(RTRIM(dbo.fn_CSVClean(oa.country)), 'DBNULL_TEXT')
  ) AS rowhash
, oa.private_flag
FROM asr_datastore.account_owner_address oa
INNER JOIN asr_datastore.account a
	  ON oa.account_no = a.account_no
	  AND a.account_status = 'A'
	  AND a.account_no not like '%C%';





