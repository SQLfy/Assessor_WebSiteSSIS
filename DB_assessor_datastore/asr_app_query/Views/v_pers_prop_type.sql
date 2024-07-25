



CREATE VIEW [asr_app_query].[v_pers_prop_type]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/10/2017
Developer:     t golden
Comments:      Initial creation
               List details for updating the pers_prop_acct
*************************************************************************************/


AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [PERS_PROP_TYPE]
      ,[CODE_DESCR]
      ,[ROW_START_DTM]
      ,[ROW_END_DTM]
      ,[ROW_CURRENT_FLAG]
      ,[CREATE_DTM]
      ,[CREATE_USER_ID]
      ,[UPDATE_DTM]
      ,[UPDATE_USER_ID]
  FROM [assessor_datastore].[asr_datastore].[pers_prop_type]




