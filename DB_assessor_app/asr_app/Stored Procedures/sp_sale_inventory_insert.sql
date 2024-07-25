
CREATE PROCEDURE [asr_app].[sp_sale_inventory_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the asr_app sale inventory table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_app.sale_inventory AS myTarget
USING assessor_datastore.asr_app_query.v_sale_inventory AS mySource
ON myTarget.recording_no = mySource.recording_no
 AND myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.inventory_effective_date = mySource.inventory_effective_date
                  ,myTarget.adjusted_sale_price = mySource.adjusted_sale_price
                  ,myTarget.time_adjusted_sale_price = mySource.time_adjusted_sale_price
                  ,myTarget.account_type = mySource.account_type
                  ,myTarget.land_economic_area = mySource.land_economic_area
                  ,myTarget.land_economic_area_description = mySource.land_economic_area_description
                  ,myTarget.property_type = mySource.property_type
                  ,myTarget.improvement_condition_type = mySource.improvement_condition_type
                  ,myTarget.improvement_quality = mySource.improvement_quality 
                  ,myTarget.improvement_abstract_code = mySource.improvement_abstract_code
                  ,myTarget.improvement_abstract_code_description = mySource.improvement_abstract_code_description
				  ,myTarget.built_as_description = mySource.built_as_description
                  ,myTarget.built_as_year_built = mySource.built_as_year_built
                  ,myTarget.physical_age = mySource.physical_age
                  ,myTarget.adjusted_year_built = mySource.adjusted_year_built
                  ,myTarget.effective_age = mySource.effective_age
                  ,myTarget.improvement_exterior = mySource.improvement_exterior
                  ,myTarget.class_code = mySource.class_code
                  ,myTarget.class_code_description = mySource.class_code_description
                  ,myTarget.improvement_count = mySource.improvement_count 
                  ,myTarget.built_as_total_unit_count = mySource.built_as_total_unit_count
                  ,myTarget.room_count = mySource.room_count
				  ,myTarget.bedroom_count = mySource.bedroom_count
                  ,myTarget.bath_count = mySource.bath_count
                  ,myTarget.total_improvement_square_footage = mySource.total_improvement_square_footage
                  ,myTarget.residential_square_footage = mySource.residential_square_footage
                  ,myTarget.commercial_square_footage = mySource.commercial_square_footage
                  ,myTarget.outbuilding_square_footage = mySource.outbuilding_square_footage
                  ,myTarget.improvement_built_as_other = mySource.improvement_built_as_other
                  ,myTarget.land_net_square_footage = mySource.land_net_square_footage 
                  ,myTarget.multiple_use_flag = mySource.multiple_use_flag
                  ,myTarget.land_type = mySource.land_type
				  ,myTarget.improvement_unit_type = mySource.improvement_unit_type
                  ,myTarget.improvement_interior = mySource.improvement_interior
                  ,myTarget.roof_cover = mySource.roof_cover
                  ,myTarget.roof_type = mySource.roof_type
                  ,myTarget.neighborhood_code_1 = mySource.neighborhood_code_1
                  ,myTarget.neighborhood_code_2 = mySource.neighborhood_code_2
                  ,myTarget.neighborhood_extension_1 = mySource.neighborhood_extension_1
                  ,myTarget.neighborhood_extension_2 = mySource.neighborhood_extension_2 
                  ,myTarget.outbuilding_count = mySource.outbuilding_count
                  ,myTarget.floor_cover = mySource.floor_cover
				  ,myTarget.occupancy_code_description_1 = mySource.occupancy_code_description_1
                  ,myTarget.occupancy_code_description_2 = mySource.occupancy_code_description_2
                  ,myTarget.total_finished_square_footage = mySource.total_finished_square_footage
                  ,myTarget.total_unfinished_square_footage = mySource.total_unfinished_square_footage
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             recording_no
            ,account_no
            ,inventory_effective_date
            ,adjusted_sale_price
            ,time_adjusted_sale_price
            ,account_type
            ,land_economic_area
            ,land_economic_area_description
            ,property_type
            ,improvement_condition_type
            ,improvement_quality
            ,improvement_abstract_code
            ,improvement_abstract_code_description
            ,built_as_description
            ,built_as_year_built
            ,physical_age
            ,adjusted_year_built
            ,effective_age
            ,improvement_exterior
            ,class_code
            ,class_code_description
            ,improvement_count
            ,built_as_total_unit_count
			,room_count
            ,bedroom_count
            ,bath_count
            ,total_improvement_square_footage
            ,residential_square_footage
            ,commercial_square_footage
            ,outbuilding_square_footage
            ,improvement_built_as_other
            ,land_net_square_footage
            ,multiple_use_flag
            ,land_type
            ,land_abstract_code
			,land_abstract_code_description
            ,zoning_code
            ,zoning_code_description
            ,platted_flag
            ,land_net_acre_count
            ,hvac_type
            ,improvement_unit_type
            ,improvement_interior
            ,roof_cover
            ,roof_type
            ,neighborhood_code_1
            ,neighborhood_code_2
			,neighborhood_extension_1
            ,neighborhood_extension_2
            ,outbuilding_count
            ,floor_cover
            ,occupancy_code_description_1
            ,occupancy_code_description_2
            ,total_finished_square_footage
            ,total_unfinished_square_footage
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.recording_no
            ,mySource.account_no
            ,mySource.inventory_effective_date
            ,mySource.adjusted_sale_price
            ,mySource.time_adjusted_sale_price
            ,mySource.account_type
            ,mySource.land_economic_area
            ,mySource.land_economic_area_description
            ,mySource.property_type
            ,mySource.improvement_condition_type
            ,mySource.improvement_quality
            ,mySource.improvement_abstract_code
            ,mySource.improvement_abstract_code_description
            ,mySource.built_as_description
            ,mySource.built_as_year_built
            ,mySource.physical_age
            ,mySource.adjusted_year_built
            ,mySource.effective_age
            ,mySource.improvement_exterior
            ,mySource.class_code
            ,mySource.class_code_description
            ,mySource.improvement_count
            ,mySource.built_as_total_unit_count
			,mySource.room_count
            ,mySource.bedroom_count
            ,mySource.bath_count
            ,mySource.total_improvement_square_footage
            ,mySource.residential_square_footage
            ,mySource.commercial_square_footage
            ,mySource.outbuilding_square_footage
            ,mySource.improvement_built_as_other
            ,mySource.land_net_square_footage
            ,mySource.multiple_use_flag
            ,mySource.land_type
            ,mySource.land_abstract_code
			,mySource.land_abstract_code_description
            ,mySource.zoning_code
            ,mySource.zoning_code_description
            ,mySource.platted_flag
            ,mySource.land_net_acre_count
            ,mySource.hvac_type
            ,mySource.improvement_unit_type
            ,mySource.improvement_interior
            ,mySource.roof_cover
            ,mySource.roof_type
            ,mySource.neighborhood_code_1
            ,mySource.neighborhood_code_2
			,mySource.neighborhood_extension_1
            ,mySource.neighborhood_extension_2
            ,mySource.outbuilding_count
            ,mySource.floor_cover
            ,mySource.occupancy_code_description_1
            ,mySource.occupancy_code_description_2
            ,mySource.total_finished_square_footage
            ,mySource.total_unfinished_square_footage
	        ,mySource.create_datetime
			,mySource.create_user_id
	        ,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

