
CREATE PROCEDURE [asr_api_test].[taxAuthKVP]

AS
	
BEGIN
	SELECT DISTINCT qq.tax_authority_no, qq.tax_authority_name
	FROM asr_app.tax_authority qq
	WHERE qq.tax_authority_name is not null	
	ORDER BY qq.tax_authority_name ASC
END
