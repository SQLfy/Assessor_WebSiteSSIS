
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account NonPrimary Owner Address Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountNonPrimaryOwnerAddressData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountNonPrimaryOwnerAddressData
    INSERT INTO asr_api_test.AccountNonPrimaryOwnerAddressData
    SELECT aoa.account_no as accountNo,
       aoa.private_flag as isPrivate,
       aoa.owner_name as name,
       aoa.address_line_1 as street,
	   aoa.address_line_2 as street2,
	   aoa.city_name as city,
	   aoa.state as state,
	   aoa.zip_code as zipCode
    FROM asr_app.account_owner_address aoa
    WHERE aoa.primary_owner_flag  <> 1
END

