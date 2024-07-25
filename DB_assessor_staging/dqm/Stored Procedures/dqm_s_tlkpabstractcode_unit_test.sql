

-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TLKPABSTRACTCODE
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TLKPABSTRACTCODE

1.	    ABSTRACTDESCRIPTION – must be 256 characters or less

*/


CREATE PROCEDURE [dqm].[dqm_s_tlkpabstractcode_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TLKPABSTRACTCODE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tlkpabstractcode]
	TRUNCATE TABLE [dqm].[s_tlkpabstractcode_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for ABSTRACTDESCRIPTION – must be 256 characters or less

	INSERT INTO [asr_staging].[s_tlkpabstractcode]
		( 
		ABSTRACTDESCRIPTION
		)	
			VALUES 
				(
				'This string needs to be a max of 256 characters but under 500.  I will make this one 256 characters long -------------------------------------------------------------------------------------------------------------------------------------------------------'
				);

	INSERT INTO [asr_staging].[s_tlkpabstractcode]
		( 
		ABSTRACTDESCRIPTION
		)	
			VALUES 
				(
				'This string needs to be a max of 256 characters but under 500.  I will make this one 257 characters long --------------------------------------------------------------------------------------------------------------------------------------------------------'
				);
	

	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tlkpabstractcode]

--------------------------------------------------------------------------------
-- compare record counts in s_tlkpabstractcode and s_tlkpabstractcode_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tlkpabstractcode])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tlkpabstractcode_err])

select @ROW_COUNT_DIFF =  @COUNT_TABLE - @COUNT_ERR_TABLE 



delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 1 then 'PASS' else 'FAIL' end,getdate(),'ABSTRACTDESCRIPTION must be 256 characters or less');


END




