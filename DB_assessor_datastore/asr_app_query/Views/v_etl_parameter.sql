


CREATE VIEW [asr_app_query].[v_etl_parameter]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access etl_parameter for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT parameter_name, parameter_value, parameter_description, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.etl_parameter;





