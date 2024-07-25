


-- ==============================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TLKPIMPSOCCTYPE table
-- ==============================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPLEATYPE

1.  OCCCODE – must be unique
     
2.	OCCCODEDESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpimpsocctype]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	--  OCCCODE – must be unique
	
	WITH DUPE_VALUES AS (SELECT distinct OCCCODE FROM [asr_staging].[s_tlkpimpsocctype] GROUP BY OCCCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpimpsocctype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, OCCCODE, OCCCODEDESCRIPTION, ABSTRACTCODE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'OCCCODE',
				'FIELD MUST BE UNIQUE',
				'OCCCODE MUST BE UNIQUE',
				@lv_RUNTIME, 
				ioc.OCCCODE, 
				OCCCODEDESCRIPTION, 
				ABSTRACTCODE, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpimpsocctype] ioc
			INNER JOIN DUPE_VALUES DV 
			ON  ioc.OCCCODE = DV.OCCCODE;
	

-------------------------------------------------------------------------------


	--  OCCCODEDESCRIPTION – must be unique

	WITH DUPE_VALUES AS (SELECT distinct OCCCODEDESCRIPTION FROM [asr_staging].[s_tlkpimpsocctype] GROUP BY OCCCODEDESCRIPTION HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpimpsocctype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, OCCCODE, OCCCODEDESCRIPTION, ABSTRACTCODE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'OCCCODEDESCRIPTION',
				'FIELD MUST BE UNIQUE',
				'OCCCODEDESCRIPTION MUST BE UNIQUE',
				@lv_RUNTIME,
				OCCCODE, 
				ioc.OCCCODEDESCRIPTION, 
				ABSTRACTCODE, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpimpsocctype] ioc
			INNER JOIN DUPE_VALUES DV 
			ON  ioc.OCCCODEDESCRIPTION = DV.OCCCODEDESCRIPTION;
			


--------------------------------------------------------------------------------

            END


	END	


