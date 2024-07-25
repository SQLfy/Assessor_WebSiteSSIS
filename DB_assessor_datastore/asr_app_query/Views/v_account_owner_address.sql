









CREATE VIEW [asr_app_query].[v_account_owner_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access account_owner_address for active accounts for 
			   loading data into the asssessor_app database
Mod #:  2
Mod Date:      6/22/2016
Developer:     Richard Edwards
Comments:      Add Owner_Name_1 and Ownwr_Name_2 columns
*************************************************************************************/
AS
SELECT oa.account_no, oa.person_code, oa.primary_owner_flag
, oa.owner_name
, oa.owner_name_1 
, oa.owner_name_2
, oa.ownership_percent
, oa.federal_id_no
, oa.address_line_1
, oa.address_line_2
, oa.city_name
, oa.state
, oa.zip_code
, oa.country
, oa.create_datetime
, oa.create_user_id
, oa.update_datetime
, oa.update_user_id
, oa.rowhash
, oa.private_flag
FROM asr_datastore.account_owner_address oa
INNER JOIN asr_datastore.account a
	  ON oa.account_no = a.account_no
	  AND a.account_status = 'A';











