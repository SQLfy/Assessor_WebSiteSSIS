
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account Land Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountLandData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountLandData

    INSERT INTO asr_api_test.AccountLandData
    SELECT DISTINCT la.account_no as accountNo,
       lat.attribute_type as attributeType,
	   lat.attribute_subtype as attributeTypeDescription,
	   lat.attribute_adjustment as attributeAdjustment,
	   la.abstract_code as segmentAbstractCode,
	   la.abstract_code_description as segmentAbstractCodeDescription,
	   la.land_type as type,
	   la.land_acres as acres,
	   la.land_actual_value as actualValue,
	   la.land_sf as landSf
    FROM asr_app.land_abstract la
    LEFT JOIN asr_app.land_attribute lat ON lat.account_no = la.account_no
END

