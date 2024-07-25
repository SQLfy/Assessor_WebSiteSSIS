
CREATE PROCEDURE [dbo].[usp_webetl_update]
(
	@ETL_NAME			VARCHAR(50),
	@PARAMETER_VALUE	VARCHAR(100),
	@DEBUG				BIT = 0  -- 0=False anything else is true
)
AS
BEGIN
/**************************************************************************************************
Description:	Updates the WebETL table based on the passed in parameters
Usage:			exec dbo.usp_webetl_update 'Tax Year', '2022', -1
--------------------------------------------------------------------------------------------------
Date:		Name:		Comments:
20211224    RGreenfield Initial Creation    	  
**************************************************************************************************/
	SET NOCOUNT ON;

	DECLARE @CurrentValue VARCHAR(100)

	-- values before the change
	-- [PARAMETER_NAME], [PARAMETER_VALUE], [PARAMETER_DESCR], [CREATE_DTM], [CREATE_USER_ID], [UPDATE_DTM], [UPDATE_USER_ID]
	SELECT @CurrentValue = PARAMETER_VALUE FROM dbo.WebETL WHERE ETL_NAME = @ETL_NAME

	IF (@DEBUG = 0)
	BEGIN
		IF (@CurrentValue <> @PARAMETER_VALUE)
		BEGIN
			UPDATE	dbo.WebETL
			SET		PARAMETER_VALUE	=	@PARAMETER_VALUE
			WHERE	ETL_NAME	=	@ETL_NAME
			--AND		PARAMETER_VALUE	<>	@PARAMETER_VALUE

			-- values after the change
			SELECT * FROM dbo.WebETL WHERE ETL_NAME = @ETL_NAME
		END
	END
	ELSE
	BEGIN
		-- DEBUG
		IF (@CurrentValue <> @PARAMETER_VALUE)
		BEGIN
			SELECT 'DEBUG' [New], ETL_NAME, PARAMETER_VALUE [OriginalValue], @PARAMETER_VALUE [NewValue] FROM dbo.WebETL WHERE ETL_NAME = @ETL_NAME
		END
		ELSE
			SELECT CONCAT('DEBUG  Parm Name: ', @ETL_NAME, '  Parm Value: ', @PARAMETER_VALUE, '  (No Change)') [Same]
	END
END
