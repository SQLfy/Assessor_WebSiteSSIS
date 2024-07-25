










CREATE PROCEDURE [asr_app].[sp_etl_azure_important_dates_insert_old]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/2/2017
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the azure important dates table


			  ID
			  Description 
			  Reappraisal 
			  Event Name
			  Intervening
			  Category
			  create_datetime 
			  create_user_id 
			  update_datetime 
			  update_user_id 

Mod #:  2
Mod Date:     5/25/2017
Developer:    Richard Edwards
Comments:	  Add Title column
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_app.azure_important_dates AS myTarget
USING assessor_datastore.asr_app_query.v_azure_important_dates AS mySource
ON myTarget.ID = mySource.ID
WHEN MATCHED 
	 THEN
        UPDATE SET   myTarget.Description 				   =  mySource.Description
					,myTarget.Reappraisal 						   =  mySource.Reappraisal 						
					,myTarget.Event_Name						   =  mySource.Event_Name
					,myTarget.Intervening						   =  mySource.Intervening
					,myTarget.Category						   =  mySource.Category	
					,myTarget.Title						   =  mySource.Title												
					,myTarget.create_datetime 				   =  mySource.create_datetime 			
					,myTarget.create_user_id 				   =  mySource.create_user_id 			
					,myTarget.update_datetime 				   =  GETDATE() 			
					,myTarget.update_user_id 				   =  'ETL_ASR_ODS2' 			


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT ( ID
			  ,Description
			  ,Reappraisal 
			  ,Event_Name
			  ,Intervening
			  ,Category
			  ,Title
			  ,create_datetime 
			  ,create_user_id 
			  ,update_datetime 
			  ,update_user_id 
            )
     VALUES (mySource.ID	
			 ,mySource.Description
			 ,mySource.Reappraisal 						
			 ,mySource.Event_Name
			 ,mySource.Intervening
			 ,mySource.Category
			 ,mySource.Title
			 ,mySource.create_datetime 			
			 ,mySource.create_user_id 			
			 ,mySource.update_datetime 			
			 ,mySource.update_user_id									            
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;











