


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 9/16/2014
-- Description:	Unit testing stored procedure for s_tmaptaxdistrictauthority
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TMAPTAXDISTRICTAUTHORITY

1	    The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tmaptaxdistrictauthority_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TMAPTAXDISTRICTAUTHORITY'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tmaptaxdistrictauthority]
	TRUNCATE TABLE [dqm].[s_tmaptaxdistrictauthority_err]
	TRUNCATE TABLE [asr_staging].[s_tlkptaxdistrict]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique

	INSERT INTO [asr_staging].[s_tmaptaxdistrictauthority]
		(
		TAXYEAR,TAXDISTRICT,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'0030','0001'
				);


	INSERT INTO [asr_staging].[s_tmaptaxdistrictauthority]
		(
		TAXYEAR,TAXDISTRICT,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'0030','0001'
				);

	
--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tmaptaxdistrictauthority]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tmaptaxdistrictauthority])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tmaptaxdistrictauthority_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique');





	 



 

END





