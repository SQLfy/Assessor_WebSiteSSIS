




-- ======================================================================================
-- Author:		Tony Golden
-- Create date: 1/28/2016
-- Description:	udpate etl parameter table with values from rw_extract dbo.WebETL table data. 
--              This parameter data is now being updated by Mark Longacher on PRREALWARE-SQL.
-- Edit Date:   12/7/2018
-- Edit Desc:   Move ETL parameters from PRRW to rw_extract
-- =====================================================================================


 
-- =====================================================================================

CREATE PROCEDURE [asr_staging].[update_etl_parameter_table_with_rw_extract]
	
	
AS
BEGIN

DECLARE @v_ext_date_as_text  VARCHAR(12)

SELECT @v_ext_date_as_text = CAST(YEAR(GETDATE()) AS VARCHAR)+RIGHT('0' + RTRIM(MONTH(getdate())), 2)+RIGHT('0' + RTRIM(DAY(getdate())), 2)+'999'

--  Update each individual ETL parameter from corresponding value in rw_extract dbo.WebETL parameter table

UPDATE [asr_staging].[etl_parameter] 
SET parameter_value = rw_ext.parameter_value
FROM (
    SELECT etl_name, parameter_value
    FROM [asr_staging].[rw_extract_ETL_Parameters]) rw_ext
WHERE 
    rw_ext.etl_name = parameter_name



-- Update Extract dates to today's date
    UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE'
	UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE'


END
	

