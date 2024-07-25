

-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for s_tmaptaxauthoritydetailfund
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TMAPTAXAUTHORITYDETAILFUND

1.	    The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY – must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tmaptaxauthoritydetailfund_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TMAPTAXAUTHORITYDETAILFUND'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tmaptaxauthoritydetailfund]
	TRUNCATE TABLE [dqm].[s_tmaptaxauthoritydetailfund_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY – must be unique


	INSERT INTO [asr_staging].[s_tmaptaxauthoritydetailfund]
		(
		TAXYEAR,FUNDCODE,LEVYTYPEID,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'GENERAL',1,'0001'
				);


	INSERT INTO [asr_staging].[s_tmaptaxauthoritydetailfund]
		(
		TAXYEAR,FUNDCODE,LEVYTYPEID,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'GENERAL',1,'0001'
				);


	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tmaptaxauthoritydetailfund]

--------------------------------------------------------------------------------
-- compare record counts in s_tmaptaxauthoritydetailfund and s_tmaptaxauthoritydetailfund_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tmaptaxauthoritydetailfund])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tmaptaxauthoritydetailfund_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY must be unique');



END




