﻿-- =====================================================================================
-- Author:		David Guillen
-- Create date: 9/17/2014
-- Description:	DQM stored procedure for S_TLKPIMPSADDONS table in Realware_ODS
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPIMPSADDONS

1.	    ADDONCODE – cannot be NULL

2.      ADDONDESCRIPTION - cannot be NULL

3.      ADDONCODE - must be unique

4	    ADDONDESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpimpsaddons]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	-- ADDONCODE – cannot be NULL DQM check
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)    
		SELECT 
				'ADDONCODE',
				'FIELD CANNOT BE NULL',
				'ADDONCODE CANNOT BE NULL',
				@lv_RUNTIME,
				ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
			FROM [dbo].[s_tlkpimpsaddons]
			WHERE ADDONCODE IS NULL;

--------------------------------------------------------------------------------

-- ADDONDESCRIPTION – cannot be NULL DQM check
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)
	    SELECT 
				'ADDONDESCRIPTION',
				'FIELD CANNOT BE NULL',
				'ADDONDESCRIPTION CANNOT BE NULL',
				@lv_RUNTIME,
				ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
				FROM [dbo].[s_tlkpimpsaddons]
			WHERE ADDONDESCRIPTION IS NULL
			or ADDONDESCRIPTION = '';

-----------------------------------------------------------------------------------

	-- ADDONCODE – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ADDONCODE  FROM [dbo].[s_tlkpimpsaddons] GROUP BY ADDONCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)
	   SELECT 
				'ADDONCODE',
				'FIELD MUST BE UNIQUE',
				'ADDONCODE MUST BE UNIQUE',
				@lv_RUNTIME, 
				ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				iao.ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
				FROM [dbo].[s_tlkpimpsaddons] iao
			INNER JOIN DUPE_VALUES DV 
			ON iao.ADDONCODE = DV.ADDONCODE;
			
--------------------------------------------------------------------------------

-- ADDONDESCRIPTION – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ADDONDESCRIPTION  FROM [dbo].[s_tlkpimpsaddons] GROUP BY ADDONDESCRIPTION HAVING COUNT(*) > 1)
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)
	   SELECT 
				'ADDONDESCRIPTION',
				'FIELD MUST BE UNIQUE',
				'ADDONDESCRIPTION MUST BE UNIQUE',
				@lv_RUNTIME, 
				iao.ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
				FROM [dbo].[s_tlkpimpsaddons] iao
			INNER JOIN DUPE_VALUES DV 
			ON iao.ADDONDESCRIPTION = DV.ADDONDESCRIPTION;
			

--------------------------------------------------------------------------------


            END




		END
	


