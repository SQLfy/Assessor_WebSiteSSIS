
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account NonPrimary Property Address Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountNonPrimaryPropertyAddressData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountNonPrimaryPropertyAddressData
    INSERT INTO asr_api_test.AccountNonPrimaryPropertyAddressData
    SELECT apa.account_no as accountNo,
       apa.concatenated_property_address as street,
	   apa.city_name as city,
	   apa.location_zip_code as zipCode
    FROM asr_app.account_property_address apa
    WHERE apa.primary_address_flag  <> 1
END

