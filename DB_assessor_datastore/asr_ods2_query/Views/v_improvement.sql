



CREATE VIEW [asr_ods2_query].[v_improvement]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access improvements for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, improvement_no, completed_percent, improvement_quality, improvement_perimeter, 
improvement_sf, improvement_net_sf, property_type, condition_type, approach_type, 
create_datetime, create_user_id, update_datetime, update_user_id, rowhash
FROM asr_datastore.improvement;






