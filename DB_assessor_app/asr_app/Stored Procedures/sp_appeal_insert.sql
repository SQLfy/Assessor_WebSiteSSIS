



CREATE PROCEDURE [asr_app].[sp_appeal_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     5/2/2017
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the appeal table

Mod #:  2
Mod Date:     3/16/2018
Developer:    TGolden
Comments:	  CBOE appeal updates
              add new fields required for CBOE appeal information
				,FILER_EMAIL
				,FILER_PHONE
				,FILER
				,FILER_ADDRESS
				,FILER_CITY
				,FILER_STATECODE
				,FILER_ZIPCODE

			  

*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE assessor_app.asr_app.appeal

MERGE assessor_app.asr_app.appeal AS myTarget
USING assessor_datastore.asr_app_query.v_appeal AS mySource
ON  myTarget.TAX_YEAR= mySource.TAX_YEAR
AND myTarget.APPEAL_NO = mySource.APPEAL_NO
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   myTarget.TAX_YEAR						= mySource.TAX_YEAR						
				   , myTarget.APPEAL_NO						= mySource.APPEAL_NO						
				   , myTarget.APPEAL_TYPE					= mySource.APPEAL_TYPE					
				   , myTarget.APPEAL_METHOD					= mySource.APPEAL_METHOD					
				   , myTarget.ASSIGNED_TO					= mySource.ASSIGNED_TO					
				   , myTarget.INITIATED_BY					= mySource.INITIATED_BY					
				   , myTarget.AGENT_CODE					= mySource.AGENT_CODE	
				   , myTarget.AGENT_NAME					= mySource.AGENT_NAME
				   , myTarget.AGENT_EMAILADDRESS			= mySource.AGENT_EMAILADDRESS
				   , myTarget.AGENT_PHONE					= mySource.AGENT_PHONE
				   , myTarget.AGENT_ADDRESS					= mySource.AGENT_ADDRESS	
				   , myTarget.FILER_EMAIL					= mySource.FILER_EMAIL	
				   , myTarget.FILER_PHONE					= mySource.FILER_PHONE	
				   , myTarget.FILER					        = mySource.FILER	
				   , myTarget.FILER_ADDRESS					= mySource.FILER_ADDRESS	
				   , myTarget.FILER_CITY					= mySource.FILER_CITY	
				   , myTarget.FILER_STATECODE				= mySource.FILER_STATECODE	
				   , myTarget.FILER_ZIPCODE					= mySource.FILER_ZIPCODE	
				   , myTarget.MAIL_TO						= mySource.MAIL_TO						
				   , myTarget.DECISION_BY					= mySource.DECISION_BY					
				   , myTarget.CASE_NO						= mySource.CASE_NO						
				   , myTarget.REREVIEW_STATUS				= mySource.REREVIEW_STATUS				
				   , myTarget.REREVIEW_INITIALS				= mySource.REREVIEW_INITIALS				
				   , myTarget.REREVIEW_DECISION				= mySource.REREVIEW_DECISION				
				   , myTarget.APPEAL_REASON					= mySource.APPEAL_REASON					
				   , myTarget.APPEAL_BASIS					= mySource.APPEAL_BASIS					
				   , myTarget.APPEAL_RECOMMENDATION			= mySource.APPEAL_RECOMMENDATION			
				   , myTarget.APPEAL_ADJUST_DENY_REASON_ID	= mySource.APPEAL_ADJUST_DENY_REASON_ID	
				   , myTarget.APPEAL_END_VALUE				= mySource.APPEAL_END_VALUE				
				   , myTarget.DATE_OF_APPEAL				= mySource.DATE_OF_APPEAL				
				   , myTarget.DATE_RECEIVED					= mySource.DATE_RECEIVED					
				   , myTarget.TAX_PAYER_MEETING_REQUEST_FLAG= mySource.TAX_PAYER_MEETING_REQUEST_FLAG
				   , myTarget.TAX_PAYER_MEETING_DATE		= mySource.TAX_PAYER_MEETING_DATE		
				   , myTarget.TAX_PAYER_MEETING_TIME		= mySource.TAX_PAYER_MEETING_TIME		
				   , myTarget.BEGINNING_APPEAL_VALUE		= mySource.BEGINNING_APPEAL_VALUE		
				   , myTarget.APPEAL_ON1					= mySource.APPEAL_ON1					
				   , myTarget.APPEAL_ON2					= mySource.APPEAL_ON2					
				   , myTarget.APPEAL_OD0					= mySource.APPEAL_OD0					
				   , myTarget.APPEAL_OD1					= mySource.APPEAL_OD1					
				   , myTarget.APPEAL_OM0					= mySource.APPEAL_OM0					
				   , myTarget.APPEAL_OM1					= mySource.APPEAL_OM1					
				   , myTarget.APPEAL_ON0					= mySource.APPEAL_ON0					
				   , myTarget.APPEAL_OT0					= mySource.APPEAL_OT0					
				   , myTarget.APPEAL_OT1					= mySource.APPEAL_OT1					
				   , myTarget.APPRAISAL_TYPE				= mySource.APPRAISAL_TYPE				
				   , myTarget.PRIMARY_ACCOUNT				= mySource.PRIMARY_ACCOUNT				
				   , myTarget.JURISDICTION_ID				= mySource.JURISDICTION_ID				
				   , myTarget.SCHEDULE_DATE_AS				= mySource.SCHEDULE_DATE_AS				
				   , myTarget.SCHEDULE_START_TIME			= mySource.SCHEDULE_START_TIME			
				   , myTarget.SCHEDULE_END_TIME				= mySource.SCHEDULE_END_TIME				
				   , myTarget.SCHEDULE_COMMENT				= mySource.SCHEDULE_COMMENT				
				   , myTarget.SCHEDULE_BOARD_FILE_NO		= mySource.SCHEDULE_BOARD_FILE_NO		
				   , myTarget.SCHEDULE_APPRAISER_INITIALS	= mySource.SCHEDULE_APPRAISER_INITIALS	
				   , myTarget.APPOINTMENT_COLOR				= mySource.APPOINTMENT_COLOR				
				   , myTarget.WRITE_DATE					= mySource.WRITE_DATE					
				   , myTarget.APPEAL_STATUS_ID				= mySource.APPEAL_STATUS_ID				
				   , myTarget.APPEAL_REASON_DESCRIPTION		= mySource.APPEAL_REASON_DESCRIPTION		
				   , myTarget.BOARD_NO						= mySource.BOARD_NO						
				   , myTarget.APPEAL_DECISION				= mySource.APPEAL_DECISION				
				   , myTarget.SEQ_ID						= mySource.SEQ_ID						
				   , myTarget.create_datetime				= mySource.create_datetime				
				   , myTarget.create_user_id				= mySource.create_user_id				
				   , myTarget.rowhash   					= mySource.rowhash   					
				   , myTarget.update_datetime				= GETDATE()
			       , myTarget.update_user_id				= SUSER_NAME()

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (TAX_YEAR						
	        ,APPEAL_NO						
	        ,APPEAL_TYPE					
	        ,APPEAL_METHOD					
	        ,ASSIGNED_TO					
	        ,INITIATED_BY					
	        ,AGENT_CODE
			,AGENT_NAME	
			,AGENT_EMAILADDRESS	
			,AGENT_PHONE
			,AGENT_ADDRESS
			,FILER_EMAIL
			,FILER_PHONE
			,FILER
			,FILER_ADDRESS
			,FILER_CITY
			,FILER_STATECODE
			,FILER_ZIPCODE				
	        ,MAIL_TO						
	        ,DECISION_BY					
	        ,CASE_NO						
	        ,REREVIEW_STATUS				
			,REREVIEW_INITIALS				
	        ,REREVIEW_DECISION				
			,APPEAL_REASON					
	        ,APPEAL_BASIS					
			,APPEAL_RECOMMENDATION			
	        ,APPEAL_ADJUST_DENY_REASON_ID	
			,APPEAL_END_VALUE				
			,DATE_OF_APPEAL				
			,DATE_RECEIVED					
			,TAX_PAYER_MEETING_REQUEST_FLAG
			,TAX_PAYER_MEETING_DATE		
			,TAX_PAYER_MEETING_TIME		
			,BEGINNING_APPEAL_VALUE		
			,APPEAL_ON1					
			,APPEAL_ON2					
			,APPEAL_OD0					
			,APPEAL_OD1					
			,APPEAL_OM0					
			,APPEAL_OM1					
			,APPEAL_ON0					
			,APPEAL_OT0					
			,APPEAL_OT1					
			,APPRAISAL_TYPE				
			,PRIMARY_ACCOUNT				
			,JURISDICTION_ID				
			,SCHEDULE_DATE_AS				
			,SCHEDULE_START_TIME			
			,SCHEDULE_END_TIME				
			,SCHEDULE_COMMENT				
			,SCHEDULE_BOARD_FILE_NO		
			,SCHEDULE_APPRAISER_INITIALS	
			,APPOINTMENT_COLOR				
			,WRITE_DATE					
			,APPEAL_STATUS_ID				
			,APPEAL_REASON_DESCRIPTION		
			,BOARD_NO						
			,APPEAL_DECISION				
			,SEQ_ID						
			,create_datetime				
			,create_user_id				
			,rowhash   					
            )
     VALUES (mySource.TAX_YEAR						
            ,mySource.APPEAL_NO						
	        ,mySource.APPEAL_TYPE					
	        ,mySource.APPEAL_METHOD					
	        ,mySource.ASSIGNED_TO					
	        ,mySource.INITIATED_BY					
	        ,mySource.AGENT_CODE	
			,mySource.AGENT_NAME
			,mySource.AGENT_EMAILADDRESS
			,mySource.AGENT_PHONE
			,mySource.AGENT_ADDRESS
			,mySource.FILER_EMAIL
			,mySource.FILER_PHONE
			,mySource.FILER
			,mySource.FILER_ADDRESS
			,mySource.FILER_CITY
			,mySource.FILER_STATECODE
			,mySource.FILER_ZIPCODE				
	        ,mySource.MAIL_TO						
	        ,mySource.DECISION_BY					
	        ,mySource.CASE_NO						
	        ,mySource.REREVIEW_STATUS				
			,mySource.REREVIEW_INITIALS				
	        ,mySource.REREVIEW_DECISION				
			,mySource.APPEAL_REASON					
            ,mySource.APPEAL_BASIS					
            ,mySource.APPEAL_RECOMMENDATION			
			,mySource.APPEAL_ADJUST_DENY_REASON_ID	
			,mySource.APPEAL_END_VALUE				
			,mySource.DATE_OF_APPEAL				
			,mySource.DATE_RECEIVED					
			,mySource.TAX_PAYER_MEETING_REQUEST_FLAG
			,mySource.TAX_PAYER_MEETING_DATE		
            ,mySource.TAX_PAYER_MEETING_TIME		
	        ,mySource.BEGINNING_APPEAL_VALUE		
	        ,mySource.APPEAL_ON1					
	        ,mySource.APPEAL_ON2					
	        ,mySource.APPEAL_OD0					
	        ,mySource.APPEAL_OD1					
	        ,mySource.APPEAL_OM0					
	        ,mySource.APPEAL_OM1					
	        ,mySource.APPEAL_ON0					
	        ,mySource.APPEAL_OT0					
			,mySource.APPEAL_OT1					
	        ,mySource.APPRAISAL_TYPE				
			,mySource.PRIMARY_ACCOUNT				
            ,mySource.JURISDICTION_ID				
            ,mySource.SCHEDULE_DATE_AS				
			,mySource.SCHEDULE_START_TIME			
			,mySource.SCHEDULE_END_TIME				
			,mySource.SCHEDULE_COMMENT				
			,mySource.SCHEDULE_BOARD_FILE_NO		
			,mySource.SCHEDULE_APPRAISER_INITIALS	
			,mySource.APPOINTMENT_COLOR				
            ,mySource.WRITE_DATE					
	        ,mySource.APPEAL_STATUS_ID				
	        ,mySource.APPEAL_REASON_DESCRIPTION		
	        ,mySource.BOARD_NO						
	        ,mySource.APPEAL_DECISION				
	        ,mySource.SEQ_ID						
	        ,mySource.create_datetime				
	        ,mySource.create_user_id				
	        ,mySource.rowhash   					
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;
