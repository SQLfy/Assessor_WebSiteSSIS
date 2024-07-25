


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacctowneraddress DQM rules
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblacctowneraddress

TABLE:  tblacctowneraddress

1.	PRIMARYOWNERFLAG must be 0 or -1 or 1

2.	ACCOUNTNO must exist in the account table

3.	PERSONCODE must exist in the person table lookup

4.	ADDRESSCODE must exist in the address table


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctowneraddress_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTOWNERADDRESS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctowneraddress]
	TRUNCATE TABLE [dqm].[s_tblacctowneraddress_err]
	TRUNCATE TABLE [asr_staging].[s_tblacct]			-- for FK check
	TRUNCATE TABLE [asr_staging].[s_tblpersonsecure]	-- for FK check
	TRUNCATE TABLE [asr_staging].[s_tbladdresssecure]	-- for FK check		

	

----------------------------------------------------------------------------------

	-- PRIMARYOWNERFLAG must be 0 or -1 or 1

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		PRIMARYOWNERFLAG
		)	
			VALUES 
				(
				2
				);

	-- ACCOUNTNO must exist in the account table

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R1234567'
				);

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'TESTACCT'
				);


	-- PERSONCODE must exist in the person table lookup

	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE
		)	
			VALUES 
				(
				123456
				);

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				999999
				);

	-- ADDRESSCODE must exist in the address table

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				123456
				);

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				999999
				);
	
	
   

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacctowneraddress]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctowneraddress])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctowneraddress_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 9 then 'PASS' else 'FAIL' end,getdate(),'Primary owner not null and equal to -1 0 or 1, FK checks on accountno, personcode, and addresscode');


END





