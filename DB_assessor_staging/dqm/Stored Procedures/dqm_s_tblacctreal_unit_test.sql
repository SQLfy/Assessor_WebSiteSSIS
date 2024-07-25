

-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for s_tblacctreal
-- =====================================================================================


/*
DQM RULES FOR:

1.	VACANTFLAG must be 0 or 1
2.	IMPONLYFLAG must be 0 or 1


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctreal_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTREAL'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctreal]
	TRUNCATE TABLE [dqm].[s_tblacctreal_err]

----------------------------------------------------------------------------------


	
	INSERT INTO [asr_staging].[s_tblacctreal]
		(
		VACANTFLAG
		)	
			VALUES 
				(
				2
				);

	
	INSERT INTO [asr_staging].[s_tblacctreal]
		(
		IMPONLYFLAG
		)	
			VALUES 
				(
				3
				);

	

--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblacctreal]

--------------------------------------------------------------------------------
-- compare record counts 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctreal])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctreal_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'VACANTFLAG and IMPONLYFLAG must be 0 or 1');




END




