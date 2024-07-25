








CREATE PROCEDURE [asr_app].[sp_account_property_address_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the account_property_address table

Mod #:  2
Mod Date:     6/24/2016
Developer:    Richard Edwards
Comments:	  Add Concatenated_Property_Address column
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_app.account_property_address AS myTarget
USING assessor_datastore.asr_app_query.v_account_property_address AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.order_no = mySource.order_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.order_no = mySource.order_no
				  ,myTarget.primary_address_flag = mySource.primary_address_flag
				  ,myTarget.building_no = mySource.building_no
				  ,myTarget.unit_no = mySource.unit_no
				  ,myTarget.unit_designator = mySource.unit_designator
				  ,myTarget.address_number = mySource.address_number
				  ,myTarget.address_number_suffix = mySource.address_number_suffix
				  ,myTarget.pre_direction_code = mySource.pre_direction_code
				  ,myTarget.street_name = mySource.street_name
				  ,myTarget.street_type_code = mySource.street_type_code
				  ,myTarget.post_direction_code = mySource.post_direction_code
				  ,myTarget.concatenated_property_address = mySource.concatenated_property_address 
				  ,myTarget.city_name = mySource.city_name
				  ,myTarget.location_zip_code = mySource.location_zip_code
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,order_no
			,primary_address_flag
			,building_no
			,unit_no
			,unit_designator
			,address_number
			,address_number_suffix
			,pre_direction_code
			,street_name
			,street_type_code
			,post_direction_code
			,concatenated_property_address 
			,city_name
			,location_zip_code
			,create_datetime
			,create_user_id
			,rowhash
            
			)
     VALUES (mySource.account_no 
            ,mySource.order_no
			,mySource.primary_address_flag
			,mySource.building_no
			,mySource.unit_no
			,mySource.unit_designator
			,mySource.address_number
			,mySource.address_number_suffix
			,mySource.pre_direction_code
			,mySource.street_name
			,mySource.street_type_code
			,mySource.post_direction_code
			,concatenated_property_address 
			,mySource.city_name
			,mySource.location_zip_code
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;










