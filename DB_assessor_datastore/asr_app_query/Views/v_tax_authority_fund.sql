







CREATE VIEW [asr_app_query].[v_tax_authority_fund]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access tax_authority_fund data 
			   for loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT tax_authority_no, tax_fund_code, levy_type_id, levy_type, assessed_mill_levy, 
tax_fund_description, create_datetime, create_user_id, update_datetime, update_user_id, rowhash
FROM [asr_datastore].[tax_authority_fund];










