

-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/14/2016
-- Description:	Unit testing stored procedure for s_tblimps
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblimps

1.	IMPCOMPLETEDPCT cannot be null
	
2.	ACCOUNTNO must be in table s_tblimpsocc - FK Check

3.	IMPNO must be in table s_tblimpsocc - FK Check

4.	ACCOUNTNO must be in table s_tblimpsbltas - FK Check

5.	IMPNO must be in table s_tblimpsbltas - FK Check

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimps_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLIMPS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblimps]
	TRUNCATE TABLE [asr_staging].[s_tblimpsocc]
	TRUNCATE TABLE [asr_staging].[s_tblimpsbltas]
	TRUNCATE TABLE [dqm].[s_tblimps_err]
	
----------------------------------------------------------------------------------
	
-- This will test IMPCOMPLETEDPCT cannot be null

	INSERT INTO [asr_staging].[s_tblimps]
		(
		IMPCOMPLETEDPCT
		)	
			VALUES 
				(
				NULL
				);


-----------------------------------------------------------------------------------

-- TRUNCATE TABLE [asr_staging].[s_tblimpsbltas] 
-- and 
-- TRUNCATE TABLE [asr_staging].[s_tblimpsocc]
-- was run prior to this point.
-- this allows the following DQM unit tests to work


-- This will test ACCOUNTNO must be in table s_tblimpsocc and ACCOUNTNO must be in table s_tblimpsbltas 


	INSERT INTO [asr_staging].[s_tblimps]
		(
		 ACCOUNTNO
		 ,IMPCOMPLETEDPCT
		)	
			VALUES 
				(
				'R0003295',
				1.0000
				);


-- This will test IMPNO must be in table s_tblimpsocc and IMPNO must be in table s_tblimpsbltas

		INSERT INTO [asr_staging].[s_tblimps]
		(
		  IMPNO
		 ,IMPCOMPLETEDPCT
		)	
			VALUES 
				(
				1.00,
				1.0000
				);
	

--------------------------------------------------------------------------------

--run DQM stored procedure

	exec [dqm].[dqm_s_tblimps]

--------------------------------------------------------------------------------
-- compare record counts 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblimps])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblimps_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 10 then 'PASS' else 'FAIL' end,getdate(),'1 not null, ACCOUNTNO and IMPNO FK checks to s_tblimpsocc and s_tblimpsbltas  ');

END




