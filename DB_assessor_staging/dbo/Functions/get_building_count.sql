
CREATE FUNCTION [dbo].[get_building_count]
(
	@in_accountno                             VARCHAR(4000) 
)
RETURNS FLOAT 
AS 
	BEGIN
		
		DECLARE @lv_buildingcount                         NUMERIC(10) 
		SELECT @lv_buildingcount  =  COUNT(impno)
		FROM  asr_staging.s_tblimps 
		WHERE	 accountno  = @in_accountno
		
		
		RETURN @lv_buildingcount

		RETURN @lv_buildingcount

	END



