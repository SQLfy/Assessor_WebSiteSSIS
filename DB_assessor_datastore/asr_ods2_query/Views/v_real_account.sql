





CREATE VIEW [asr_ods2_query].[v_real_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access real_account data 
			   for loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, no_of_buildings, vacant_flag, improvement_only_flag, tif_flag, zoning_code, zoning_code_description, 
platted_flag, default_lea, default_lea_description, total_improvement_interest_percent, total_land_interest_percent, 
create_datetime, create_user_id, update_datetime, update_user_id, rowhash
FROM [asr_datastore].[real_account];








