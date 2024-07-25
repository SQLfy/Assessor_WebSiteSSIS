





CREATE VIEW [asr_ods2_query].[v_sale_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access sale_account data for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT recording_no, account_no, create_datetime, create_user_id, update_datetime, update_user_id, rowhash
FROM asr_datastore.sale_account;








