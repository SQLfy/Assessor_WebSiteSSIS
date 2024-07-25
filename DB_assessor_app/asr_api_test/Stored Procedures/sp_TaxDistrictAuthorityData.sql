
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Tax District Authority Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_TaxDistrictAuthorityData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.TaxDistrictAuthorityData
    INSERT INTO asr_api_test.TaxDistrictAuthorityData
    SELECT DISTINCT tda.tax_district_no as taxDistrictNo,
       tda.tax_authority_no as taxAuthorityNo,
	   ta.tax_authority_name as taxAuthorityName,
	   ta.contact_person as taxAuthorityPointOfContact,
	   ta.contact_phone as  taxAuthorityContactPhone,
	   ta.contact_address_line_1 as taxAuthorityContactStreet,
	   ta.contact_address_line_2 as taxAuthorityContactStreet2,
	   ta.contact_city_name as taxAuthorityContactCity,
	   ta.contact_zip_code as taxAuthorityZipCode
    FROM asr_app.tax_district_authority tda
    LEFT JOIN asr_app.tax_authority ta ON tda.tax_authority_no = ta.tax_authority_no
END

