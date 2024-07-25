
CREATE FUNCTION [dbo].[get_garage_sf]
(
	@in_accountno                             VARCHAR(20) 
)
RETURNS FLOAT 
AS 
	BEGIN
		
		DECLARE @lv_detailunitcount  NUMERIC(8,2); 
		
		
		SELECT @lv_detailunitcount = sum(detailunitcount)
		  FROM asr_staging.t_imps_garage
		  WHERE accountno = @in_accountno
		 GROUP BY accountno;
 
    RETURN @lv_detailunitcount;

	END

