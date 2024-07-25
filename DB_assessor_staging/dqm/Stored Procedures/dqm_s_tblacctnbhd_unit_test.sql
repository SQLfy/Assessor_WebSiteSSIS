


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacctnbhd DQM rules
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblacctnbhd

1.	Fields accountno + nbhd + proptype + nbhdext have to be unique and can not be null 


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctnbhd_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTNBHD'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctnbhd]
	TRUNCATE TABLE [dqm].[s_tblacctnbhd_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process
	
	-- Fields accountno + nbhd + proptype + nbhdext have to be unique and can not be null 
		
	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		ACCOUNTNO
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		ACCOUNTNO
		)	
			VALUES 
				(
				''
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDCODE
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDCODE
		)	
			VALUES 
				(
				''
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		PROPERTYTYPE
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		PROPERTYTYPE
		)	
			VALUES 
				(
				''
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDEXTENSION
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDEXTENSION
		)	
			VALUES 
				(
				''
				);


	INSERT INTO [asr_staging].[s_tblacctnbhd]
		(
		ACCOUNTNO,NBHDCODE,PROPERTYTYPE,NBHDEXTENSION
		)	
			VALUES 
				(
				'R1234567','NBHDCODE','PROPTYPE','NBHDEXT'
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		(
		ACCOUNTNO,NBHDCODE,PROPERTYTYPE, NBHDEXTENSION
		)	
			VALUES 
				(
				'R1234567','NBHDCODE','PROPTYPE','NBHDEXT'
				);

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacctnbhd]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctnbhd])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctnbhd_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 24 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO,NBHDCODE,PROPERTYTYPE,and NBHDEXTENSION must not be NULL. Combination of ACCOUNTNO,NBHDCODE,PROPERTYTYPE,NBHDEXTENSION must be unique.');





	 



 

END





