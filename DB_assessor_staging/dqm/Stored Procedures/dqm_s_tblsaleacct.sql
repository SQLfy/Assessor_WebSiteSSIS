﻿





-- =========================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TBLSALEACCT table
-- =========================================================
-- Modified 4/27/2016 by Richard Edwards to add accountno in s_tblacct check

/*
DQM RULES FOR:
TABLE:  S_TBLSALEACCT

1.	ACCOUNTNO and RECEPTIONNO must be unique

2.	RECEPTIONNO must be in table s_tblsale - FK Check

3.  ACCOUNTNO must be in table s_tblacct - FK Check

*/

CREATE PROCEDURE [dqm].[dqm_s_tblsaleacct]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.


--------------------------------------------------------------------------------


	-- ACCOUNTNO and RECEPTIONNO – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO, RECEPTIONNO FROM [asr_staging].[s_tblsaleacct] GROUP BY ACCOUNTNO, RECEPTIONNO HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblsaleacct_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, ACCOUNTNO, INVENTORYEFFECTIVEDATE, ACCTADJSALEPRICE, GROUPPRIMARYACCTFLAG, SALEACCTON0, SALEACCTON1, SALEACCTON2, SALEACCTOD0, SALEACCTOD1, SALEACCTOM0, SALEACCTOM1, SALEACCTOT0, SALEACCTOT1, JURISDICTIONID, WRITEDATE, SALEACCTPENALTYDATE, SALEACCTPENALTYFLAG, SEQID)
	    SELECT 
				'ACCOUNTNO AND RECEPTIONNO',
				'FIELD MUST BE UNIQUE',
				'ACCOUNTNO AND RECEPTIONNO MUST BE UNIQUE',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				sa.RECEPTIONNO, 
				sa.ACCOUNTNO, 
				INVENTORYEFFECTIVEDATE, 
				ACCTADJSALEPRICE, 
				GROUPPRIMARYACCTFLAG, 
				SALEACCTON0, 
				SALEACCTON1,
				SALEACCTON2, 
				SALEACCTOD0, 
				SALEACCTOD1, 
				SALEACCTOM0, 
				SALEACCTOM1, 
				SALEACCTOT0, 
				SALEACCTOT1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SALEACCTPENALTYDATE, 
				SALEACCTPENALTYFLAG, 
				SEQID
			FROM [asr_staging].[s_tblsaleacct] sa
			INNER JOIN DUPE_VALUES DV 
			ON sa.RECEPTIONNO = DV.RECEPTIONNO
			and sa.ACCOUNTNO = DV.ACCOUNTNO;



--------------------------------------------------------------------------------


	-- RECEPTIONNO must be in table s_tblsale - FK Check -- DQM check

	INSERT INTO [dqm].[s_tblsaleacct_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, ACCOUNTNO, INVENTORYEFFECTIVEDATE, ACCTADJSALEPRICE, GROUPPRIMARYACCTFLAG, SALEACCTON0, SALEACCTON1, SALEACCTON2, SALEACCTOD0, SALEACCTOD1, SALEACCTOM0, SALEACCTOM1, SALEACCTOT0, SALEACCTOT1, JURISDICTIONID, WRITEDATE, SALEACCTPENALTYDATE, SALEACCTPENALTYFLAG, SEQID)
	    SELECT 
				'RECEPTIONNO',
				'MUST EXIST IN TABLE S_TBLSALE - FK CHECK',
				'RECEPTIONNO MUST EXIST IN TABLE S_TBLSALE - FK CHECK',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				ACCOUNTNO, 
				INVENTORYEFFECTIVEDATE, 
				ACCTADJSALEPRICE, 
				GROUPPRIMARYACCTFLAG, 
				SALEACCTON0, 
				SALEACCTON1,
				SALEACCTON2, 
				SALEACCTOD0, 
				SALEACCTOD1, 
				SALEACCTOM0, 
				SALEACCTOM1, 
				SALEACCTOT0, 
				SALEACCTOT1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SALEACCTPENALTYDATE, 
				SALEACCTPENALTYFLAG, 
				SEQID
			FROM [asr_staging].[s_tblsaleacct] sa
			WHERE NOT EXISTS
					(SELECT 1 from [asr_staging].[s_tblsale] s
					WHERE sa.RECEPTIONNO = s.RECEPTIONNO);


--------------------------------------------------------------------------------

-- ACCOUNTNO must be in table s_tblsale - FK Check -- DQM check

	INSERT INTO [dqm].[s_tblsaleacct_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, ACCOUNTNO, INVENTORYEFFECTIVEDATE, ACCTADJSALEPRICE, GROUPPRIMARYACCTFLAG, SALEACCTON0, SALEACCTON1, SALEACCTON2, SALEACCTOD0, SALEACCTOD1, SALEACCTOM0, SALEACCTOM1, SALEACCTOT0, SALEACCTOT1, JURISDICTIONID, WRITEDATE, SALEACCTPENALTYDATE, SALEACCTPENALTYFLAG, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'MUST EXIST IN TABLE S_TBLACCT - FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLACCT - FK CHECK',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				ACCOUNTNO, 
				INVENTORYEFFECTIVEDATE, 
				ACCTADJSALEPRICE, 
				GROUPPRIMARYACCTFLAG, 
				SALEACCTON0, 
				SALEACCTON1,
				SALEACCTON2, 
				SALEACCTOD0, 
				SALEACCTOD1, 
				SALEACCTOM0, 
				SALEACCTOM1, 
				SALEACCTOT0, 
				SALEACCTOT1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SALEACCTPENALTYDATE, 
				SALEACCTPENALTYFLAG, 
				SEQID
			FROM [asr_staging].[s_tblsaleacct] sa
			WHERE NOT EXISTS
					(SELECT 1 from [asr_staging].[s_tblacct] a
					WHERE sa.ACCOUNTNO = a.ACCOUNTNO);

            END


	END
	
