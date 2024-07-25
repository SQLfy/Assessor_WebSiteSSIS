


CREATE VIEW [asr_adv_search_query].[v_basement]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/19/2018
Developer:     Christine Lin
Comments:      Initial creation
               Intended to be used by Assessor advanced search JSON file generation
               Provide a view to access the basement inforamtion 
			   for active accounts 
			   one row per building by account

*************************************************************************************/
AS
SELECT
   account_no
  ,building_id
  ,basement_total_square_feet
  ,basement_finished_square_feet
  ,CASE WHEN basement_garden_level > 0 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS basement_garden_level
  ,CASE WHEN basement_walkout > 0 THEN CAST(1 AS bit) ELSE CAST(0 AS bit) END AS basement_walkout
FROM 
( --source
SELECT 
 D.account_no
,D.improvement_no AS building_id
,CASE WHEN D.improvement_detail_type_description LIKE 'Bsmnt%' THEN 'basement_total_square_feet'
      WHEN D.improvement_detail_type_description = 'Finished' THEN 'basement_finished_square_feet'
      WHEN D.improvement_detail_type_description = 'Walkout' THEN 'basement_walkout'
      WHEN D.improvement_detail_type_description = 'Garden Level' THEN 'basement_garden_level'      
 END  AS basement_detail_type_description
,FLOOR(SUM(D.detail_unit_count)) AS sum_detail_unit_count
FROM asr_datastore.improvement_detail D
INNER JOIN asr_datastore.account AS A 
        ON A.account_no = D.account_no AND A.account_status = 'A'
WHERE 
    D.improvement_detail_type = 'Basement'
AND ( D.improvement_detail_type_description IN
      ('Finished', 'Walkout', 'Garden Level')
	  OR D.improvement_detail_type_description LIKE 'Bsmnt%'
	)
--AND D.account_no = 'R0000107'
GROUP BY 
 D.account_no
,D.improvement_no 
,CASE WHEN D.improvement_detail_type_description LIKE 'Bsmnt%' THEN 'basement_total_square_feet'
      WHEN D.improvement_detail_type_description = 'Finished' THEN 'basement_finished_square_feet'
      WHEN D.improvement_detail_type_description = 'Walkout' THEN 'basement_walkout'
      WHEN D.improvement_detail_type_description = 'Garden Level' THEN 'basement_garden_level'      
 END  
 --- end of source
 ) src
PIVOT
(
  SUM(sum_detail_unit_count)
  FOR basement_detail_type_description in ([basement_total_square_feet], [basement_garden_level], [basement_walkout], [basement_finished_square_feet] )
) piv;



