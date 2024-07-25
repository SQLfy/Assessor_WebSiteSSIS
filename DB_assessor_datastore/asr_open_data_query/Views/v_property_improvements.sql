


CREATE VIEW [asr_open_data_query].[v_property_improvements]
AS
SELECT     ImprovementKey, ACCOUNT_NO, BUILDING_ID, STYLE, OCCUPANCY_CODE, BUILT_AS_CODE, BUILT_AS, QUALITY_CODE, PROPERTY_TYPE_CODE, IMPROVEMENT_SF, COMPLETION_PERCENT, UNIT_TYPE, NO_OF_FIREPLACE, TOTAL_GARAGE_SF, 
                  WALKOUT_BASEMENT_FLAG, TOTAL_PORCH_SF, TOTAL_FINISHED_BASEMENT_SF, TOTAL_UNFINISHED_BASEMENT_SF, ROOF_CONSTRUCTION_TYPE_CODE, BUILT_AS_SF, EXTERIOR_CONSTRUCTION_TYPE, INTERIOR_FINISH_TYPE, NO_OF_STORY, 
                  ROOF_MATERIAL_CODE, FLOOR_MATERIAL_TYPE_CODE, NO_OF_BEDROOM, NO_OF_BATHROOM, BUILT_YEAR, REMODELED_YEAR, LENGTH_OF_MOBILE_HOME, WIDTH_OF_MOBILE_HOME, AVERAGE_STORY_HEIGHT, NO_OF_UNIT, 
                  SPRINKLER_COVERAGE_SF, CONDITION, HVAC, Location
