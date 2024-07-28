﻿

-- ====================================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblacctpropertyaddress table
-- ====================================================================


/*
DQM RULES FOR:
TABLE:  tblacctpropertyaddress

ACCOUNTNO must exist in the account table

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctpropertyaddress]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

	-- Begin DQM checks for the table for each row.

	-- ACCOUNTNO must exist in the account table

	INSERT INTO [dqm].[s_tblacctpropertyaddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, BUILDINGID, PREDIRECTION, STREETNO, UNITNAME, POSTDIRECTION, STREETTYPE, STREETNAME, PROPERTYZIPCODE, PROPERTYCITY, ORDERNO, ACCTPROPERTYADDRESSON0, ACCTPROPERTYADDRESSON1, ACCTPROPERTYADDRESSON2, BUSINESSNAME, ACCTPROPERTYADDRESSOD0, ACCTPROPERTYADDRESSOD1, ACCTPROPERTYADDRESSOM0, ACCTPROPERTYADDRESSOM1, ACCTPROPERTYADDRESSOT0, ACCTPROPERTYADDRESSOT1, JURISDICTIONID, PROPERTYADDRESSCODE, WRITEDATE, LOCATIONID, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'FIELD MUST EXIST IN PARENT TABLE',
				'ACCOUNTNO MUST EXIST IN S_TBLACCT',
				--getdate(),
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, BUILDINGID, PREDIRECTION, STREETNO, UNITNAME, POSTDIRECTION, STREETTYPE, STREETNAME, PROPERTYZIPCODE, PROPERTYCITY, ORDERNO, ACCTPROPERTYADDRESSON0, ACCTPROPERTYADDRESSON1, ACCTPROPERTYADDRESSON2, BUSINESSNAME, ACCTPROPERTYADDRESSOD0, ACCTPROPERTYADDRESSOD1, ACCTPROPERTYADDRESSOM0, ACCTPROPERTYADDRESSOM1, ACCTPROPERTYADDRESSOT0, ACCTPROPERTYADDRESSOT1, JURISDICTIONID, PROPERTYADDRESSCODE, WRITEDATE, LOCATIONID, SEQID
			FROM [asr_staging].[s_tblacctpropertyaddress]
			WHERE accountno not in (select accountno from [asr_staging].[s_tblacct])


	END	

END







