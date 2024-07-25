








CREATE VIEW [asr_datastore].[tool_show_record_count]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/1/2016
Developer:     Christine Lin
Comments:      Initial creation
               List table record counts
Mod #:  2
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      added parcel details related tables
*************************************************************************************/
AS
SELECT 'asr_datastore.account' AS table_name, COUNT(1) AS record_count
FROM [asr_datastore].[account] 
UNION ALL
SELECT 'asr_datastore.account_neighborhood', COUNT(1) AS record_count
FROM [asr_datastore].[account_neighborhood]
UNION ALL
SELECT 'asr_datastore.account_owner_address', COUNT(1) AS record_count
FROM [asr_datastore].[account_owner_address]
UNION ALL
SELECT 'asr_datastore.account_property_address', COUNT(1) AS record_count
FROM [asr_datastore].[account_property_address]
UNION ALL
SELECT 'asr_datastore.sub_filing', COUNT(1) AS record_count
FROM [asr_datastore].[sub_filing]
UNION ALL
SELECT 'asr_datastore.tax_authority', COUNT(1) AS record_count
FROM [asr_datastore].[tax_authority]
UNION ALL
SELECT 'asr_datastore.tax_district', COUNT(1) AS record_count
FROM [asr_datastore].[tax_district]
UNION ALL
SELECT 'asr_datastore.tax_district_authority', COUNT(1) AS record_count
FROM [asr_datastore].[tax_district_authority]
UNION ALL
SELECT 'asr_datastore.improvement', COUNT(1) AS record_count
FROM [asr_datastore].[improvement]
UNION ALL
SELECT 'asr_datastore.improvement_built_as', COUNT(1) AS record_count
FROM [asr_datastore].[improvement_built_as]
UNION ALL
SELECT 'asr_datastore.improvement_detail', COUNT(1) AS record_count
FROM [asr_datastore].[improvement_detail]
UNION ALL
SELECT 'asr_datastore.improvement_occupancy', COUNT(1) AS record_count
FROM [asr_datastore].[improvement_occupancy]
UNION ALL
SELECT 'asr_datastore.land_abstract', COUNT(1) AS record_count
FROM [asr_datastore].[land_abstract]
UNION ALL
SELECT 'asr_datastore.real_account', COUNT(1) AS record_count
FROM [asr_datastore].[real_account]
UNION ALL
SELECT 'asr_datastore.sale', COUNT(1) AS record_count
FROM [asr_datastore].[sale]
UNION ALL
SELECT 'asr_datastore.sale_account', COUNT(1) AS record_count
FROM [asr_datastore].[sale_account]
UNION ALL
SELECT 'asr_datastore.tax_authority_fund', COUNT(1) AS record_count
FROM [asr_datastore].[tax_authority_fund]
;