FROM        (SELECT     ImprovementKey, ACCOUNT_NO, BUILDING_ID, STYLE, OCCUPANCY_CODE, BUILT_AS_CODE, BUILT_AS, QUALITY_CODE, PROPERTY_TYPE_CODE, IMPROVEMENT_SF, COMPLETION_PERCENT, UNIT_TYPE, NO_OF_FIREPLACE, TOTAL_GARAGE_SF, 
                                     WALKOUT_BASEMENT_FLAG, TOTAL_PORCH_SF, TOTAL_FINISHED_BASEMENT_SF, TOTAL_UNFINISHED_BASEMENT_SF, ROOF_CONSTRUCTION_TYPE_CODE, BUILT_AS_SF, EXTERIOR_CONSTRUCTION_TYPE, INTERIOR_FINISH_TYPE, 
                                     NO_OF_STORY, ROOF_MATERIAL_CODE, FLOOR_MATERIAL_TYPE_CODE, NO_OF_BEDROOM, NO_OF_BATHROOM, BUILT_YEAR, REMODELED_YEAR, LENGTH_OF_MOBILE_HOME, WIDTH_OF_MOBILE_HOME, AVERAGE_STORY_HEIGHT, 
                                     NO_OF_UNIT, SPRINKLER_COVERAGE_SF, CONDITION, HVAC, Location, ROW_NUMBER() OVER (PARTITION BY ImprovementKey
                   ORDER BY Built_Year DESC) AS DedupKey
FROM        (SELECT DISTINCT 
                                     imp.account_no AS ACCOUNT_NO, imp.improvement_no AS BUILDING_ID, impocc.occupancy_code_description AS style, impocc.occupancy_code, impba.built_as_code, impba.built_as_code_description AS BUILT_AS, 
                                     imp.improvement_quality AS quality_code, imp.property_type AS property_type_code, imp.improvement_sf, FLOOR(imp.completed_percent * 100) AS completion_percent, imp.improvement_unit_type AS unit_type, 
                                     FLOOR(ISNULL(impdet1.no_of_fireplaces, 0)) AS no_of_fireplace, FLOOR(ISNULL(impdet2.total_garage_sf, 0)) AS total_garage_sf, ISNULL(impdet3.walkout_basement_flag, 'N') AS walkout_basement_flag, FLOOR(ISNULL(impdet4.total_porch_sf, 0)) 
                                     AS total_porch_sf, FLOOR(ISNULL(impdet5.total_finished_basement_sf, 0)) AS total_finished_basement_sf, FLOOR(ISNULL(impdet6.total_unfinished_basement_sf, 0)) AS total_unfinished_basement_sf, 
                                     impba.roof_construction_type AS roof_construction_type_code, impba.built_as_sf, impba.exterior_construction_type, impba.interior_finish_type, FLOOR(ISNULL(impba.no_of_story, 0)) AS no_of_story, impba.roof_material_type AS roof_material_code, 
                                     impba.floor_material_type AS floor_material_type_code, FLOOR(ISNULL(impba.bedroom_count, 0)) AS no_of_bedroom, FLOOR(ISNULL(impba.bathroom_count, 0)) AS no_of_bathroom, impba.built_year, impba.remodeled_year, 
                                     CASE WHEN LEFT(imp.account_no, 1) = 'M' THEN impba.built_as_length ELSE 0 END AS length_of_mobile_home, CASE WHEN LEFT(imp.account_no, 1) = 'M' THEN impba.built_as_width ELSE 0 END AS width_of_mobile_home, 
                                     impba.typical_story_height AS average_story_height, impba.total_unit_count AS no_of_unit, impba.sprinkler_coverage_sf, imp.condition_type AS condition, impba.heat_type AS hvac, (ISNULL(cast(imp.account_no AS varchar(max)), '') 
                                     + ISNULL(cast(imp.improvement_no AS varchar(max)), '') + ISNULL(cast(impocc.occupancy_code AS varchar(max)), '') + ISNULL(cast(impba.built_as_code AS varchar(max)), '') + ISNULL(cast(impba.roof_construction_type AS varchar(max)), '') 
                                     + ISNULL(cast(impba.built_year AS varchar(max)), '')) AS improvementkey
                   FROM        [assessor_datastore].[asr_datastore].[improvement] imp INNER JOIN
                                      [assessor_datastore].[asr_datastore].account acc ON imp.account_no = acc.account_no INNER JOIN
                                      [assessor_datastore].[asr_datastore].improvement_built_as impba ON imp.account_no = impba.account_no AND imp.improvement_no = impba.improvement_no INNER JOIN
                                      [assessor_datastore].[asr_datastore].improvement_occupancy impocc ON imp.account_no = impocc.account_no AND imp.improvement_no = impocc.improvement_no LEFT JOIN
                                         (SELECT     account_no, improvement_no, SUM(detail_unit_count) AS no_of_fireplaces
                                          FROM        [assessor_datastore].[asr_datastore].[improvement_detail]
                                          WHERE     addon_code IN ('95', '285', '290')
                                          GROUP BY account_no, improvement_no) impdet1 ON imp.account_no = impdet1.account_no AND imp.improvement_no = impdet1.improvement_no LEFT JOIN
                                         (SELECT     account_no, improvement_no, SUM(detail_unit_count) AS total_garage_sf
                                          FROM        [assessor_datastore].[asr_datastore].[improvement_detail]
                                          WHERE     improvement_detail_type = 'Garage'
                                          GROUP BY account_no, improvement_no) impdet2 ON imp.account_no = impdet2.account_no AND imp.improvement_no = impdet2.improvement_no LEFT JOIN
                                         (SELECT     account_no, improvement_no, CASE WHEN COUNT(improvement_detail_type_description) = 0 THEN 'N' ELSE 'Y' END AS Walkout_basement_flag
                                          FROM        [assessor_datastore].[asr_datastore].[improvement_detail]
                                          WHERE     improvement_detail_type = 'Basement' AND improvement_detail_type_description = 'Walkout'
                                          GROUP BY account_no, improvement_no) impdet3 ON imp.account_no = impdet3.account_no AND imp.improvement_no = impdet3.improvement_no LEFT JOIN
                                         (SELECT     account_no, improvement_no, SUM(detail_unit_count) AS total_porch_sf
                                          FROM       [assessor_datastore].[asr_datastore].[improvement_detail]
                                          WHERE     improvement_detail_type = 'Porch'
                                          GROUP BY account_no, improvement_no) impdet4 ON imp.account_no = impdet4.account_no AND imp.improvement_no = impdet4.improvement_no LEFT JOIN
                                         (SELECT     account_no, improvement_no, SUM(detail_unit_count) AS total_finished_basement_sf
                                          FROM        [assessor_datastore].[asr_datastore].[improvement_detail]
                                          WHERE     improvement_detail_type = 'Basement' AND improvement_detail_type_description = 'Finished'
                                          GROUP BY account_no, improvement_no) impdet5 ON imp.account_no = impdet5.account_no AND imp.improvement_no = impdet5.improvement_no LEFT JOIN
                                         (SELECT     account_no, improvement_no, SUM(detail_unit_count) AS total_unfinished_basement_sf
                                          FROM       [assessor_datastore].[asr_datastore].[improvement_detail]
                                          WHERE     improvement_detail_type = 'Basement' AND improvement_detail_type_description <> 'Finished' AND improvement_detail_type_description <> 'Walkout' AND improvement_detail_type_description <> 'Garden Level' AND 
                                                            improvement_detail_type_description <> 'Minimal Finish' AND improvement_detail_type_description <> 'Fair Finish'
                                          GROUP BY account_no, improvement_no) impdet6 ON imp.account_no = impdet6.account_no AND imp.improvement_no = impdet6.improvement_no
                   WHERE     acc.account_status = 'A') a LEFT OUTER JOIN
                      (SELECT     *
                       FROM        (SELECT     Account_Number, location, row_number() OVER (partition BY Account_Number
                                          ORDER BY location) AS orderval
                       FROM        location.location_data) ld
WHERE     orderval = 1) b ON a.Account_NO = b.Account_Number) x
