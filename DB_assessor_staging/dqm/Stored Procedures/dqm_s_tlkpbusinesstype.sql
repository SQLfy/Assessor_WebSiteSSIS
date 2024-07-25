


-- =====================================================================================
-- Author:		TONY GOLDEN
-- Create date: 2/13/2017
-- Description:	DQM stored procedure for S_TLKPBUSINESSTYPE table in Realware_ODS
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPBUSINESSTYPE

1.	    BUSINESSCODE – cannot be NULL

2.      BUSINESSTYPEDESCRIPTION - cannot be NULL

3.      BUSINESSCODE - must be unique

4	    BUSINESSTYPEDESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpbusinesstype]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	-- BUSINESSCODE – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tlkpbusinesstype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, BUSINESSCODE, BUSINESSTYPEDESCRIPTION, ACTIVEFLAG, SORTORDER, JURISDICTIONID, LASTUPDATED)    
		SELECT 
				'BUSINESSCODE',
				'FIELD CANNOT BE NULL',
				'BUSINESSCODE CANNOT BE NULL',
				@lv_RUNTIME,
				BUSINESSCODE, 
				BUSINESSTYPEDESCRIPTION, 
				ACTIVEFLAG, 
				SORTORDER, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpbusinesstype]
			WHERE BUSINESSCODE IS NULL
			or BUSINESSCODE = '';

--------------------------------------------------------------------------------

-- BUSINESSTYPEDESCRIPTION – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tlkpbusinesstype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, BUSINESSCODE, BUSINESSTYPEDESCRIPTION, ACTIVEFLAG, SORTORDER, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'BUSINESSTYPEDESCRIPTION',
				'FIELD CANNOT BE NULL',
				'BUSINESSTYPEDESCRIPTION CANNOT BE NULL',
				@lv_RUNTIME,
				BUSINESSCODE, 
				BUSINESSTYPEDESCRIPTION, 
				ACTIVEFLAG, 
				SORTORDER, 
				JURISDICTIONID, 
				LASTUPDATED
				FROM [asr_staging].[s_tlkpbusinesstype]
			WHERE BUSINESSTYPEDESCRIPTION IS NULL
			or BUSINESSTYPEDESCRIPTION = '';

-----------------------------------------------------------------------------------

	-- BUSINESSCODE – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct BUSINESSCODE  FROM [asr_staging].[s_tlkpbusinesstype] GROUP BY BUSINESSCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpbusinesstype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, BUSINESSCODE, BUSINESSTYPEDESCRIPTION, ACTIVEFLAG, SORTORDER, JURISDICTIONID, LASTUPDATED)
	   SELECT 
				'BUSINESSCODE',
				'FIELD MUST BE UNIQUE',
				'BUSINESSCODE MUST BE UNIQUE',
				@lv_RUNTIME, 
				bt.BUSINESSCODE, 
				BUSINESSTYPEDESCRIPTION, 
				ACTIVEFLAG, 
				SORTORDER, 
				JURISDICTIONID, 
				LASTUPDATED
				FROM [asr_staging].[s_tlkpbusinesstype] bt
			INNER JOIN DUPE_VALUES DV 
			ON bt.BUSINESSCODE = DV.BUSINESSCODE;
			
--------------------------------------------------------------------------------

-- BUSINESSTYPEDESCRIPTION – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct BUSINESSTYPEDESCRIPTION  FROM [asr_staging].[s_tlkpbusinesstype] GROUP BY BUSINESSTYPEDESCRIPTION HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpbusinesstype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, BUSINESSCODE, BUSINESSTYPEDESCRIPTION, ACTIVEFLAG, SORTORDER, JURISDICTIONID, LASTUPDATED)
	   SELECT 
				'BUSINESSTYPEDESCRIPTION',
				'FIELD MUST BE UNIQUE',
				'BUSINESSTYPEDESCRIPTION MUST BE UNIQUE',
				@lv_RUNTIME, 
				BUSINESSCODE, 
				bt.BUSINESSTYPEDESCRIPTION, 
				ACTIVEFLAG, 
				SORTORDER, 
				JURISDICTIONID, 
				LASTUPDATED
				FROM [asr_staging].[s_tlkpbusinesstype] bt
			INNER JOIN DUPE_VALUES DV 
			ON bt.BUSINESSTYPEDESCRIPTION = DV.BUSINESSTYPEDESCRIPTION;
			

--------------------------------------------------------------------------------


            END




		END
	











