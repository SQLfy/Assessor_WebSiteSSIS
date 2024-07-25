


CREATE VIEW [asr_app_query].[v_real_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access real account data for active accounts for 
			   loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT   ra.account_no, ra.no_of_buildings, ra.vacant_flag, ra.improvement_only_flag, ra.tif_flag, 
         ra.zoning_code, ra.zoning_code_description, ra.platted_flag, ra.default_lea, 
		 ra.default_lea_description, 
         ra.total_improvement_interest_percent, ra.total_land_interest_percent, ra.create_datetime, 
		 ra.create_user_id, ra.update_datetime, ra.update_user_id, ra.rowhash
FROM     asr_datastore.real_account AS ra INNER JOIN
         asr_datastore.account AS a ON ra.account_no = a.account_no AND a.account_status = 'A'



