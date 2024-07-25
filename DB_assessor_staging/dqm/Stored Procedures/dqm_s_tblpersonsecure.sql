

-- =============================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblpersonsecure table
-- =============================================================


/*
DQM RULES FOR:
TABLE:  S_TBLPERSONSECURE

1.	NAME1 cannot contain "|" or any non-printable characters

2.	NAME2 cannot contain "|" or any non-printable characters

3.	PERSONCODE must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tblpersonsecure]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	-- NAME1 cannot contain "|" or any non-printable characters


	-- DECLARE variables for use in the next several DQM checks

	DECLARE @tablename VARCHAR(1000) ='asr_staging.s_tblpersonsecure'
	DECLARE @columnname VARCHAR(100)='NAME1'
	DECLARE @counter INT = 0
	DECLARE @sql VARCHAR(MAX)


	-- create two temp tables for use in the next several DQM checks

	create table #tempBADCHAR1
	(BADCHAR varchar(MAX));

	create table #tempBADCHAR2
	(BADCHAR varchar(MAX));



	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2
	
	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;

	
	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	

	SET @counter = 124

	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1
	

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	
	-- join s_tblpersonsecure to #tempBADCHAR2 and insert error records into s_tblpersonsecure_err
	
	INSERT INTO [dqm].[s_tblpersonsecure_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, PERSONCODE, NAME1, NAME2, PHONE, FAX, MOBILE, PAGER, EMAILADDRESS, FEDERALIDNO, PRIVATEFLAG, PERSONON0, PERSONON1, PERSONON2, ALTNAME1, PERSONTYPEID, JURISDICTIONID, PERSONOD0, PERSONOD1, PERSONOM0, PERSONOM1, PERSONOT0, PERSONOT1, WRITEDATE, SEQID)
			SELECT 
					'NAME1',
					'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
					'NAME1 CANNOT CONTAIN NONPRINTABLE CHARS',
					@lv_RUNTIME,
					VERSTART, 
					VEREND, 
					PERSONCODE, 
					NAME1, 
					NAME2, 
					PHONE, 
					FAX, 
					MOBILE, 
					PAGER, 
					EMAILADDRESS, 
					FEDERALIDNO, 
					PRIVATEFLAG, 
					PERSONON0, 
					PERSONON1, 
					PERSONON2, 
					ALTNAME1, 
					PERSONTYPEID, 
					JURISDICTIONID, 
					PERSONOD0, 
					PERSONOD1, 
					PERSONOM0, 
					PERSONOM1, 
					PERSONOT0, 
					PERSONOT1, 
					WRITEDATE, 
					SEQID
				FROM [asr_staging].[s_tblpersonsecure] p
				JOIN #tempBADCHAR2 t
				on p.NAME1 = t.BADCHAR;


	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2

----------------------------------------------------------------------------------

	-- NAME2 cannot contain "|" or any non-printable characters

	-- SET @columnname to NAME2 table
	-- SET @counter to 0	

	SET @columnname='NAME2'
	SET @counter = 0
	

	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	

	

	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124

	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;



	-- join s_tblpersonsecure to #tempBADCHAR2 and insert error records into s_tblpersonsecure_err

	INSERT INTO [dqm].[s_tblpersonsecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, PERSONCODE, NAME1, NAME2, PHONE, FAX, MOBILE, PAGER, EMAILADDRESS, FEDERALIDNO, PRIVATEFLAG, PERSONON0, PERSONON1, PERSONON2, ALTNAME1, PERSONTYPEID, JURISDICTIONID, PERSONOD0, PERSONOD1, PERSONOM0, PERSONOM1, PERSONOT0, PERSONOT1, WRITEDATE, SEQID)
				SELECT 
						'NAME2',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'NAME2 CANNOT CONTAIN NONPRINTABLE CHARS',
						@lv_RUNTIME,
						VERSTART, 
					VEREND, 
					PERSONCODE, 
					NAME1, 
					NAME2, 
					PHONE, 
					FAX, 
					MOBILE, 
					PAGER, 
					EMAILADDRESS, 
					FEDERALIDNO, 
					PRIVATEFLAG, 
					PERSONON0, 
					PERSONON1, 
					PERSONON2, 
					ALTNAME1, 
					PERSONTYPEID, 
					JURISDICTIONID, 
					PERSONOD0, 
					PERSONOD1, 
					PERSONOM0, 
					PERSONOM1, 
					PERSONOT0, 
					PERSONOT1, 
					WRITEDATE, 
					SEQID
					FROM [asr_staging].[s_tblpersonsecure] p
					JOIN #tempBADCHAR2 t
					on p.NAME2 = t.BADCHAR;


	-- drop temp tables no longer needed for DQM checks
	
	drop table #tempBADCHAR1;
	drop table #tempBADCHAR2;


----------------------------------------------------------------------------------

	-- PERSONCODE must be unique

    WITH DUPE_VALUES AS (SELECT distinct PERSONCODE  FROM [asr_staging].[s_tblpersonsecure] GROUP BY PERSONCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblpersonsecure_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, PERSONCODE, NAME1, NAME2, PHONE, FAX, MOBILE, PAGER, EMAILADDRESS, FEDERALIDNO, PRIVATEFLAG, PERSONON0, PERSONON1, PERSONON2, ALTNAME1, PERSONTYPEID, JURISDICTIONID, PERSONOD0, PERSONOD1, PERSONOM0, PERSONOM1, PERSONOT0, PERSONOT1, WRITEDATE, SEQID)
	    SELECT 
					'PERSONCODE',
					'FIELD MUST BE UNIQUE',
					'PERSONCODE MUST BE UNIQUE',
					@lv_RUNTIME,
					VERSTART, 
					VEREND, 
					ps.PERSONCODE, 
					NAME1, 
					NAME2, 
					PHONE, 
					FAX, 
					MOBILE, 
					PAGER, 
					EMAILADDRESS, 
					FEDERALIDNO, 
					PRIVATEFLAG, 
					PERSONON0, 
					PERSONON1, 
					PERSONON2, 
					ALTNAME1, 
					PERSONTYPEID, 
					JURISDICTIONID, 
					PERSONOD0, 
					PERSONOD1, 
					PERSONOM0, 
					PERSONOM1, 
					PERSONOT0, 
					PERSONOT1, 
					WRITEDATE, 
					SEQID
				FROM [asr_staging].[s_tblpersonsecure] ps
			INNER JOIN DUPE_VALUES DV 
			ON ps.PERSONCODE = DV.PERSONCODE;


----------------------------------------------------------------------------------




	END	

END








