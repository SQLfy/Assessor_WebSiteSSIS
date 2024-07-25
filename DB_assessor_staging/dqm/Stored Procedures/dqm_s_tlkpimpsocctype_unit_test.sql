

-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TLKPIMPSOCCTYPE
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TLKPIMPSOCCTYPE

1.  OCCCODE – must be unique
     
2.	OCCCODEDESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpimpsocctype_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TLKPIMPSOCCTYPE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tlkpimpsocctype]
	TRUNCATE TABLE [dqm].[s_tlkpimpsocctype_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	


	-- for OCCCODE – must be unique

	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODE
		)	
			VALUES 
				(
				144
				);


	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODE
		)	
			VALUES 
				(
				144
				);



	-- for OCCCODEDESCRIPTION – must be unique

	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODEDESCRIPTION
		)	
			VALUES 
				(
				'Grain Hopper'
				);


	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODEDESCRIPTION
		)	
			VALUES 
				(
				'Grain Hopper'
				);


	
	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tlkpimpsocctype]

--------------------------------------------------------------------------------
-- compare record counts in s_tlkpimpsocctype and s_tlkpimpsocctype_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tlkpimpsocctype])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tlkpimpsocctype_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'OCCCODE and OCCCODEDESCRIPTION must be unique');




END




