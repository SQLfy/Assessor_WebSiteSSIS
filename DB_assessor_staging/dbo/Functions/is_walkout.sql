


CREATE FUNCTION [dbo].[is_walkout]
(
	@in_accountno                             VARCHAR(20) 
)
RETURNS  VARCHAR(1) 

AS 

BEGIN
		
		DECLARE @lv_walkoutcount        NUMERIC(15,2) 
		DECLARE @lv_iswalkout           VARCHAR(1)
		

	-- NOW FIGURE OUT WALKOUT INFO

		SELECT @lv_walkoutcount  =  COUNT(accountno)
			FROM  asr_staging.t_imps_basement 
		    WHERE accountno  = @in_accountno
			  and  inventorydetaildescription = 'Walkout'
		
		IF @lv_walkoutcount = 0 
		
		BEGIN 
			SELECT @lv_iswalkout = 'N' --RETURN 'N'
		END

		ELSE

		BEGIN 
			SELECT @lv_iswalkout = 'Y'  --RETURN 'Y'
		END

		RETURN @lv_iswalkout
   END

