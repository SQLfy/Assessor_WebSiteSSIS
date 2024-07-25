
CREATE PROCEDURE [asr_api_test].[builtAsKVP]

AS
	
BEGIN
	SELECT DISTINCT qq.built_as_code, qq.built_as_code_description
	FROM [asr_app].[improvement_built_as] qq
	WHERE qq.built_as_code is not null	
	ORDER BY qq.built_as_code_description ASC
END
