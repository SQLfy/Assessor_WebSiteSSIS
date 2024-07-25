

CREATE PROCEDURE [asr_app].[sp_pers_prop_type_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/10/2017
Developer:    tony golden
Comments:	  Initial creation
              Merge changes into the pers_prop_type
*************************************************************************************/
 
SET NOCOUNT ON;

MERGE assessor_app.asr_app.pers_prop_type AS myTarget
USING assessor_datastore.asr_app_query.v_pers_prop_type  AS mySource
ON myTarget.pers_prop_type = mySource.pers_prop_type
   

WHEN MATCHED 
	 THEN
        UPDATE SET   				
					 myTarget.PERS_PROP_TYPE			= mySource.PERS_PROP_TYPE	
					,myTarget.CODE_DESCR				= mySource.CODE_DESCR		
					,myTarget.ROW_START_DTM				= mySource.ROW_START_DTM		
					,myTarget.ROW_END_DTM				= mySource.ROW_END_DTM		
					,myTarget.ROW_CURRENT_FLAG			= mySource.ROW_CURRENT_FLAG	
					,myTarget.CREATE_DTM				= mySource.CREATE_DTM		
					,myTarget.CREATE_USER_ID			= mySource.CREATE_USER_ID	
					,myTarget.UPDATE_DTM				= getdate()		
					,myTarget.UPDATE_USER_ID			= suser_name()	
					
					     
				  
WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
              PERS_PROP_TYPE
			, CODE_DESCR
			, ROW_START_DTM
			, ROW_END_DTM
			, ROW_CURRENT_FLAG
			, CREATE_DTM
			, CREATE_USER_ID
			, UPDATE_DTM
			, UPDATE_USER_ID

            )
     VALUES (
	           mySource.PERS_PROP_TYPE
			  ,mySource.CODE_DESCR
			  ,mySource.ROW_START_DTM
			  ,mySource.ROW_END_DTM
			  ,mySource.ROW_CURRENT_FLAG
			  ,getdate()
			  ,suser_name()
			  ,mySource.UPDATE_DTM
			  ,mySource.UPDATE_USER_ID
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







