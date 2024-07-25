
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account Appeal Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountAppealData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountAppealData

    INSERT INTO asr_api_test.AccountAppealData
    SELECT distinct app.account_no as accountNo,
       app.APPEAL_NO as appealNo,
	   app.APPEAL_DECISION as decision,
	   app.APPEAL_ACCT_REASON_DESC as reason,
	   CAST(app.TAX_YEAR as int) as taxYear
    FROM asr_app.appeal_account app
END

