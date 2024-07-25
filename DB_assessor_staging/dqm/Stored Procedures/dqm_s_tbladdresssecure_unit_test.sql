


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tbladdresssecure DQM rule
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tbladdresssecure

1.	ADDRESSCODE must be unique and can not be null

2.	ADDRESS1 can not contain '|' or non printable characters

3.	ADDRESS2 can not contain '|' or non printable characters

4.	CITY can not contain '|' or non printable characters

5.	STATECODE can not contain '|' or non printable characters

6.	ZIPCODE can not contain '|' or non printable characters

7.	STATECODE must be 2 characters long

*/

CREATE PROCEDURE [dqm].[dqm_s_tbladdresssecure_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLADDRESSSECURE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tbladdresssecure]
	TRUNCATE TABLE [dqm].[s_tbladdresssecure_err]
	
----------------------------------------------------------------------------------

	-- 	ADDRESSCODE must be unique and can not be null

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				123456
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				123456
				);
	
	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				NULL
				);


	-- ADDRESS1 can not contain '|' or non printable characters
				
	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS1
		)	
			VALUES 
				(
				111111,'BA'+char(182)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS1
		)	
			VALUES 
				(
				111112,'|'
				);


	-- ADDRESS2 can not contain '|' or non printable characters

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS2
		)	
			VALUES 
				(
				111113,'BA'+char(183)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS2
		)	
			VALUES 
				(
				111114,'|'
				);


	-- CITY can not contain '|' or non printable characters

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, CITY
		)	
			VALUES 
				(
				111115,'BA'+char(11)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, CITY
		)	
			VALUES 
				(
		        111116,'|'
				);


	-- STATECODE can not contain '|' or non printable characters

		INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, STATECODE
		)	
			VALUES 
				(
				111117,char(19)
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, STATECODE
		)	
			VALUES 
				(
				111118,'|'
				);


	-- ZIPCODE can not contain '|' or non printable characters

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ZIPCODE
		)	
			VALUES 
				(
				111119,'BA'+char(12)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ZIPCODE
		)	
			VALUES 
				(
				111120,'|'
				);



	-- STATECODE must be 2 characters long

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, STATECODE
		)	
			VALUES 
				(
				111121,'C'
				);

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tbladdresssecure]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tbladdresssecure])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tbladdresssecure_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'ADDRESSCODE must be unique and not null. ADDRESS1,ADDRESS2,CITY,STATECODE,ZIPCODE can not contain | or non printable characters. STATECODE must be 2 characters long');


END





