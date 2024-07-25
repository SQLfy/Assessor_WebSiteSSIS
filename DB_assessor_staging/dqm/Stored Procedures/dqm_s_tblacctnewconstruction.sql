
-- =====================================================================================
-- Author:		Tony Golden
-- Create date: 6/2/2014
-- Description:	DQM stored procedure for s_tblacctnewconstruction
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  tblacctnewconstruction

IS_UNIQUE_1CE	Abstractcode has to be unique for an account
IS_UNIQUE_1CE	Taxdistrict has to be unique for an account


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctnewconstruction]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------



    WITH DUPE_VALUES AS (SELECT accountno, count(abstractcode) rec_count FROM [asr_staging].[s_tblacctnewconstruction] GROUP BY accountno  HAVING COUNT(abstractcode) > 1)
	
	INSERT INTO [asr_staging].[s_tblacctnewconstruction_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, DETAILID, NCTOTALACTUALVALUE, TAXYEAR, ABSTRACTCODE, ABSTRACTADJCODE, TAXDISTRICT, ACCTNEWCONSTRUCTIONON0, ACCTNEWCONSTRUCTIONON1, ACCTNEWCONSTRUCTIONON2, ACCTNEWCONSTRUCTIONOD0, ACCTNEWCONSTRUCTIONOD1, ACCTNEWCONSTRUCTIONOM0, ACCTNEWCONSTRUCTIONOM1, ACCTNEWCONSTRUCTIONOT0, ACCTNEWCONSTRUCTIONOT1, LANDCLASS, LANDSUBCLASS, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
					'ABSTRACTCODE/TAXDISTRICT',
					'FIELDS MUST BE UNIQUE PER ACCOUNT',
					'AN ACCOUNT CAN HAVE ONLY 1 TAX DISTRICT AND/OR 1 ABSTRACT CODE',
					--getdate(),
					@lv_RUNTIME,
					VERSTART, VEREND, anc.ACCOUNTNO, DETAILID, NCTOTALACTUALVALUE, TAXYEAR, ABSTRACTCODE, ABSTRACTADJCODE, TAXDISTRICT, ACCTNEWCONSTRUCTIONON0, ACCTNEWCONSTRUCTIONON1, ACCTNEWCONSTRUCTIONON2, ACCTNEWCONSTRUCTIONOD0, ACCTNEWCONSTRUCTIONOD1, ACCTNEWCONSTRUCTIONOM0, ACCTNEWCONSTRUCTIONOM1, ACCTNEWCONSTRUCTIONOT0, ACCTNEWCONSTRUCTIONOT1, LANDCLASS, LANDSUBCLASS, JURISDICTIONID, WRITEDATE, SEQID
				FROM s_tblacctnewconstruction anc
			INNER JOIN DUPE_VALUES DV 
			ON anc.ACCOUNTNO = DV.ACCOUNTNO
			;


----------------------------------------------------------------------------------


	END	



END





