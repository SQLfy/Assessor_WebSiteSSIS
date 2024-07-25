


CREATE FUNCTION [dbo].[convert_to_flag]
(
	@in_value                                 VARCHAR(1) 
)
RETURNS VARCHAR(1) 
AS 
	BEGIN
		
		-- main body
		
		--initialize variables here
		
		DECLARE @lv_out_value                             VARCHAR(1) 



		IF @in_value = - 1 OR @in_value = 1 
		BEGIN 
			SELECT @lv_out_value  = 'Y' 
		END
		ELSE
		BEGIN 
			IF @in_value IS NOT NULL 
			BEGIN 
				SELECT @lv_out_value  = 'N' 
			END
   
		END
   
		
		RETURN @lv_out_value

	END



