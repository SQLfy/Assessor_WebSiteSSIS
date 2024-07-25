

-- =============================================
-- Author:		David Guillen
-- Create date: 01/28/2016
-- Description:	udpate etl parameter table extract ver start and end with completion date
-- =============================================

CREATE PROCEDURE [rw_extract].[update_etl_parameter_table_old]
	-- Add the parameters for the stored procedure here
	
	

AS
BEGIN

	DECLARE @v_ext_date_as_text  VARCHAR(12)

    SELECT @v_ext_date_as_text = CAST(YEAR(GETDATE()) AS VARCHAR)+RIGHT('0' + RTRIM(MONTH(getdate())), 2)+RIGHT('0' + RTRIM(DAY(getdate())), 2)+'999'


    UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE'
	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE'

    UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_LAST_REFREST_START_DATE'
	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_LAST_REFRESH_END_DATE'

	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_HIST_START_DATE'
	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_HIST_END_DATE'



END



