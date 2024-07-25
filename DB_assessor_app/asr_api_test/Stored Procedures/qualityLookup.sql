-- =============================================
-- Author:		Mike Effen
-- Create date: 2017-06-09
-- Description:	quality lookup
-- =============================================
CREATE PROCEDURE asr_api_test.qualityLookup

AS
	
BEGIN
	SELECT DISTINCT qq.quality
	FROM [asr_api_test].[AccountImprovementData] qq
	WHERE qq.quality is not null	
	ORDER BY qq.quality ASC
END
