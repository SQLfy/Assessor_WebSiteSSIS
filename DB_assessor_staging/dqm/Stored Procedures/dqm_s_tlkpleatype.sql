





-- =========================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TLKPLEATYPE table
-- =========================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPLEATYPE

1.	LEADESCRIPTION - cannot be NULL

2.  LEA – must be unique
     
3.	The combination of LEA and LEADESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpleatype]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	-- LEADESCRIPTION - cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tlkpleatype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, LEA, LEADESCRIPTION, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'LEADESCRIPTION',
				'FIELD CANNOT BE NULL',
				'LEADESCRIPTION CANNOT BE NULL',
				@lv_RUNTIME,
				LEA, 
				LEADESCRIPTION, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpleatype]
			WHERE LEADESCRIPTION IS NULL
			OR LEADESCRIPTION = '';

------------------------------------------------------------------------------

	--  LEA – must be unique
	
	WITH DUPE_VALUES AS (SELECT distinct LEA FROM [asr_staging].[s_tlkpleatype] GROUP BY LEA HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpleatype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, LEA, LEADESCRIPTION, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'LEA',
				'FIELD MUST BE UNIQUE',
				'LEA MUST BE UNIQUE',
				@lv_RUNTIME, 
				lea.LEA, 
				LEADESCRIPTION, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpleatype] lea
			INNER JOIN DUPE_VALUES DV 
			ON  lea.LEA = DV.LEA;
	

-------------------------------------------------------------------------------


	-- The combination of LEA and LEADESCRIPTION – must be unique

	WITH DUPE_VALUES AS (SELECT distinct LEA,LEADESCRIPTION FROM [asr_staging].[s_tlkpleatype] GROUP BY LEA,LEADESCRIPTION HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpleatype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, LEA, LEADESCRIPTION, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'LEA and LEADESCRIPTION',
				'COMBINATION OF TWO FIELDS MUST BE UNIQUE',
				'LEA and LEADESCRIPTION MUST BE UNIQUE',
				@lv_RUNTIME,
				lea.LEA, 
				lea.LEADESCRIPTION, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpleatype] lea
			INNER JOIN DUPE_VALUES DV 
			ON  lea.LEA = DV.LEA
			and lea.LEADESCRIPTION = DV.LEADESCRIPTION;


--------------------------------------------------------------------------------

            END


	END
	

