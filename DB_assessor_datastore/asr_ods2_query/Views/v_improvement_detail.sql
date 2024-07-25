




CREATE VIEW [asr_ods2_query].[v_improvement_detail]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access improvement details for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, improvement_no, improvement_detail_id, improvement_detail_type, improvement_detail_type_description, 
detail_unit_count, addon_code, addon_code_description, detail_built_year, create_datetime, 
create_user_id, update_datetime, update_user_id, rowhash
FROM asr_datastore.improvement_detail;







