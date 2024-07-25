


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/27/2016
-- Description:	Unit testing stored procedure for S_TBLPERSONSECURE DQM rule
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLPERSONSECURE

1.	NAME1 must not contain "|" or any non-printable characters

2.	NAME2 must not contain "|" or any non-printable characters

3.	PERSONCODE must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tblpersonsecure_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLPERSONSECURE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblpersonsecure]
	TRUNCATE TABLE [dqm].[s_tblpersonsecure_err]
	
----------------------------------------------------------------------------------

	-- insert records into table to test DQM process


	-- NAME1 must not contain "|" or any non-printable characters


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME1
		)	
			VALUES 
				(
				111113,'BA'+char(184)+'D'
				);


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME1
		)	
			VALUES 
				(
				111114,'|'
				);

	-- NAME2 must not contain "|" or any non-printable characters


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME2
		)	
			VALUES 
				(
				111115,'BA'+char(185)+'D'
				);


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME2
		)	
			VALUES 
				(
				111116,'|'
				);


	-- PERSONCODE must be unique 

	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE
		)	
			VALUES 
				(
				413421
				);

		INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE
		)	
			VALUES 
				(
				413421
				);


--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblpersonsecure]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblpersonsecure])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblpersonsecure_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result]
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result]
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'NAME1 and NAME2 must not contain "|" or any non-printable characters. PERSONCODE must be unique.');


END





