


CREATE VIEW [asr_adv_search_query].[v_building]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/19/2018
Developer:     Christine Lin
Comments:      Initial creation
               Intended to be used by Assessor advanced search JSON file generation
               Provide a view to access the building inforamtion 
			   for active accounts 
			   one row per building by account no

*************************************************************************************/
AS

SELECT 
 I.account_no
,I.improvement_no AS building_number
,I.completed_percent 
,I.improvement_quality AS build_quality
,I.improvement_perimeter AS building_perimeter
,I.property_type
,I.condition_type
,I.approach_type
,I.primary_flag
,I.improvement_unit_type AS building_unit_type
,I.improvement_sf AS above_grade_square_feet
,(I.improvement_sf + ISNULL(bd.basement_total_square_feet,0)) AS square_feet_with_basement
,bd.basement_total_square_feet AS basement_total_square_feet
,bd.basement_finished_square_feet
,(I.improvement_sf + ISNULL(bd.basement_finished_square_feet,0)) AS total_finished_square_feet
,bd.basement_garden_level
,bd.basement_walkout
,ifp.fireplaces
,ibf.features
,g.garage_total_sf
,p.porch_total_sf
FROM asr_datastore.improvement AS I
INNER JOIN asr_datastore.account AS A 
        ON A.account_no = I.account_no AND A.account_status = 'A'
LEFT OUTER JOIN ( --basement details
                  SELECT account_no, building_id, basement_total_square_feet, basement_finished_square_feet, basement_garden_level, basement_walkout
				  FROM asr_adv_search_query.v_basement
                ) bd ON bd.account_no = I.account_no
				      AND bd.building_id = I.improvement_no
LEFT OUTER JOIN (-- comma separated fireplaces details
				SELECT
					a.account_no,
					a.building_id,
					fireplaces =
								  STUFF((SELECT ',' + concat(b.fireplace_type ,
								                            ' : ', 
															  CAST(b.sum_detail_unit_count AS VARCHAR(6))
															)
										 FROM asr_adv_search_query.v_fireplace b
										 WHERE b.account_no = a.account_no
										   AND b.building_id = a.building_id
										   ORDER BY b.fireplace_type
										 FOR XML PATH ('')), 1, 1, '')
				FROM asr_adv_search_query.v_fireplace a
				GROUP BY a.account_no, a.building_id
                ) as ifp
ON ifp.account_no = i.account_no
AND ifp.building_id = i.improvement_no
LEFT OUTER JOIN (-- comma separated building features
				SELECT
					a.account_no,
					a.building_id,
					features =
								  STUFF((SELECT ',' + b.feature_type 
										 FROM asr_adv_search_query.v_building_feature b
										 WHERE b.account_no = a.account_no
										   AND b.building_id = a.building_id
										   ORDER BY b.feature_type
										 FOR XML PATH ('')), 1, 1, '')
				FROM asr_adv_search_query.v_building_feature a
				GROUP BY a.account_no, a.building_id
                ) as ibf
ON ibf.account_no = i.account_no
AND ibf.building_id = i.improvement_no
LEFT OUTER JOIN (
				select account_no, improvement_no, sum(detail_unit_count) as garage_total_sf
				from asr_datastore.improvement_detail
				where improvement_detail_type = 'Garage'
				group by account_no, improvement_no
				) as g
ON I.account_no = g.account_no 
AND I.improvement_no = g.improvement_no
LEFT OUTER JOIN (
				select account_no, improvement_no, sum(detail_unit_count) as porch_total_sf
				from asr_datastore.improvement_detail
				where improvement_detail_type = 'Porch'
				group by account_no, improvement_no
				) as p
ON I.account_no = p.account_no 
AND I.improvement_no = p.improvement_no

