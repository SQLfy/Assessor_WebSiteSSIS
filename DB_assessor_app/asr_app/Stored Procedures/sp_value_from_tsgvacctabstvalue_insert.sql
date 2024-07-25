CREATE PROCEDURE [asr_app].[sp_value_from_tsgvacctabstvalue_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:	Mod Date:	Developer:			Comments:
1		9/30/2016	Richard Edwards		Initial creation
										Truncate and Populate [asr_app].[value_from_tsgvacctabstvalue] value table
2		10/7/2016	Richard Edwards		Add net_acres column
3		10/11/2016	Richard Edwards		Add valuation_class_code_description column
4		02/02/2023	Paul Mathews		Add assessment_rate column
*************************************************************************************/
SET NOCOUNT ON;

DECLARE @NPP_Freeze_Flag varchar(1)
DECLARE @NPP_Freeze_Tax_Year numeric(4,0)
DECLARE @PP_Freeze_Flag varchar(1)
DECLARE @PP_Freeze_Tax_Year numeric(4,0)

SELECT  @NPP_Freeze_Flag = parameter_value
FROM [assessor_datastore].[asr_datastore].[etl_parameter]
WHERE PARAMETER_NAME = 'ASR_VALUE_FREEZE_FLAG'

SELECT @NPP_Freeze_Tax_Year = CAST(parameter_value AS numeric(4,0))
FROM [assessor_datastore].[asr_datastore].[etl_parameter]
WHERE PARAMETER_NAME = 'ASR_VALUE_FREEZE_TAX_YEAR' 

SELECT @PP_Freeze_Flag = parameter_value
FROM [assessor_datastore].[asr_datastore].[etl_parameter]
WHERE PARAMETER_NAME = 'ASR_PERS_VALUE_FREEZE_FLAG'

SELECT @PP_Freeze_Tax_Year = CAST(parameter_value AS numeric(4,0))
FROM [assessor_datastore].[asr_datastore].[etl_parameter]
WHERE PARAMETER_NAME = 'ASR_PERS_VALUE_FREEZE_TAX_YEAR' 

-- Clear value table
TRUNCATE TABLE asr_app.value_from_tsgvacctabstvalue

-- Insert values based on NPP_Freeze_Flag setting
IF @NPP_Freeze_Flag = 'Y'
	INSERT INTO [asr_app].[value_from_tsgvacctabstvalue](
		[account_no]
		, [tax_year]
		, [valuation_class_code]
		, [tax_district_no]
		, [raw_assessed_value]
		, [raw_tax_dollars]
		, [actual_value]
		, [mill_levy]
		, [create_datetime]
		, [create_user_id]
		, [account_type]
		, [net_acres]
		, [valuation_class_code_description]
		, assessment_rate
		)
   SELECT 
		account_no
		, tax_year
		, valuation_class_code
		, tax_district_no
		, raw_assessed_value
		, raw_tax_dollars
		, actual_value
		, mill_levy
		, create_datetime
		, create_user_id
		, account_type
		, net_acres
		, valuation_class_code_description 
		, assessment_rate
   FROM   assessor_datastore.asr_app_query.v_value_from_tsgvacctabstvalue  
   WHERE  (tax_year <= @NPP_Freeze_Tax_Year) AND account_no NOT LIKE 'C%' AND account_no NOT LIKE 'P%'
ELSE	    
	INSERT INTO [asr_app].[value_from_tsgvacctabstvalue](
		[account_no]
		, [tax_year]
		, [valuation_class_code]
		, [tax_district_no]
		, [raw_assessed_value]
		, [raw_tax_dollars]
		, [actual_value]
		, [mill_levy]
		, [create_datetime]
		, [create_user_id]
		, [account_type]
		, [net_acres]
		, [valuation_class_code_description]
		, assessment_rate
		)
   SELECT 
		account_no
		, tax_year
		, valuation_class_code
		, tax_district_no
		, raw_assessed_value
		, raw_tax_dollars
		, actual_value
		, mill_levy
		, create_datetime
		, create_user_id
		, account_type
		, net_acres
		, valuation_class_code_description 
		, assessment_rate
   FROM   assessor_datastore.asr_app_query.v_value_from_tsgvacctabstvalue  
   WHERE  (tax_year <= YEAR(GETDATE())) AND account_no NOT LIKE 'C%' AND account_no NOT LIKE 'P%';

-- Insert values based on PP_Freeze_Flag setting
IF @PP_Freeze_Flag = 'Y'
	INSERT INTO [asr_app].[value_from_tsgvacctabstvalue](
		[account_no]
		, [tax_year]
		, [valuation_class_code]
		, [tax_district_no]
		, [raw_assessed_value]
		, [raw_tax_dollars]
		, [actual_value]
		, [mill_levy]
		, [create_datetime]
		, [create_user_id]
		, [account_type]
		, [net_acres]
		, [valuation_class_code_description]
		, assessment_rate
		)
   SELECT 
		account_no
		, tax_year
		, valuation_class_code
		, tax_district_no
		, raw_assessed_value
		, raw_tax_dollars
		, actual_value
		, mill_levy
		, create_datetime
		, create_user_id
		, account_type
		, net_acres
		, valuation_class_code_description 
		, assessment_rate
   FROM   assessor_datastore.asr_app_query.v_value_from_tsgvacctabstvalue  
   WHERE  (tax_year <= @PP_Freeze_Tax_Year) AND account_no LIKE 'P%'
ELSE	    
	INSERT INTO [asr_app].[value_from_tsgvacctabstvalue](
		[account_no]
		, [tax_year]
		, [valuation_class_code]
		, [tax_district_no]
		, [raw_assessed_value]
		, [raw_tax_dollars]
		, [actual_value]
		, [mill_levy]
		, [create_datetime]
		, [create_user_id]
		, [account_type]
		, [net_acres]
		, [valuation_class_code_description]
		, assessment_rate
		)
   SELECT 
		account_no
		, tax_year
		, valuation_class_code
		, tax_district_no
		, raw_assessed_value
		, raw_tax_dollars
		, actual_value
		, mill_levy
		, create_datetime
		, create_user_id
		, account_type
		, net_acres
		, valuation_class_code_description 
		, assessment_rate
   FROM   assessor_datastore.asr_app_query.v_value_from_tsgvacctabstvalue  
   WHERE  (tax_year <= YEAR(GETDATE())) AND account_no LIKE 'P%';



