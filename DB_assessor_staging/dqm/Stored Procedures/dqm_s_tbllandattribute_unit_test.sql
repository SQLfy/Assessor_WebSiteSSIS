


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 4/6/2016
-- Description:	Unit testing stored procedure for S_TBLLANDATTRIBUTE
-- =====================================================================================



/*
DQM RULES FOR:
TABLE:  S_TBLLANDATTRIBUTE

1.		ACCOUNTNO must be in table s_tbllandabstract - FK Check

2.		ATTRIBUTETYPE must be in table s_tlkplandattributetype - FK Check

*/



CREATE PROCEDURE [dqm].[dqm_s_tbllandattribute_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLLANDATTRIBUTE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tbllandattribute]
	TRUNCATE TABLE [dqm].[s_tbllandattribute_err]
	TRUNCATE TABLE [asr_staging].[s_tbllandabstract]
	TRUNCATE TABLE [asr_staging].[s_tlkplandattributetype]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	
	-- for ACCOUNTNO must be in table s_tbllandabstract - FK Check
    -- and
	-- for ATTRIBUTETYPE must be in table s_tlkplandattributetype - FK Check

	INSERT INTO [asr_staging].[s_tbllandattribute]
		(
		ACCOUNTNO,ATTRIBUTETYPE
		)	
			VALUES 
				(
				'R0367063','CDS'
				);
	

--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tbllandattribute]

--------------------------------------------------------------------------------
-- compare record counts in s_tbllandattribute and s_tbllandattribute_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tbllandattribute])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tbllandattribute_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result]
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result]
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 1 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO must be in table s_tbllandabstract AND ATTRIBUTETYPE must be in table s_tlkplandattributetype');


END




