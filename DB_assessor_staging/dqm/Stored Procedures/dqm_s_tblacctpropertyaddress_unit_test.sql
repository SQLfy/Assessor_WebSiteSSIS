


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacctpropertyaddress DQM rule
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblacctpropertyaddress

ACCOUNTNO must exist in the account table

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctpropertyaddress_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTPROPERTYADDRESS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctpropertyaddress]
	TRUNCATE TABLE [dqm].[s_tblacctpropertyaddress_err]
	TRUNCATE TABLE [asr_staging].[s_tblacct]				-- for FK check		

	

----------------------------------------------------------------------------------

	-- ACCOUNTNO must exist in the account table

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R1234567'
				);

	INSERT INTO [asr_staging].[s_tblacctpropertyaddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'TESTACCT'
				);

	
	
   

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacctpropertyaddress]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctpropertyaddress])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctpropertyaddress_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO must exist in the account table');


END





