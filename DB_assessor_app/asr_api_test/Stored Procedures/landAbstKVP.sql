-- =============================================
-- Author:		Mike Effen
-- Create date: 2017-06-09
-- Description:	Land Abstract lookup
-- =============================================
CREATE PROCEDURE asr_api_test.landAbstKVP

AS
	
BEGIN
	SELECT DISTINCT qq.abstract_code, qq.abstract_code_description
	FROM [asr_app].land_abstract qq
	WHERE qq.abstract_code is not null	
	ORDER BY qq.abstract_code_description ASC
END
