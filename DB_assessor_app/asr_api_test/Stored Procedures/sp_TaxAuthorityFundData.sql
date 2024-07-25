
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Tax Authority Fund Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_TaxAuthorityFundData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.TaxAuthorityFundData

    INSERT INTO asr_api_test.TaxAuthorityFundData
    SELECT DISTINCT ta.tax_authority_no as taxAuthorityId,
       taf.tax_fund_code as fundCode,
	   taf.tax_fund_description as description,
	   taf.assessed_mill_levy as millLevy
    FROM asr_app.tax_authority ta
    LEFT JOIN asr_app.tax_authority_fund taf ON ta.tax_authority_no = taf.tax_authority_no
END

