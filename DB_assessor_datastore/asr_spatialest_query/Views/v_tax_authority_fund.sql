











CREATE VIEW [asr_spatialest_query].[v_tax_authority_fund]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access tax authority fund for loading data into
			   the asssessor_app database for Spatialist
Mod #:  2
Mod Date:      8/23/2016
Developer:     Richard Edwards
Comments:      Add CSVClean function to remove problem characters for Spatialest CSV format
*************************************************************************************/
AS
select tax_authority_no
, tax_fund_code
, levy_type_id
, dbo.fn_CSVClean(tax_fund_description) AS tax_fund_description
, assessed_mill_levy 
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, HASHBYTES('SHA2_256', ISNULL(RTRIM(tax_authority_no), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(tax_fund_code),'DBNULL_TEXT') 
  + ISNULL(RTRIM(levy_type_id), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(tax_fund_description)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(assessed_mill_levy), 'DBNULL_TEXT') 
  ) AS rowhash
from asr_datastore.tax_authority_fund






