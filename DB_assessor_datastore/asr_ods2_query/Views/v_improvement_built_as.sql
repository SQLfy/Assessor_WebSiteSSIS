





CREATE VIEW [asr_ods2_query].[v_improvement_built_as]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access improvement built as data 
			   for loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, improvement_no, built_as_detail_id, built_as_code, built_as_code_description, 
hvac_percent, exterior_construction_type, interior_finish_type, no_of_story, typical_story_height, 
NULL built_as_height, roof_construction_type, roof_material_type, floor_material_type, room_count, 
bedroom_count, total_unit_count, class_code, class_code_description, built_year, remodeled_year, 
remodeled_percent, effective_age, built_as_sf, sprinkler_coverage_sf, bathroom_count, heat_type, 
create_datetime, create_user_id, update_datetime, update_user_id, rowhash
FROM asr_datastore.improvement_built_as;








