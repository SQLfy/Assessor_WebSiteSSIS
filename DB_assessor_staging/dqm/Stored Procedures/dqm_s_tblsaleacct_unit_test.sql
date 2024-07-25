


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TBLSALEACCT
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSALEACCT

1.	Combination of ACCOUNTNO and RECEPTIONNO must be unique

2.	RECEPTIONNO must be in table s_tblsale - FK Check

*/


CREATE PROCEDURE [dqm].[dqm_s_tblsaleacct_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLSALEACCT'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblsaleacct]
	TRUNCATE TABLE [dqm].[s_tblsaleacct_err]
	TRUNCATE TABLE [asr_staging].[s_tblsale]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for Combination of ACCOUNTNO and RECEPTIONNO must be unique

	INSERT INTO [asr_staging].[s_tblsaleacct]
		(
		ACCOUNTNO,RECEPTIONNO
		)	
			VALUES 
				(
				'R0421535','00000935'
				);


	INSERT INTO [asr_staging].[s_tblsaleacct]
		(
		ACCOUNTNO,RECEPTIONNO
		)	
			VALUES 
				(
				'R0421535','00000935'
				);

	INSERT INTO [asr_staging].[s_tblsaleacct]
		(
		RECEPTIONNO
		)	
			VALUES 
				(
				'00000936'
				);


	-- for RECEPTIONNO must be in table s_tblsale - FK Check
    -- no specific condition needs to be created
	-- s_tblsale has been truncated
	-- and several records with values for RECEPTIONNO have been added to s_tblsaleacct

	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblsaleacct]

--------------------------------------------------------------------------------
-- compare record counts in s_tblsaleacct and s_tblsaleacct_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblsaleacct])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblsaleacct_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'Combination of ACCOUNTNO and RECEPTIONNO must be unique. FK check RECEPTIONNO must be in table s_tblsale.');


 

END




