





CREATE VIEW [asr_app_query].[v_account_property_address_old]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access account_property_address for active accounts for 
			   loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT pa.account_no, pa.order_no, pa.primary_address_flag, pa.building_no, pa.unit_no, pa.unit_designator, 
pa.address_number, pa.address_number_suffix, pa.pre_direction_code, pa.street_name, pa.street_type_code, 
pa.post_direction_code, pa.city_name, pa.location_zip_code, 
pa.create_datetime, pa.create_user_id, pa.update_datetime, pa.update_user_id, pa.rowhash
FROM asr_datastore.account_property_address pa
INNER JOIN asr_datastore.account a
	  ON pa.account_no = a.account_no
	  AND a.account_status = 'A';








