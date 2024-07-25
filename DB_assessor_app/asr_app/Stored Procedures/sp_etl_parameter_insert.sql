





CREATE PROCEDURE[asr_app].[sp_etl_parameter_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/28/16
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the etl_parameter table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_app.etl_parameter AS myTarget
USING assessor_datastore.asr_app_query.v_etl_parameter AS mySource
ON myTarget.parameter_name = mySource.parameter_name
WHEN MATCHED 
	 THEN
        UPDATE SET myTarget.parameter_value = mySource.parameter_value
			      ,myTarget.parameter_description = mySource.parameter_description
				  ,myTarget.create_datetime = mySource.create_datetime
				  ,myTarget.create_user_id = mySource.create_user_id
				  ,myTarget.update_datetime = mySource.update_datetime
			      ,myTarget.update_user_id = mySource.update_user_id


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (parameter_name
	        ,parameter_value
			,parameter_description
			,create_datetime
			,create_user_id
			,update_datetime
			,update_user_id
            )
     VALUES (mySource.parameter_name 
            ,mySource.parameter_value
			,mySource.parameter_description
            ,mySource.create_datetime
            ,mySource.create_user_id
            ,mySource.update_datetime
            ,mySource.update_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




