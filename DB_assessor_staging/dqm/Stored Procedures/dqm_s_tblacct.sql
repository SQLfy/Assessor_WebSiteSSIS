






-- ===============================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblacct
-- ===============================================


/*
DQM RULES FOR:
TABLE:  S_TBLACCT

1.	ACCOUNTNO must be in a specific format
	the first character must be one of the following: R M P C
	the second through eighth character must be a number >=0 and <=9

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacct]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	
	-- ACCOUNTNO must be in the format ^[RMPC]{1}[0-9]{7}$

	INSERT INTO [dqm].[s_tblacct_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PARCELNO, LOCALNO, MAPNO, ACCTSTATUSCODE, ACCTTYPE, ASSIGNEDTO, VALUEAREACODE, ASSOCIATEDACCT, APPRAISALTYPE, ECONOMICAREACODE, ACCTDATECREATED, DEFAULTAPPROACHTYPE, DEFAULTTAXDISTRICT, BUSINESSLICENSE, MAPGROUP, CONTROLMAP, PROPERTYIDENTIFIER, SPECIALINTERESTNUMBER, ACCTON0, ACCTON1, ACCTON2, PRIMARYUSECODE, WARD, ACCTOD0, ACCTOD1, ACCTOM0, ACCTOM1, STRIPPEDACCOUNTNO, JURISDICTIONID, ACCTOT0, ACCTOT1, WRITEDATE, CENSUSTRACT, CENSUSBLOCK, MOBILEHOMESPACE, EFILEFLAG, BUSINESSNAME, COSTHYBRIDPERCENT, MARKETHYBRIDPERCENT, INCOMEHYBRIDPERCENT, RECONCILEDHYBRIDPERCENT, PARCELSEQUENCE, PROPERTYCLASSID, SEQID, DETAILEDREVIEWDATE)
	    SELECT 
				'ACCOUNTNO',
				'ACCOUNTNO MUST BE IN A SPECIFIED FORMAT',
				'ACCOUNT NUMBER MUST BE IN FORMAT -- [RMPC]{1}[0-9]{7}',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PARCELNO, LOCALNO, MAPNO, ACCTSTATUSCODE, ACCTTYPE, ASSIGNEDTO, VALUEAREACODE, ASSOCIATEDACCT, APPRAISALTYPE, ECONOMICAREACODE, ACCTDATECREATED, DEFAULTAPPROACHTYPE, DEFAULTTAXDISTRICT, BUSINESSLICENSE, MAPGROUP, CONTROLMAP, PROPERTYIDENTIFIER, SPECIALINTERESTNUMBER, ACCTON0, ACCTON1, ACCTON2, PRIMARYUSECODE, WARD, ACCTOD0, ACCTOD1, ACCTOM0, ACCTOM1, STRIPPEDACCOUNTNO, JURISDICTIONID, ACCTOT0, ACCTOT1, WRITEDATE, CENSUSTRACT, CENSUSBLOCK, MOBILEHOMESPACE, EFILEFLAG, BUSINESSNAME, COSTHYBRIDPERCENT, MARKETHYBRIDPERCENT, INCOMEHYBRIDPERCENT, RECONCILEDHYBRIDPERCENT, PARCELSEQUENCE, PROPERTYCLASSID, SEQID, DETAILEDREVIEWDATE
			FROM [asr_staging].[S_TBLACCT]
			WHERE substring(ACCOUNTNO,1,1) not in ('R','M','P','C')
			  or cast(substring(ACCOUNTNO,2,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,3,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,4,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
		      or cast(substring(ACCOUNTNO,5,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,6,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,7,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,8,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')

--------------------------------------------------------------------------------
	END 

END








