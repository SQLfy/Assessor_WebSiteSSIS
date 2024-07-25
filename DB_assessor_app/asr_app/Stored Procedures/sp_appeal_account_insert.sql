


CREATE PROCEDURE [asr_app].[sp_appeal_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/20/2017
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the appeal_account

Mod #:  2
Mod Date:     3/19/2018
Developer:    Tony Golden
Comments:	  cboe updates
              add value_group_description to the appeal_account
			  

*************************************************************************************/
SET NOCOUNT ON;



MERGE assessor_app.asr_app.appeal_account AS myTarget
USING assessor_datastore.asr_app_query.v_appeal_account AS mySource
ON myTarget.account_no = mySource.account_no
   and myTarget.appeal_no = mySource.appeal_no
   and myTarget.tax_year = mySource.tax_year
   and myTarget.value_group_description = mySource.value_group_description
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET    myTarget.TAX_YEAR					    = mySource.TAX_YEAR					
					 ,myTarget.APPEAL_NO					= mySource.APPEAL_NO					
					 ,myTarget.ACCOUNT_NO					= mySource.ACCOUNT_NO					
					 ,myTarget.APPEAL_ADJUST_DENY_REASON_ID	= mySource.APPEAL_ADJUST_DENY_REASON_ID	
					 ,myTarget.APPEAL_COMMENT				= mySource.APPEAL_COMMENT				
					 ,myTarget.APPEAL_ACCOUNT_END_VALUE		= mySource.APPEAL_ACCOUNT_END_VALUE
					 ,myTarget.VALUE_GROUP_DESCRIPTION		= mySource.VALUE_GROUP_DESCRIPTION		
					 ,myTarget.APPEALACCTON0				= mySource.APPEALACCTON0				
					 ,myTarget.APPEALACCTON1				= mySource.APPEALACCTON1				
					 ,myTarget.APPEALACCTON2				= mySource.APPEALACCTON2				
					 ,myTarget.APPEALACCTOD0				= mySource.APPEALACCTOD0				
					 ,myTarget.APPEALACCTOD1				= mySource.APPEALACCTOD1				
					 ,myTarget.APPEALACCTOM0				= mySource.APPEALACCTOM0				
					 ,myTarget.APPEALACCTOM1				= mySource.APPEALACCTOM1				
					 ,myTarget.APPEALACCTOT0				= mySource.APPEALACCTOT0				
					 ,myTarget.APPEALACCTOT1				= mySource.APPEALACCTOT1				
					 ,myTarget.JURISDICTION_ID			    = mySource.JURISDICTION_ID			
					 ,myTarget.WRITE_DATE					= mySource.WRITE_DATE					
					 ,myTarget.BEGINNING_ACCOUNT_VALUE		= mySource.BEGINNING_ACCOUNT_VALUE		
					 ,myTarget.APPEAL_DECISION			    = mySource.APPEAL_DECISION			
					 ,myTarget.APPEAL_ACCT_REASON_DESC		= mySource.APPEAL_ACCT_REASON_DESC		
					 ,myTarget.ADD_BOARD_APPEAL_END_VALUE	= mySource.ADD_BOARD_APPEAL_END_VALUE	
					 ,myTarget.SEQ_ID						= mySource.SEQ_ID							
					 ,myTarget.UPDATE_DATETIME			    = GETDATE()
					 ,myTarget.UPDATE_USER_ID			    = SUSER_NAME()
					 ,myTarget.ROWHASH					    = mySource.ROWHASH

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT ( TAX_YEAR					   
			 ,APPEAL_NO					
			 ,ACCOUNT_NO					
			 ,APPEAL_ADJUST_DENY_REASON_ID
			 ,APPEAL_COMMENT				
			 ,APPEAL_ACCOUNT_END_VALUE
			 ,VALUE_GROUP_DESCRIPTION		
			 ,APPEALACCTON0				
			 ,APPEALACCTON1				
			 ,APPEALACCTON2				
			 ,APPEALACCTOD0				
			 ,APPEALACCTOD1				
			 ,APPEALACCTOM0				
			 ,APPEALACCTOM1				
			 ,APPEALACCTOT0				
			 ,APPEALACCTOT1				
			 ,JURISDICTION_ID			   
			 ,WRITE_DATE					
			 ,BEGINNING_ACCOUNT_VALUE		
			 ,APPEAL_DECISION			   
			 ,APPEAL_ACCT_REASON_DESC		
			 ,ADD_BOARD_APPEAL_END_VALUE	
			 ,SEQ_ID						
			 ,CREATE_DATEIME			   
             ,CREATE_USER_ID			   
             ,UPDATE_DATETIME			   
             ,UPDATE_USER_ID			   
             ,ROWHASH					   
            )
     VALUES (
	          mySource.TAX_YEAR					   
			 ,mySource.APPEAL_NO					
			 ,mySource.ACCOUNT_NO					
			 ,mySource.APPEAL_ADJUST_DENY_REASON_ID
			 ,mySource.APPEAL_COMMENT				
			 ,mySource.APPEAL_ACCOUNT_END_VALUE	
			 ,mySource.VALUE_GROUP_DESCRIPTION	
			 ,mySource.APPEALACCTON0				
			 ,mySource.APPEALACCTON1				
			 ,mySource.APPEALACCTON2				
			 ,mySource.APPEALACCTOD0				
			 ,mySource.APPEALACCTOD1				
			 ,mySource.APPEALACCTOM0				
			 ,mySource.APPEALACCTOM1				
			 ,mySource.APPEALACCTOT0				
			 ,mySource.APPEALACCTOT1				
			 ,mySource.JURISDICTION_ID			   
			 ,mySource.WRITE_DATE					
			 ,mySource.BEGINNING_ACCOUNT_VALUE		
			 ,mySource.APPEAL_DECISION			   
			 ,mySource.APPEAL_ACCT_REASON_DESC		
			 ,mySource.ADD_BOARD_APPEAL_END_VALUE	
			 ,mySource.SEQ_ID						
			 ,GETDATE()
			 ,SUSER_NAME()
			 ,GETDATE()
			 ,SUSER_NAME()
			 ,mySource.ROWHASH
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;









