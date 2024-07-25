
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account PlattedLot Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountPlattedLotData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountPlattedLotData

    INSERT INTO asr_api_test.AccountPlattedLotData
    SELECT distinct apl.state_parcel_no as stateParcelNo,
	   apl.lot_no as lotNo,
	   apl.tract_no as tractNo,
	   apl.block_no as blockNo
    FROM asr_app.account_platted_lot apl
END

