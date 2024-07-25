





CREATE VIEW [asr_app_query].[v_pers_prop_acct]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/10/2017
Developer:     t golden
Comments:      Initial creation
               List details for updating the pers_prop_acct

        2     3/15/2017
		      t golden
			  added associated_account for PP
*************************************************************************************/


AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ACCOUNT_NO]
      ,[BUSINESS_NAME]
      ,[BUSINESS_TYPE]
	  ,[BUSINESS_TYPE_DESCRIPTION]
      ,[ROW_START_DTM]
      ,[ROW_END_DTM]
      ,[ROW_CURRENT_FLAG]
      ,[CREATE_DTM]
      ,[CREATE_USER_ID]
      ,[UPDATE_DTM]
      ,[UPDATE_USER_ID]
      ,[LATE_FILING_FLAG]
      ,[NEW_CONSTRUCTION_FLAG]
      ,[NEW_CONSTRUCTION_CLASS_CODE]
      ,[NEW_CONSTRUCTION_VALUE]
      ,[DECLARATION_SENT_DATE]
      ,[DECLARATION_RETURNED_DATE]
      ,[VALUED_BY]
      ,[NO_DECLARATION_FLAG]
      ,[BEST_INFO_AVAILABLE_FLAG]
      ,[NO_CHANGE_FLAG]
	  ,[ASSOCIATED_ACCOUNT]
  FROM [assessor_datastore].[asr_datastore].[pers_prop_acct]






