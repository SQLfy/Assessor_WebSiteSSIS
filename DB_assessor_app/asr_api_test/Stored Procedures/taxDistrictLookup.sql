
CREATE PROCEDURE [asr_api_test].[taxDistrictLookup]

AS
	
BEGIN
	SELECT DISTINCT qq.taxDistrictNo
	FROM asr_api_test.AccountLevelData qq
	WHERE qq.taxDistrictNo is not null 
	
	ORDER BY qq.taxDistrictNo ASC
END
