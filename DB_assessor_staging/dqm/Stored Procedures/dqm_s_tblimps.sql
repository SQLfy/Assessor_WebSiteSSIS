﻿


-- =====================================================================================
-- Author:	David Guillen
-- Create date: 3/3/2016
-- Description:	DQM stored procedure for s_tblimps
-- =====================================================================================
-- Modified 4/27/2016 by Richard Edwards to add accountno in s_tblacct check

/*
DQM RULES FOR:
TABLE:  tblimps


1.	IMPCOMPLETEDPCT cannot be null
	
2.	ACCOUNTNO must be in table s_tblimpsocc - FK Check

3.	IMPNO must be in table s_tblimpsocc - FK Check

4.	ACCOUNTNO must be in table s_tblimpsbltas - FK Check

5.	IMPNO must be in table s_tblimpsbltas - FK Check

6.  ACCOUNTNO must be in table s_tblacct - FK Check

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimps]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

-- IMPCOMPLETEDPCT cannot be null

	INSERT INTO [dqm].[s_tblimps_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
					'IMPSCOMPLETEDPCT',
					'FIELD CANNOT BE NULL',
					'IMPSCOMPLETEDPCT CANNOT BE NULL',
					--getdate(),
					@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps]
				WHERE impcompletedpct is null

----------------------------------------------------------------------------------
/*
-- ACCOUNTNO must be in table s_tblimpsocc - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'ACCOUNTNO',
				'MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps] i
				WHERE NOT EXISTS
					(SELECT 1 from [asr_staging].[s_tblimpsocc] io
					WHERE i.ACCOUNTNO = io.ACCOUNTNO);

--------------------------------------------------------------------------------------------

-- IMPNO must be in table s_tblimpsocc - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'IMPNO',
				'MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				'IMPNO MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps] i
				WHERE NOT EXISTS
					(SELECT 1 from [asr_staging].[s_tblimpsocc] io
					WHERE i.IMPNO = io.IMPNO);


*/
----------------------------------------------------------------------------------

-- ACCOUNTNO must be in table s_tblimpsbltas - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'ACCOUNTNO',
				'MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps] i
				WHERE NOT EXISTS
					(SELECT 1 from [asr_staging].[s_tblimpsbltas] iba
					WHERE i.ACCOUNTNO = iba.ACCOUNTNO
					  and i.IMPNO = iba.IMPNO);

--------------------------------------------------------------------------------------------

/*

-- IMPNO must be in table s_tblimpsbltas - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'IMPNO',
				'MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				'IMPNO MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps] i
				WHERE NOT EXISTS
					(SELECT 1 from [asr_staging].[s_tblimpsbltas] iba
					WHERE i.IMPNO = iba.IMPNO);

*/

----------------------------------------------------------------------------------

-- ACCOUNTNO must be in table s_tblacct - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'ACCOUNTNO',
				'MUST EXIST IN TABLE S_TBLACCT - FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLACCT - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps] i
				WHERE NOT EXISTS
					(SELECT 1 from [asr_staging].[s_tblacct] a
					WHERE i.ACCOUNTNO = a.ACCOUNTNO);
	END	

END







