
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account Neighborhood Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountNeighborhoodData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountNeighborhoodData

    INSERT INTO asr_api_test.AccountNeighborhoodData
    SELECT an.account_no as accountNo,
       an.neighborhood_code as code,
	   an.neighborhood_extension as extension
    FROM asr_app.account_neighborhood an
END

