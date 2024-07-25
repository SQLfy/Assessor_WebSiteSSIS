

CREATE VIEW [asr_ods2_query].[v_etl_parameter]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access etl_parameter for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT parameter_name, parameter_value, parameter_description, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.etl_parameter;




