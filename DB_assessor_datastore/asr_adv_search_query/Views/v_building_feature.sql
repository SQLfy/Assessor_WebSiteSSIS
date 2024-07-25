CREATE VIEW [asr_adv_search_query].[v_building_feature]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/16/2018
Developer:     Christine Lin
Comments:      Initial creation
               Intended to be used by Assessor advanced search JSON file generation
               Provide a view to access the features inforamtion 
			   for active accounts 
			   one row per distinct feature by building by account

*************************************************************************************/
AS
select distinct
 d.account_no
,d.improvement_no as building_id
,d.improvement_detail_type as feature_type
FROM asr_datastore.improvement_detail D
INNER JOIN asr_datastore.account AS A 
        ON A.account_no = D.account_no AND A.account_status = 'A'
WHERE 
    D.improvement_detail_type in ('Balcony','Carport','Mezzanine','Rough In','Storage')
UNION
select DISTINCT
 d.account_no
,d.improvement_no
,d.improvement_detail_type_description as feature_type
FROM asr_datastore.improvement_detail D
INNER JOIN asr_datastore.account AS A 
        ON A.account_no = D.account_no AND A.account_status = 'A'
WHERE 
    D.improvement_detail_type = 'Add On'
AND D.improvement_detail_type_description NOT LIKE '%Fireplace%'

