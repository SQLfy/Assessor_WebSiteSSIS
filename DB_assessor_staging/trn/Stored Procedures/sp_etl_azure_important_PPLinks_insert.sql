








CREATE PROCEDURE [trn].[sp_etl_azure_important_PPLinks_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/23/2017
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the azure important PPLinks table


			  ID
			  LinkName 
			  LinkURL 
			  LinkOrder
			  create_datetime 
			  create_user_id 
			  update_datetime 
			  update_user_id 
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.azure_important_PPLinks AS myTarget
USING trn.v_etl_azure_important_PPLinks AS mySource
ON myTarget.ID = mySource.ID
WHEN MATCHED 
	 THEN
        UPDATE SET   myTarget.LinkName 				   =  mySource.LinkName
					,myTarget.LinkURL 						   =  mySource.LinkURL 						
					,myTarget.LinkOrder						   =  mySource.LinkOrder												
					,myTarget.create_datetime 				   =  mySource.create_datetime 			
					,myTarget.create_user_id 				   =  mySource.create_user_id 			
					,myTarget.update_datetime 				   =  GETDATE() 			
					,myTarget.update_user_id 				   =  'ETL_ASR_ODS2' 			


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT ( ID
			  ,LinkName 
			  ,LinkURL 
			  ,LinkOrder
			  ,create_datetime 
			  ,create_user_id 
			  ,update_datetime 
			  ,update_user_id 
            )
     VALUES (mySource.ID	
			 ,mySource.LinkName
			 ,mySource.LinkURL 						
			 ,mySource.LinkOrder
			 ,mySource.create_datetime 			
			 ,mySource.create_user_id 			
			 ,mySource.update_datetime 			
			 ,mySource.update_user_id									            
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;









