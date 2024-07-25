

-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for s_tblimpsbltas
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblimpsbltas

1.	Effective age has to be between 0 and 999.99

2.	Year is <= system year

3.	The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimpsbltas_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLIMPSBLTAS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblimpsbltas]
	TRUNCATE TABLE [dqm].[s_tblimpsbltas_err]
	
----------------------------------------------------------------------------------
	
	-- for Effective age has to be between 0 and 999.99

	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		EFFECTIVEAGE
		)	
			VALUES 
				(
				9999
				);


 -- for Year is <= system year

	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		BLTASYEARBUILT
		)	
			VALUES 
				(
				2027
				);

	

	-- for The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		ACCOUNTNO,IMPNO, DETAILID
		)	
			VALUES 
				(
				'R0096604',1.00,49
				);


	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		ACCOUNTNO,IMPNO, DETAILID
		)	
			VALUES 
				(
				'R0096604',1.00,49
				);
	
	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblimpsbltas]

--------------------------------------------------------------------------------
-- compare record counts 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblimpsbltas])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblimpsbltas_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'check on EFFECTIVEAGE and BLTASYEARBUILT. combination of ACCOUNTNO, IMPNO, and DETAILID must be unique.');

END




