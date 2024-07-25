










CREATE VIEW [asr_spatialest_query].[v_tax_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access tax authority for loading data into
			   the asssessor_app database for Spatialist
Mod #:  2
Mod Date:      8/23/2016
Developer:     Richard Edwards
Comments:      Add CSVClean function to remove problem characters for Spatialest CSV format
*************************************************************************************/
AS
select tax_authority_no
, dbo.fn_CSVClean(tax_authority_name) AS tax_authority_name 
, dbo.fn_CSVClean(authority_type) AS authority_type
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, HASHBYTES('SHA2_256', ISNULL(RTRIM(tax_authority_no), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(tax_authority_name)),'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(authority_type)), 'DBNULL_TEXT') 
  ) AS rowhash
from asr_datastore.tax_authority





