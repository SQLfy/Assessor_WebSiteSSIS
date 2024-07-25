
-- ======================================================================================
-- Author:		David Guillen
-- Create date: 1/28/2016
-- Description:	udpate etl parameter table extract version start and end date
-- =====================================================================================
--REVISIONS:
--Date        Author           Description
------------- ---------------- --------------------
--08/12/2016  R. Edwards       New
--Add updates of ETL Parameters from Azure database.
--
--02/01/2017  R. Edwards       New
--Add updates for new parameters ASR_REAL_NOV_TITLE and ASR_REAL_NOV_DATE.
--
--03/08/2017  R. Edwards       New
--Add updates for new parameters ASR_ASSESSOR_EMAIL, ASR_ASSESSOR_URL, ASR_ASSESSOR_TITLE, 
--                               ASR_ASSESSOR_NAME, ASR_ASSESSOR_ADDRESS, ASR_ASSESSOR_HOURS, 
--                               ASR_ASSESSOR_PHONE, ASR_ASSESSOR_FAX 
--
--06/26/2017  A. Golden        New
--Add updates for new parameters ASR_NOD_VISIBLE		NULL		Option: Y or N. Used to indicate whether current NOD is visible or not
--								 ASR_NOD_DATE_ODD		9/1			Date for when to display current year NODs in odd years
--								 ASR_NOD_DATE_EVEN		7/1			Date for when to display current year NODs in even years



 
-- =====================================================================================

CREATE PROCEDURE [asr_staging].[update_etl_parameter_table]
	
	
AS
BEGIN

--  Update each individual ETL parameter from corresponding value in Azure ETL parameter table

DECLARE @v_ext_date_as_text  VARCHAR(12)

SELECT @v_ext_date_as_text = CAST(YEAR(GETDATE()) AS VARCHAR)+RIGHT('0' + RTRIM(MONTH(getdate())), 2)+RIGHT('0' + RTRIM(DAY(getdate())), 2)+'999'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),5,2) + '/' +
	                                                SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),7,2) + '/' +
													LEFT(REPLACE(aep.DATE_VALUE,'-',''),4), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_LAST_REFRESH_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CAST(CAST(aep.NUMBER_VALUE AS int) AS varchar), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_LAST_REFRESH_PARENT_AUDIT_ID'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),5,2) + '/' +
	                                                SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),7,2) + '/' +
													LEFT(REPLACE(aep.DATE_VALUE,'-',''),4), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_LAST_REFREST_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CAST(CAST(aep.NUMBER_VALUE AS int) AS varchar), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_MIN_TAX_YEAR'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CASE WHEN aep.BOOLEAN_VALUE = 1 THEN 'Y' ELSE 'N' END, 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_NBHD_FREEZE_FLAG'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CAST(CAST(aep.NUMBER_VALUE AS int) AS varchar), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_NBHD_FREEZE_TAX_YEAR'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_NBHD_FREEZE_VERSION_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_NBHD_FREEZE_VERSION_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = FORMAT(aep.DATE_VALUE, 'MMM dd yyyy') ,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),5,2) + '/' +
	                                                SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),7,2) + '/' +
													LEFT(REPLACE(aep.DATE_VALUE,'-',''),4),
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_HIST_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),5,2) + '/' +
	                                                SUBSTRING(REPLACE(aep.DATE_VALUE,'-',''),7,2) + '/' +
													LEFT(REPLACE(aep.DATE_VALUE,'-',''),4),
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_HIST_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = FORMAT(aep.DATE_VALUE, 'MMM dd yyyy') ,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CASE WHEN aep.BOOLEAN_VALUE = 1 THEN 'Y' ELSE 'N' END, 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_PERS_VALUE_FREEZE_FLAG'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CAST(CAST(aep.NUMBER_VALUE AS int) AS varchar), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_PERS_VALUE_FREEZE_TAX_YEAR'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_PERS_VALUE_FREEZE_VERSION_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_PERS_VALUE_FREEZE_VERSION_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '000',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_SALE_STUDY_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '000',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_SALE_STUDY_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_SMTP_TO_ADDRESS'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CASE WHEN aep.BOOLEAN_VALUE = 1 THEN 'Y' ELSE 'N' END, 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_VALUE_FREEZE_FLAG'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CAST(CAST(aep.NUMBER_VALUE AS int) AS varchar), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASR_VALUE_FREEZE_TAX_YEAR'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_VALUE_FREEZE_VERSION_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_VALUE_FREEZE_VERSION_START_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CAST(CAST(aep.NUMBER_VALUE AS int) AS varchar), 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CASE WHEN aep.BOOLEAN_VALUE = 1 THEN 'Y' ELSE 'N' END, 
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME AND ep.PARAMETER_NAME = 'PROCESS_ASR_HISTORICAL_VALUATION_FLAG'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'SMTP_SERVER'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_REAL_NOV_TITLE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = REPLACE(aep.DATE_VALUE,'-','') + '999',
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_REAL_NOV_DATE'

-- Update Extract dates to today's date
    UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE'
	UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_EMAIL'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_URL'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_TITLE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_NAME'


UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_ADDRESS'


UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_HOURS'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_PHONE'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = aep.TEXT_VALUE,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_ASSESSOR_FAX'

UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = CASE WHEN aep.BOOLEAN_VALUE = 1 THEN 'Y' ELSE 'N' END,
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_NOD_VISIBLE'


UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = cast(aep.TEXT_VALUE +'/'+ cast(year(getdate()) as varchar) as date),
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_NOD_DATE_ODD'


UPDATE
    [asr_staging].[etl_parameter]
SET
    [asr_staging].[etl_parameter].PARAMETER_VALUE = cast(aep.TEXT_VALUE +'/'+ cast(year(getdate()) as varchar) as date),
	[asr_staging].[etl_parameter].UPDATE_DTM = GETDATE(),
	[asr_staging].[etl_parameter].UPDATE_USER_ID = SUSER_NAME()
FROM
    [asr_staging].[etl_parameter] AS ep
    INNER JOIN [asr_staging].[azure_etl_parameter] AS aep
        ON ep.PARAMETER_NAME = aep.ETL_NAME 
		 AND ep.PARAMETER_NAME = 'ASR_NOD_DATE_EVEN'

END



	