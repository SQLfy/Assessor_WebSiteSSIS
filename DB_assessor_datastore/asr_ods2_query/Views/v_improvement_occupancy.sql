




CREATE VIEW [asr_ods2_query].[v_improvement_occupancy]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access improvement occupancy data 
			   for loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, improvement_no, occupancy_detail_id, occupancy_code, occupancy_code_description, 
occupancy_percent, abstract_code, abstract_code_description, abstract_value, 
create_datetime, create_user_id, update_datetime, update_user_id, rowhash
FROM asr_datastore.improvement_occupancy;







