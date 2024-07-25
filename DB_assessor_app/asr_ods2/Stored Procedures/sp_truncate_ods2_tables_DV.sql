






CREATE PROCEDURE [asr_ods2].[sp_truncate_ods2_tables_DV]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     10/25/2016
Developer:    TONY GOLDEN
Comments:	  Initial creation
              DELETE DATA FROM ALL ODS2 TABLES BEFORE LOADING AGAIN
*************************************************************************************/



delete from [assessor_app].[asr_ods2].[account_neighborhood]
delete from [assessor_app].[asr_ods2].[account_owner_address]
delete from [assessor_app].[asr_ods2].[account_property_address]
delete from [assessor_app].[asr_ods2].[etl_parameter]
delete from [assessor_app].[asr_ods2].[tax_district_authority]
delete from [assessor_app].[asr_ods2].[tax_district]
delete from [assessor_app].[asr_ods2].[tax_authority]
delete from [assessor_app].[asr_ods2].[sub_filing]
delete from [assessor_app].[asr_ods2].[account]

