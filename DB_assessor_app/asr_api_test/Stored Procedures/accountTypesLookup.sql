-- =============================================
-- Author:		Mike Effen
-- Create date: 2017-06-09
-- Description:	Account Type Lookup
-- =============================================
CREATE PROCEDURE asr_api_test.[accountTypesLookup]  

AS
	
BEGIN
	SELECT DISTINCT ald.accountType
	FROM asr_api_test.AccountLevelData ald
	ORDER BY ald.accountType ASC
END
