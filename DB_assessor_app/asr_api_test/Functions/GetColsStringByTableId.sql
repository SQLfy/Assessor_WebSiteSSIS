

CREATE FUNCTION asr_api_test.GetColsStringByTableId
(
	-- Add the parameters for the function here
	@tableId int
)
RETURNS varchar(8000)
AS
BEGIN
	declare @tmp varchar(250)
	declare @result varchar(8000)

	SET @tmp = ''
	select @tmp = @tmp + name + ', '  from syscolumns
	where id = @tableId


	select @result = (select SUBSTRING(@tmp, 0, LEN(@tmp)))
	
	RETURN @result

END