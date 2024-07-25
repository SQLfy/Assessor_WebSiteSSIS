



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 9/17/2014
-- Description:	Unit testing stored procedure for S_TBNSUBFILING
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBNSUBFILING

1.	    SUBFILINGRECORDINGNO – cannot be NULL

*/

CREATE PROCEDURE [dqm].[dqm_s_tbnsubfiling_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBNSUBFILING'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tbnsubfiling]
	TRUNCATE TABLE [dqm].[s_tbnsubfiling_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- SUBFILINGRECORDINGNO – cannot be NULL and also test for null string

	INSERT INTO [asr_staging].[s_tbnsubfiling]
		( 
		SUBFILINGRECORDINGNO
		)	
			VALUES 
				(
				NULL
				);


	INSERT INTO [asr_staging].[s_tbnsubfiling]
		( 
		SUBFILINGRECORDINGNO
		)	
			VALUES 
				(
				''
				);
	
	
--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tbnsubfiling]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tbnsubfiling])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tbnsubfiling_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME


insert into [dqm].[assessor_unit_test_result]
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'SUBFILINGRECORDINGNO – cannot be NULL');





	 



 

END






