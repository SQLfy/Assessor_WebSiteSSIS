
CREATE VIEW [asr_ods2_query].[v_tax_district]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access tax districts for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT tax_district_no, tax_district_name, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.tax_district;



