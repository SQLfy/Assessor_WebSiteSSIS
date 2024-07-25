

--EXEC [asr_adv_search_query].[usp_create_flat_account]

CREATE PROCEDURE [asr_adv_search_query].[usp_create_flat_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/11/2018
Developer:     Christine Lin
Comments:      create a table to store the result from the 
               [asr_adv_search_query].[v_flat_account] view for better query performance
Mod Date:      5/12/2021
Developer:     Christine Lin
Comments:	   renamed 'subdivision' to 'subdivision_name' 
               and 'filing' to 'filing_no'
*************************************************************************************/
AS
BEGIN
SET NOCOUNT ON;
SET ANSI_WARNINGS OFF;
IF OBJECT_ID(N'asr_adv_search_query.flat_account', N'U') IS NULL
  BEGIN
    SELECT 
       account_no
	 , state_parcel_no
	 , tax_district_no
	 , sub_filing_recording_no
	 , account_type
	 , appraisal_type
	 , account_status
	 , account_status_description
	 , legal_description
	 , longitude_x
	 , latitude_y
	 , location
	 , create_datetime
	 , create_user_id
	 , update_datetime
	 , update_user_id
	 , rowhash
	 , elevation_z
	 , bldg_permit_auth_id
	 , quarter
	 , section
	 , township
	 , range
	 , primary_owner_name
	 , primary_owner_address
	 , actual_value_sum
	 , assessed_value_sum
	 , net_acres_sum
	 , subdivision_name  --used to be subdivision
	 , filing_no -- used to be filing
	 , primary_property_unit_no
	 , primary_property_address_number
	 , primary_property_address_number_suffix
	 , primary_property_pre_direction_code
	 , primary_property_street_name
	 , primary_property_street_type_code
	 , primary_property_post_direction_code
	 , primary_property_city
	 , primary_property_zip_code
	 , lot
	 , tract
	 , block
	 , recording_nos
	 , tax_authority_nos	
	 , land_attributes 
    INTO asr_adv_search_query.flat_account
    FROM asr_adv_search_query.v_flat_account;

--create a primary key
    ALTER TABLE asr_adv_search_query.flat_account   
          ADD CONSTRAINT pk_flat_account PRIMARY KEY CLUSTERED (account_no);  
  END
ELSE
  BEGIN
    TRUNCATE TABLE asr_adv_search_query.flat_account;
    INSERT INTO asr_adv_search_query.flat_account
     (account_no
	 , state_parcel_no
	 , tax_district_no
	 , sub_filing_recording_no
	 , account_type
	 , appraisal_type
	 , account_status
	 , account_status_description
	 , legal_description
	 , longitude_x
	 , latitude_y
	 , location
	 , create_datetime
	 , create_user_id
	 , update_datetime
	 , update_user_id
	 , rowhash
	 , elevation_z
	 , bldg_permit_auth_id
	 , quarter
	 , section
	 , township
	 , range
	 , primary_owner_name
	 , primary_owner_address
	 , actual_value_sum
	 , assessed_value_sum
	 , net_acres_sum
	 , subdivision
	 , filing
	 , primary_property_unit_no
	 , primary_property_address_number
	 , primary_property_address_number_suffix
	 , primary_property_pre_direction_code
	 , primary_property_street_name
	 , primary_property_street_type_code
	 , primary_property_post_direction_code
	 , primary_property_city
	 , primary_property_zip_code
	 , lot
	 , tract
	 , block
	 , recording_nos
	 , tax_authority_nos
	 , land_attributes
	 )
    SELECT 
       account_no
	 , state_parcel_no
	 , tax_district_no
	 , sub_filing_recording_no
	 , account_type
	 , appraisal_type
	 , account_status
	 , account_status_description
	 , legal_description
	 , longitude_x
	 , latitude_y
	 , location
	 , create_datetime
	 , create_user_id
	 , update_datetime
	 , update_user_id
	 , rowhash
	 , elevation_z
	 , bldg_permit_auth_id
	 , quarter
	 , section
	 , township
	 , range
	 , primary_owner_name
	 , primary_owner_address
	 , actual_value_sum
	 , assessed_value_sum
	 , net_acres_sum
	 , subdivision_name  --used to be subdivision
	 , filing_no -- used to be filing
	 , primary_property_unit_no
	 , primary_property_address_number
	 , primary_property_address_number_suffix
	 , primary_property_pre_direction_code
	 , primary_property_street_name
	 , primary_property_street_type_code
	 , primary_property_post_direction_code
	 , primary_property_city
	 , primary_property_zip_code
	 , lot
	 , tract
	 , block
	 , recording_nos
	 , tax_authority_nos	
	 , land_attributes 
   FROM asr_adv_search_query.v_flat_account; 
  END
END

