




CREATE PROCEDURE [trn].[sp_nod_table_2_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     04/04/2017
Developer:    richard edwards
Comments:	  Initial creation
              Insert source data into the nod_table_1 table

*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE assessor_datastore.asr_datastore.nod_table_2


     INSERT INTO assessor_datastore.asr_datastore.nod_table_2
     SELECT  [header]
      ,[agent_flag]
      ,[review_number]
      ,[tax_year]
      ,[account_no]
      ,[sub_lot]
      ,[sub_block]
      ,[desc_1]
      ,[desc_2]
      ,[desc_3]
      ,[desc_4]
      ,[a/d]
      ,[prior_value_1]
      ,[prior_value_2]
      ,[prior_value_3]
      ,[prior_value_4]
      ,[current_value_1]
      ,[current_value_2]
      ,[current_value_3]
      ,[current_value_4]
      ,[pet_value_total]
      ,[prior_value_total]
      ,[current_value_total]
      ,[appeal_acct_adjust_deny_reason]
      ,[appeal_acct_reason_desc]
      ,[sub_name]
      ,[filing_no]
      ,[create_datetime]
      ,[create_user_id]
	FROM assessor_staging.[trn].[v_etl_nod_table_2]






