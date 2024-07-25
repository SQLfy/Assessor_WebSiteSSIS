 CREATE VIEW [asr_adv_search_query].[v_fireplace]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/16/2018
Developer:     Christine Lin
Comments:      Initial creation
               Intended to be used by Assessor advanced search JSON file generation
               Provide a view to access the fireplace inforamtion 
			   for active accounts 
			   one row per fireplace type by building by account

*************************************************************************************/
AS
 SELECT 
 D.account_no
,D.improvement_no AS building_id
,CASE WHEN D.improvement_detail_type_description = 'Wood Fireplace' THEN 'wood'
      WHEN D.improvement_detail_type_description = 'Fireplace - Gas' THEN 'gas'
	  ELSE D.improvement_detail_type_description
 END  as fireplace_type
,FLOOR(SUM(D.detail_unit_count)) AS sum_detail_unit_count
FROM asr_datastore.improvement_detail D
INNER JOIN asr_datastore.account AS A 
        ON A.account_no = D.account_no AND A.account_status = 'A'
WHERE 
     d.improvement_detail_type = 'Add On'
 and D.improvement_detail_type_description in ('Wood Fireplace', 'Fireplace - Gas')
--AND D.account_no = 'R0000107'
GROUP BY
 d.account_no
,d.improvement_no
,CASE WHEN D.improvement_detail_type_description = 'Wood Fireplace' THEN 'wood'
      WHEN D.improvement_detail_type_description = 'Fireplace - Gas' THEN 'gas'
	  ELSE D.improvement_detail_type_description
 END 