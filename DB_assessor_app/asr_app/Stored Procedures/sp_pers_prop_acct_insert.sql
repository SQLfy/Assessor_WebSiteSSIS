





CREATE PROCEDURE [asr_app].[sp_pers_prop_acct_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/10/2017
Developer:    tony golden
Comments:	  Initial creation
              Merge changes into the pers_prop_acct
*************************************************************************************/
--select * from assessor_datastore.asr_app_query.v_pers_prop_acct


SET NOCOUNT ON;

TRUNCATE TABLE assessor_app.asr_app.pers_prop_acct

MERGE assessor_app.asr_app.pers_prop_acct AS myTarget
USING assessor_datastore.asr_app_query.v_pers_prop_acct  AS mySource
ON myTarget.account_no = mySource.account_no

WHEN MATCHED 
	 THEN
        UPDATE SET   				
					 myTarget.BUSINESS_NAME					=  mySource.BUSINESS_NAME					
					,myTarget.BUSINESS_TYPE     			=  mySource.BUSINESS_TYPE
					,myTarget.BUSINESS_TYPE_DESCRIPTION		=  mySource.BUSINESS_TYPE_DESCRIPTION			
					,myTarget.ROW_START_DTM					=  mySource.ROW_START_DTM					
					,myTarget.ROW_END_DTM					=  mySource.ROW_END_DTM					
					,myTarget.ROW_CURRENT_FLAG				=  mySource.ROW_CURRENT_FLAG				
					,myTarget.CREATE_DTM					=  mySource.CREATE_DTM					
					,myTarget.CREATE_USER_ID				=  mySource.CREATE_USER_ID				
					,myTarget.UPDATE_DTM					=  GETDATE()				
					,myTarget.UPDATE_USER_ID				=  SUSER_NAME()				
					,myTarget.LATE_FILING_FLAG				=  mySource.LATE_FILING_FLAG				
					,myTarget.NEW_CONSTRUCTION_FLAG			=  mySource.NEW_CONSTRUCTION_FLAG			
					,myTarget.NEW_CONSTRUCTION_CLASS_CODE	=  mySource.NEW_CONSTRUCTION_CLASS_CODE	
					,myTarget.NEW_CONSTRUCTION_VALUE		=  mySource.NEW_CONSTRUCTION_VALUE		
					,myTarget.DECLARATION_SENT_DATE			=  mySource.DECLARATION_SENT_DATE			
					,myTarget.DECLARATION_RETURNED_DATE		=  mySource.DECLARATION_RETURNED_DATE		
					,myTarget.VALUED_BY						=  mySource.VALUED_BY						
					,myTarget.NO_DECLARATION_FLAG			=  mySource.NO_DECLARATION_FLAG			
					,myTarget.BEST_INFO_AVAILABLE_FLAG		=  mySource.BEST_INFO_AVAILABLE_FLAG		
					,myTarget.NO_CHANGE_FLAG				=  mySource.NO_CHANGE_FLAG	
					,myTarget.ASSOCIATED_ACCOUNT		    =  mySource.ASSOCIATED_ACCOUNT					

					     
				  
WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
               ACCOUNT_NO
			 , BUSINESS_NAME					
			 , BUSINESS_TYPE
			 , BUSINESS_TYPE_DESCRIPTION			
			 , ROW_START_DTM					
			 , ROW_END_DTM					
			 , ROW_CURRENT_FLAG				
			 , CREATE_DTM					
			 , CREATE_USER_ID				
			 , UPDATE_DTM					
			 , UPDATE_USER_ID				
			 , LATE_FILING_FLAG				
			 , NEW_CONSTRUCTION_FLAG			
			 , NEW_CONSTRUCTION_CLASS_CODE	
			 , NEW_CONSTRUCTION_VALUE		
			 , DECLARATION_SENT_DATE			
			 , DECLARATION_RETURNED_DATE		
			 , VALUED_BY						
			 , NO_DECLARATION_FLAG			
			 , BEST_INFO_AVAILABLE_FLAG		
			 , NO_CHANGE_FLAG	
			 , ASSOCIATED_ACCOUNT			
            )
     VALUES (
	           mySource.ACCOUNT_NO
			 , mySource.BUSINESS_NAME					
			 , mySource.BUSINESS_TYPE
			 , mySource.BUSINESS_TYPE_DESCRIPTION			
			 , mySource.ROW_START_DTM					
			 , mySource.ROW_END_DTM					
			 , mySource.ROW_CURRENT_FLAG				
			 , mySource.CREATE_DTM					
			 , mySource.CREATE_USER_ID				
			 , mySource.UPDATE_DTM					
			 , mySource.UPDATE_USER_ID				
			 , mySource.LATE_FILING_FLAG				
			 , mySource.NEW_CONSTRUCTION_FLAG			
			 , mySource.NEW_CONSTRUCTION_CLASS_CODE	
			 , mySource.NEW_CONSTRUCTION_VALUE		
			 , mySource.DECLARATION_SENT_DATE			
			 , mySource.DECLARATION_RETURNED_DATE		
			 , mySource.VALUED_BY						
			 , mySource.NO_DECLARATION_FLAG			
			 , mySource.BEST_INFO_AVAILABLE_FLAG		
			 , mySource.NO_CHANGE_FLAG	
			 , mySource.ASSOCIATED_ACCOUNT	
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







