


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TBLIMPSDETAIL
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TBLIMPSDETAIL

1.		ACCOUNTNO must be in table s_tblimps - FK Check

2.		IMPNO must be in table s_tblimps - FK Check

3.		IMPDETAILDESCRIPTION cannot be null

4.		IMPDETAILTYPE cannot be null

5.		The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tblimpsdetail_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLIMPSDETAIL'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblimpsdetail]
	TRUNCATE TABLE [dqm].[s_tblimpsdetail_err]
	TRUNCATE TABLE [asr_staging].[s_tblimps]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	
	-- for ACCOUNTNO must be in table s_tblimps - FK Check
    -- and
	-- for IMPNO must be in table s_tblimps - FK Check

	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		ACCOUNTNO,IMPNO
		)	
			VALUES 
				(
				'R0346636',19.00
				);


	-- for not null checks
	
	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILDESCRIPTION
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILTYPE
		)	
			VALUES 
				(
				NULL
				);





	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILDESCRIPTION
		)	
			VALUES 
				(
				''
				);

		INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILTYPE
		)	
			VALUES 
				(
				''
				);


	-- for The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique


	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		ACCOUNTNO,IMPNO,DETAILID
		)	
			VALUES 
				(
				'R0100765',1.00,27457925
				);

	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		ACCOUNTNO,IMPNO,DETAILID
		)	
			VALUES 
				(
				'R0100765',1.00,27457925
				);


	

--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblimpsdetail]

--------------------------------------------------------------------------------
-- compare record counts in s_tblimpsdetail and s_tblimpsdetail_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblimpsdetail])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblimpsdetail_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 23 then 'PASS' else 'FAIL' end,getdate(),'FK check ACCOUNTNO and IMPNO must be in table s_tblimps.  IMPDETAILDESCRIPTION and IMPDETAILTYPE cannot be null. The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique.');


END




