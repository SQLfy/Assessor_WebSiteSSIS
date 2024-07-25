



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 9/17/2014
-- Description:	DQM stored procedure for S_TLKPIMPSHVACTYPE table in Realware_ODS
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPIMPSHVACTYPE

1.	    HVACTYPE – cannot be NULL

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpimpshvactype]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	
	-- HVACTYPE – cannot be NULL DQM check and also check for empty string
	
	INSERT INTO [asr_staging].[s_tlkpimpshvactype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE,HVACTYPE, PROPERTYTYPE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'HVACTYPE',
				'FIELD CANNOT BE NULL',
				'HVACTYPE CANNOT BE NULL',
				@lv_RUNTIME,
				HVACTYPE, 
				PROPERTYTYPE, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpimpshvactype]
			WHERE HVACTYPE IS NULL
			or HVACTYPE = '';

--------------------------------------------------------------------------------

            END




		END
	


