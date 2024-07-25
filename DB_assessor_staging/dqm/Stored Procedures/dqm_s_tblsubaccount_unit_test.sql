


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for S_TBLSUBACCOUNT DQM rule
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TBLSUBACCOUNT

1.	    ACCOUNTNO must be in table s_tblacct - FK Check

2.		ACCOUNTNO must be unique

*/



CREATE PROCEDURE [dqm].[dqm_s_tblsubaccount_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLSUBACCOUNT'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblsubaccount]
	TRUNCATE TABLE [dqm].[s_tblsubaccount_err]
	TRUNCATE TABLE [asr_staging].[s_tblacct]

----------------------------------------------------------------------------------

	-- ACCOUNTNO must be in table s_tblacct - FK Check


	INSERT INTO [asr_staging].[s_tblsubaccount]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R0000036'
				);


	-- ACCOUNTNO must be unique

	INSERT INTO [asr_staging].[s_tblsubaccount]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R0000037'
				);

	INSERT INTO [asr_staging].[s_tblsubaccount]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R0000037'
				);

	
--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblsubaccount]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblsubaccount])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblsubaccount_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME


insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'FK check ACCOUNTNO must be in table s_tblacct, ACCOUNTNO must be unique.');





	 



 

END





