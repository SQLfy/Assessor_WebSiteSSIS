


CREATE FUNCTION [dbo].[udf_GetFreezeFlag] (@Parameter_Name Varchar)
    RETURNS VARCHAR(1)
AS
begin
  declare @Freeze_Flag varchar(1)
  SET @FREEZE_FLAG = (SELECT PARAMETER_VALUE FROM rw_extract.etl_parameter WHERE PARAMETER_NAME = @Parameter_Name);

  return @Freeze_Flag
end 


