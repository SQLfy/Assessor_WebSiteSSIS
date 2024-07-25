
CREATE VIEW [asr_ods2_query].[v_tax_district_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access the tax_district_authority table for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT tax_district_no, tax_authority_no, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.tax_district_authority;



