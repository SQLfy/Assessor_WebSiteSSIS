



CREATE PROCEDURE [trn].[sp_improvement_built_as_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/3/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the improvement_build_as table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.improvement_built_as AS myTarget
USING trn.v_etl_improvement_built_as AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
AND myTarget.built_as_detail_id = mySource.built_as_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.built_as_detail_id = mySource.built_as_detail_id
                  ,myTarget.built_as_code = mySource.built_as_code 
                  ,myTarget.built_as_code_description = mySource.built_as_code_description
                  ,myTarget.hvac_percent = mySource.hvac_percent
                  ,myTarget.exterior_construction_type = mySource.exterior_construction_type
                  ,myTarget.interior_finish_type = mySource.interior_finish_type
                  ,myTarget.no_of_story = mySource.no_of_story
                  ,myTarget.typical_story_height = mySource.typical_story_height
                  ,myTarget.roof_construction_type = mySource.roof_construction_type
                  ,myTarget.roof_material_type = mySource.roof_material_type
                  ,myTarget.floor_material_type = mySource.floor_material_type
                  ,myTarget.room_count = mySource.room_count
                  ,myTarget.bedroom_count = mySource.bedroom_count
                  ,myTarget.total_unit_count = mySource.total_unit_count
                  ,myTarget.class_code = mySource.class_code
                  ,myTarget.class_code_description = mySource.class_code_description
                  ,myTarget.built_year = mySource.built_year
                  ,myTarget.remodeled_year = mySource.remodeled_year
                  ,myTarget.remodeled_percent = mySource.remodeled_percent
                  ,myTarget.effective_age = mySource.effective_age
                  ,myTarget.built_as_sf = mySource.built_as_sf
                  ,myTarget.sprinkler_coverage_sf = mySource.sprinkler_coverage_sf
                  ,myTarget.bathroom_count = mySource.bathroom_count
                  ,myTarget.heat_type = mySource.heat_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.primary_flag = mySource.primary_flag
				  ,myTarget.built_as_length = mySource.built_as_length
				  ,myTarget.built_as_width = mySource.built_as_width
				  ,myTarget.built_as_height = mySource.built_as_height
				  ,myTarget.mobile_home_make = mySource.mobile_home_make
				  ,myTarget.mobile_home_model_type = mySource.mobile_home_model_type
				  ,myTarget.mobile_home_skirt = mySource.mobile_home_skirt
				  ,myTarget.mobile_home_skirt_linear_feet = mySource.mobile_home_skirt_linear_feet
				  ,myTarget.mobile_home_wall_type = mySource.mobile_home_wall_type
				  

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             account_no
            ,improvement_no
            ,built_as_detail_id
            ,built_as_code 
            ,built_as_code_description
            ,hvac_percent
            ,exterior_construction_type
            ,interior_finish_type
            ,no_of_story
            ,typical_story_height
            ,roof_construction_type
            ,roof_material_type
            ,floor_material_type
            ,room_count
            ,bedroom_count
            ,total_unit_count
            ,class_code
            ,class_code_description
            ,built_year
            ,remodeled_year
            ,remodeled_percent
            ,effective_age
            ,built_as_sf
            ,sprinkler_coverage_sf
            ,bathroom_count
            ,heat_type
	        ,create_datetime 
			,create_user_id 
	        ,rowhash
			,primary_flag
			,built_as_length 
			,built_as_width 
			,built_as_height
			,mobile_home_make
			,mobile_home_model_type 
			,mobile_home_skirt
			,mobile_home_skirt_linear_feet
			,mobile_home_wall_type
			
            )
     VALUES (
             mySource.account_no
            ,mySource.improvement_no
            ,mySource.built_as_detail_id
            ,mySource.built_as_code 
            ,mySource.built_as_code_description
            ,mySource.hvac_percent
            ,mySource.exterior_construction_type
            ,mySource.interior_finish_type
            ,mySource.no_of_story
            ,mySource.typical_story_height
            ,mySource.roof_construction_type
            ,mySource.roof_material_type
            ,mySource.floor_material_type
            ,mySource.room_count
            ,mySource.bedroom_count
            ,mySource.total_unit_count
            ,mySource.class_code
            ,mySource.class_code_description
            ,mySource.built_year
            ,mySource.remodeled_year
            ,mySource.remodeled_percent
            ,mySource.effective_age
            ,mySource.built_as_sf
            ,mySource.sprinkler_coverage_sf
            ,mySource.bathroom_count
            ,mySource.heat_type
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,mySource.primary_flag
			,mySource.built_as_length
			,mySource.built_as_width
			,mySource.built_as_height
			,mySource.mobile_home_make
			,mySource.mobile_home_model_type
			,mySource.mobile_home_skirt
			,mySource.mobile_home_skirt_linear_feet
			,mySource.mobile_home_wall_type
			
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;






