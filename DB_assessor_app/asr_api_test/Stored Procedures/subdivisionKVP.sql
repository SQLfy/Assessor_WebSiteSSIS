
CREATE PROCEDURE [asr_api_test].[subdivisionKVP]

AS
	
BEGIN
	SELECT DISTINCT qq.subdivision_no, qq.subdivision_name
	FROM asr_app.sub_filing qq
	WHERE qq.subdivision_name is not null 
	AND CHARINDEX(SUBSTRING(qq.subdivision_name,1,1),'1234567890') = 0
	ORDER BY qq.subdivision_name ASC
END
