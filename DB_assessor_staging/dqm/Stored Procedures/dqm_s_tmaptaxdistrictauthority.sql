





-- =======================================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for S_TMAPTAXDISTRICTAUTHORITY table
-- =======================================================================


/*
DQM RULES FOR:
TABLE:  S_TMAPTAXDISTRICTAUTHORITY

1.	    The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tmaptaxdistrictauthority]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	
	-- The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct TAXYEAR,TAXDISTRICT,TAXAUTHORITY  FROM [asr_staging].[s_tmaptaxdistrictauthority] GROUP BY TAXYEAR,TAXDISTRICT,TAXAUTHORITY HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tmaptaxdistrictauthority_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, TAXDISTRICT, TAXAUTHORITY, TAXYEAR, SORTORDER, JURISDICTIONID, LASTUPDATED, TIFAUTHORITY, TIFPERCENTAGE, EXCESSVALUE, EXCESSVALUENOTUSED)
	    SELECT 
				'TAXYEAR and TAXDISTRICT and TAXAUTHORITY',
				'COMBINATION OF THREE FIELDS MUST BE UNIQUE',
				'TAXYEAR and TAXDISTRICT and TAXAUTHORITY MUST BE UNIQUE',
				@lv_RUNTIME,
				tda.TAXDISTRICT, 
				tda.TAXAUTHORITY, 
				tda.TAXYEAR, 
				SORTORDER, 
				JURISDICTIONID,
				LASTUPDATED, 
				TIFAUTHORITY, 
				TIFPERCENTAGE, 
				EXCESSVALUE, 
				EXCESSVALUENOTUSED
			FROM [asr_staging].[s_tmaptaxdistrictauthority] tda
			INNER JOIN DUPE_VALUES DV 
			ON tda.TAXYEAR = DV.TAXYEAR
			and tda.TAXAUTHORITY = DV.TAXAUTHORITY
			and tda.TAXDISTRICT = DV.TAXDISTRICT;


--------------------------------------------------------------------------------



            END




		END
	













