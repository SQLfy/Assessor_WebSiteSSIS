


CREATE VIEW [asr_app_query].[v_account_neighborhood]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access account_neighborhood for active accounts for 
			   loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT n.account_no, n.neighborhood_code, n.property_type, n.neighborhood_extension
	 , n.create_datetime, n.create_user_id
	 , n.update_datetime, n.update_user_id, rowhash
FROM asr_datastore.account_neighborhood n
INNER JOIN asr_datastore.account a
	  ON n.account_no = a.account_no
	  AND a.account_status = 'A';





