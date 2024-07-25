


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TLKPLEATYPE
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPLEATYPE

1.	LEADESCRIPTION - cannot be NULL

2.  LEA – must be unique
     
3.	The combination of LEA and LEADESCRIPTION – must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tlkpleatype_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TLKPLEATYPE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tlkpleatype]
	TRUNCATE TABLE [dqm].[s_tlkpleatype_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for LEADESCRIPTION - cannot be NULL and also checking for empty string

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEADESCRIPTION
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEADESCRIPTION
		)	
			VALUES 
				(
				''
				);


	-- for LEA – must be unique

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA
		)	
			VALUES 
				(
				'110013'
				);


	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA
		)	
			VALUES 
				(
				'110013'
				);



	-- for The combination of LEA and LEADESCRIPTION – must be unique

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA,LEADESCRIPTION
		)	
			VALUES 
				(
				'110014','STONEGATE #34'
				);


	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA,LEADESCRIPTION
		)	
			VALUES 
				(
				'110014','STONEGATE #34'
				);


	
	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tlkpleatype]

--------------------------------------------------------------------------------
-- compare record counts in s_tlkpleatype and s_tlkpleatype_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tlkpleatype])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tlkpleatype_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 4 then 'PASS' else 'FAIL' end,getdate(),'LEADESCRIPTION cannot be NULL. LEA must be unique. The combination of LEA and LEADESCRIPTION must be unique');



END




