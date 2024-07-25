﻿




-- ===================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblacctnbhd
-- ===================================================
-- Modified 4/28/2016 by Richard Edwards to add accountno in table s_tblacct

/*
DQM RULES FOR:
TABLE:  tblacctnbhd

1.	Fields accountno + nbhdcode + proptype + nbhdext have to be unique and can not be null 

2.	ACCOUNTNO must exist in the account table - FK check

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctnbhd]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	
	-- ACCOUNTNO – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'FIELD CANNOT BE NULL',
				'ACCOUNTNO CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE ACCOUNTNO IS NULL
			 OR ACCOUNTNO = '';

--------------------------------------------------------------------------------

	-- NBHDCODE – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'NBHDCODE',
				'FIELD CANNOT BE NULL',
				'NBHD CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE NBHDCODE IS NULL
			OR NBHDCODE = '';

------------------------------------------------------------------------------

	-- PROPERTYTYPE – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'PROPERTYTYPE',
				'FIELD CANNOT BE NULL',
				'PROPERTYTYPE CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE PROPERTYTYPE IS NULL
			OR PROPERTYTYPE = '';

-------------------------------------------------------------------------------

	-- NBHDEXTENSION – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'NBHDEXTENSION',
				'FIELD CANNOT BE NULL',
				'NBHDEXT CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE NBHDEXTENSION IS NULL
			OR NBHDEXTENSION = '';

-------------------------------------------------------------------------------

	-- The combination of ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION  FROM [asr_staging].[s_tblacctnbhd] GROUP BY ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION',
				'COMBINATION OF FOUR FIELDS MUST BE UNIQUE',
				'ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION MUST BE UNIQUE', 
				@lv_RUNTIME, 
				VERSTART, VEREND, n.ACCOUNTNO, n.NBHDCODE, n.NBHDEXTENSION, n.PROPERTYTYPE, n.NBHDADJUSTMENTVALUE, n.ACCTNBHDON0, n.ACCTNBHDON1, n.ACCTNBHDON2, n.ACCTNBHDOD0, n.ACCTNBHDOD1, n.ACCTNBHDOM0, n.ACCTNBHDOM1, n.ACCTNBHDOT0, n.ACCTNBHDOT1, n.JURISDICTIONID,n. WRITEDATE, n.SEQID
			FROM [asr_staging].[s_tblacctnbhd] n
			INNER JOIN DUPE_VALUES DV 
			ON n.ACCOUNTNO = DV.ACCOUNTNO
			and n.PROPERTYTYPE = DV.PROPERTYTYPE
			and n.NBHDCODE = DV.NBHDCODE
			and n.NBHDEXTENSION = DV.NBHDEXTENSION;


--------------------------------------------------------------------------------

-- ACCOUNTNO – must be in table s_tblacct
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'FOREIGN KEY CHECK',
				'ACCOUNTNO MUST BE IN TABLE S_TBLACCT',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE ACCOUNTNO NOT IN (SELECT ACCOUNTNO FROM asr_staging.s_tblacct)
			 
--------------------------------------------------------------------------------------

	END 

END









