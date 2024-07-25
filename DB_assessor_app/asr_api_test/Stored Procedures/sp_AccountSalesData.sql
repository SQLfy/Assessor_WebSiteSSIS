
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account Sales Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountSalesData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountSalesData

    INSERT INTO asr_api_test.AccountSalesData
    SELECT DISTINCT sa.account_no as accountNo,
       sa.recording_no as recordingNumber,
	   s.grantor as grantor,
	   s.grantee as grantee,
	   s.sale_date as date,
	   s.sale_price as price,
	   s.deed_code_description as deedType,
	   s.book as book,
	   s.page as page,
	   s.valid1_flag as isValid1,
	   s.improved_flag as isImproved
    FROM asr_app.sale_account sa
    LEFT JOIN asr_app.sale s ON sa.recording_no = s.recording_no
END

