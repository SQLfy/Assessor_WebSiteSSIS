


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TBLSALE
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSALE

1.	GRANTOR – cannot be NULL

3.  GRANTEE - cannot be NULL

4	SALEPRICE – must be gt or = to zero

4	RECEPTIONNO – must be lt or = 10 charaters

5.  DOCUMENTDATE - must be a valid date in sql server

6.  SALEDATE - must be a valid date in sql server

*/

CREATE PROCEDURE [dqm].[dqm_s_tblsale_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLSALE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblsale]
	TRUNCATE TABLE [dqm].[s_tblsale_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for GRANTOR – cannot be NULL and also checking for empty string

	INSERT INTO [asr_staging].[s_tblsale]
		( 
		GRANTOR
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblsale]
		( 
		GRANTOR
		)	
			VALUES 
				(
				''
				);


	-- for GRANTEE - cannot be NULL and also checking for empty string

	INSERT INTO [asr_staging].[s_tblsale]
		(
		GRANTEE
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblsale]
		(
		GRANTEE
		)	
			VALUES 
				(
				''
				);



	-- SALEPRICE – must be gt or = to zero

	INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEPRICE
		)	
			VALUES 
				(
				0
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEPRICE
		)	
			VALUES 
				(
				-100
				);


	-- RECEPTIONNO – must be lt or = 10 charaters

	INSERT INTO [asr_staging].[s_tblsale]
		(
		RECEPTIONNO
		)	
			VALUES 
				(
				'0005717012'
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		RECEPTIONNO
		)	
			VALUES 
				(
				'00057170123'
				);


	-- DOCUMENTDATE - must be a valid date in sql server

		INSERT INTO [asr_staging].[s_tblsale]
		(
		DOCUMENTDATE
		)	
			VALUES 
				(
				'1750-08-03 00:00:00'
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		DOCUMENTDATE
		)	
			VALUES 
				(
				'2050-08-03 00:00:00'
				);



	-- SALEDATE - must be a valid date in sql server

			INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEDATE
		)	
			VALUES 
				(
				'1750-08-03 00:00:00'
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEDATE
		)	
			VALUES 
				(
				'2050-08-03 00:00:00'
				);


	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblsale]

--------------------------------------------------------------------------------
-- compare record counts in s_tblsale and s_tblsale_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblsale])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblsale_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE



delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME 

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 18 then 'PASS' else 'FAIL' end,getdate(),'GRANTOR and GRANTEE cannot be NULL. SALEPRICE must be gt or = to zero. RECEPTIONNO must be lt or = 10 charaters. DOCUMENTDATE and SALEDATE must be a valid date in sql server.');


 

END




