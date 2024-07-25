




CREATE PROCEDURE [asr_app].[sp_nod_table_1_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     04/04/2017
Developer:    richard edwards
Comments:	  Initial creation
              Insert source data into the nod_table_1 table

*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE assessor_app.asr_app.nod_table_1


     INSERT INTO assessor_app.asr_app.nod_table_1
     SELECT [header]
      ,[agent_flag]
      ,[review_number]
      ,[tax_year]
      ,[owner_name_1]
      ,[owner_name_2]
      ,[owner_address_1]
      ,[owner_address_2]
      ,[owner_city]
      ,[owner_state]
      ,[owner_zip]
      ,[location]
      ,[sub_name]
      ,[value_description_1]
      ,[value_description_2]
      ,[value_description_3]
      ,[create_datetime]
      ,[create_user_id]
	FROM assessor_datastore.asr_datastore.nod_table_1






