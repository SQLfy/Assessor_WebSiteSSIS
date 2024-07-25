


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacct DQM rules
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLACCT

1.	ACCOUNTNO must be in a specific format
	the first character must be one of the following: R M P C
	the second through eighth character must be a number >=0 and <=9

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacct_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCT'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacct]
	TRUNCATE TABLE [dqm].[s_tblacct_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process
	

	-- ACCOUNTNO must be in the format ^[RMPC]{1}[0-9]{7}$	

	INSERT INTO [asr_staging].[s_tblacct]
		( 
		ACCOUNTNO
		)	
			VALUES 
				(
				'f3920123'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'RR920123'
				);


	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R9R20123'
				);


	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R92R0123'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R920R123'
				);


	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R9201R23'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R92012R3'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R920123R'
				);

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacct]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacct])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacct_err])

select @ROW_COUNT_DIFF = @COUNT_TABLE - @COUNT_ERR_TABLE

delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO must be in a specific format');





	 



 

END





