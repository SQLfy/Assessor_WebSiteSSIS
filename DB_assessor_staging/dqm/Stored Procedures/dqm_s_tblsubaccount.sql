






-- ===========================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for S_TBLSUBACCOUNT table
-- ===========================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSUBACCOUNT

1.	    ACCOUNTNO must be in table s_tblacct - FK Check

2.		ACCOUNTNO – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tblsubaccount]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	

	-- ACCOUNTNO must be in table s_tblacct - FK Check

INSERT INTO [dqm].[s_tblsubaccount_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, SUBNO, FILINGNO, ACCOUNTNO, BLOCK, LOT, TRACT, SUBACCOUNTON0, SUBACCOUNTON1, SUBACCOUNTON2, SUBACCOUNTOD0, SUBACCOUNTOD1, SUBACCOUNTOM0, SUBACCOUNTOM1, SUBACCOUNTOT0, SUBACCOUNTOT1, JURISDICTIONID, WRITEDATE, SEQID, PRIORSUBNO, PRIORFILINGNO)
	    SELECT 
				'ACCOUNTNO',
				'FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLSUBACCOUNT - FK CHECK',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				SUBNO, 
				FILINGNO, 
				ACCOUNTNO, 
				BLOCK, 
				LOT, 
				TRACT, 
				SUBACCOUNTON0, 
				SUBACCOUNTON1, 
				SUBACCOUNTON2, 
				SUBACCOUNTOD0, 
				SUBACCOUNTOD1, 
				SUBACCOUNTOM0, 
				SUBACCOUNTOM1, 
				SUBACCOUNTOT0, 
				SUBACCOUNTOT1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID, 
				PRIORSUBNO, 
				PRIORFILINGNO
			FROM [asr_staging].[s_tblsubaccount]
			WHERE ACCOUNTNO not in (select distinct ACCOUNTNO from [asr_staging].[s_tblacct]);


-----------------------------------------------------------------------------------

	-- ACCOUNTNO – must be unique

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO  FROM [asr_staging].[s_tblsubaccount] GROUP BY ACCOUNTNO HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblsubaccount_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, SUBNO, FILINGNO, ACCOUNTNO, BLOCK, LOT, TRACT, SUBACCOUNTON0, SUBACCOUNTON1, SUBACCOUNTON2, SUBACCOUNTOD0, SUBACCOUNTOD1, SUBACCOUNTOM0, SUBACCOUNTOM1, SUBACCOUNTOT0, SUBACCOUNTOT1, JURISDICTIONID, WRITEDATE, SEQID, PRIORSUBNO, PRIORFILINGNO)
	   SELECT 
				'ACCOUNTNO',
				'FIELD MUST BE UNIQUE',
				'ACCOUNTNO MUST BE UNIQUE',
				@lv_RUNTIME, 
				VERSTART, VEREND, SUBNO, FILINGNO, sa.ACCOUNTNO, BLOCK, LOT, TRACT, SUBACCOUNTON0, SUBACCOUNTON1, SUBACCOUNTON2, SUBACCOUNTOD0, SUBACCOUNTOD1, SUBACCOUNTOM0, SUBACCOUNTOM1, SUBACCOUNTOT0, SUBACCOUNTOT1, JURISDICTIONID, WRITEDATE, SEQID, PRIORSUBNO, PRIORFILINGNO
			FROM [asr_staging].[s_tblsubaccount] sa
			INNER JOIN DUPE_VALUES DV 
			ON sa.ACCOUNTNO = DV.ACCOUNTNO;


     END

END

-----------------------------------------------------------------------------------
	














