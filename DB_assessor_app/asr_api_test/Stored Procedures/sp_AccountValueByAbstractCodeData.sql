
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account Value By Abstract Code Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountValueByAbstractCodeData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountValueByAbstractCodeData

    INSERT INTO asr_api_test.AccountValueByAbstractCodeData
    SELECT DISTINCT av.account_no as accountNo,
       av.tax_year as taxYear,
	   av.valuation_class_code as abstractCode,
	   av.valuation_class_code_description as abstractCodeDescription,
	   av.net_acres as netAcres,
	   av.actual_value as actualValue,
	   av.raw_assessed_value as assessedValue,
	   av.mill_levy as millLevy,
	   av.raw_tax_dollars as taxDollars
    FROM asr_app.value_from_tsgvacctabstvalue av
END

