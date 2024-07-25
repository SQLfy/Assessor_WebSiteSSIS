



CREATE PROCEDURE [asr_app].[sp_etl_azure_bldg_permit_auth_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     9/2/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the azure building permit authority table


			  ID
			  authority_name 
			  phone 
			  street
			  city 
			  zip 
			  associated_tax_authority_no
			  email
			  URL
			  create_datetime 
			  create_user_id 
			  update_datetime 
			  update_user_id 
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_app.azure_building_permit_authority AS myTarget
USING assessor_datastore.asr_app_query.v_azure_building_permit_authority AS mySource
ON myTarget.bldg_permit_auth_id = mySource.bldg_permit_auth_id
WHEN MATCHED 
	 THEN
        UPDATE SET   myTarget.authority_name 				   =  mySource.authority_name
					,myTarget.phone 						   =  mySource.phone 						
					,myTarget.street						   =  mySource.street						
					,myTarget.city 							   =  mySource.city 						
					,myTarget.zip 							   =  mySource.zip 						
					,myTarget.associated_tax_authority_no	   =  mySource.associated_tax_authority_no
					,myTarget.email							   =  mySource.email						
					,myTarget.URL							   =  mySource.URL						
					,myTarget.create_datetime 				   =  mySource.create_datetime 			
					,myTarget.create_user_id 				   =  mySource.create_user_id 			
					,myTarget.update_datetime 				   =  GETDATE() 			
					,myTarget.update_user_id 				   =  'ETL_ASR_ODS2' 			


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT ( bldg_permit_auth_id
			  ,authority_name 
			  ,phone 
			  ,street
			  ,city 
			  ,zip 
			  ,associated_tax_authority_no
			  ,email
			  ,URL
			  ,create_datetime 
			  ,create_user_id 
			  ,update_datetime 
			  ,update_user_id 
            )
     VALUES ( mySource.bldg_permit_auth_id	
			 ,mySource.authority_name
			 ,mySource.phone 						
			 ,mySource.street						
			 ,mySource.city 						
			 ,mySource.zip 						
			 ,mySource.associated_tax_authority_no
			 ,mySource.email						
			 ,mySource.URL						
			 ,mySource.create_datetime 			
			 ,mySource.create_user_id 			
			 ,mySource.update_datetime 			
			 ,mySource.update_user_id 			            
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;









