


-- ======================================================================================
-- Author:		Tony Golden
-- Create date: 1/28/2016
-- Description:	udpate etl parameter table with values from PRRW dbo.WebETL table data. 
--              This parameter data is now being updated by Mark Longacher on prrwsql.
-- =====================================================================================


 
-- =====================================================================================

CREATE PROCEDURE [asr_staging].[update_etl_parameter_table_with_PRRW_OLD]
	
	
AS
BEGIN

DECLARE @v_ext_date_as_text  VARCHAR(12)

SELECT @v_ext_date_as_text = CAST(YEAR(GETDATE()) AS VARCHAR)+RIGHT('0' + RTRIM(MONTH(getdate())), 2)+RIGHT('0' + RTRIM(DAY(getdate())), 2)+'999'

--  Update each individual ETL parameter from corresponding value in PRRW dbo.WebETL parameter table

UPDATE [asr_staging].[etl_parameter] 
SET parameter_value = prrw.parameter_value
FROM (
    SELECT etl_name, parameter_value
    FROM [asr_staging].[PRRW_ETL_Parameters]) prrw
WHERE 
    prrw.etl_name = parameter_name



-- Update Extract dates to today's date
    UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE'
	UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE'


END
	
