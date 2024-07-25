


-- ==============================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tbladdresssecure table
-- ==============================================================


/*
DQM RULES FOR:
TABLE:  tbladdresssecure

1.	ADDRESSCODE must be unique and can not be null

2.	ADDRESS1 must not contain '|' or non printable characters

3.	ADDRESS2 must not contain '|' or non printable characters

4.	CITY must not contain '|' or non printable characters

5.	STATECODE must not contain '|' or non printable characters

6.	ZIPCODE must not contain '|' or non printable characters

7.	STATECODE must be 2 characters long

*/

CREATE PROCEDURE [dqm].[dqm_s_tbladdresssecure_testing]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	-- create two table variables

    DECLARE @tempBADCHAR1 TABLE
    (
      BADCHAR varchar(MAX)
    );
    
    DECLARE @tempBADCHAR2 TABLE
    (
      BADCHAR varchar(MAX)
    )


	BEGIN

     --Begin DQM checks for the table for each row.


----------------------------------------------------------------------------------

--	-- ADDRESSCODE must be unique and can not be null
--	
--	INSERT INTO [dqm].[s_tbladdresssecure_err]
--	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
--	    SELECT 
--				'ADDRESSCODE',
--				'FIELD CANNOT BE NULL',
--				'ADDRESSCODE CANNOT BE NULL',
--				--getdate(),
--				@lv_RUNTIME,
--				VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
--			FROM  [asr_staging].[s_tbladdresssecure]
--			WHERE addresscode is NULL;
--
--
--
--   WITH DUPE_VALUES AS (SELECT distinct ADDRESSCODE  FROM [asr_staging].[s_tbladdresssecure] GROUP BY ADDRESSCODE HAVING COUNT(*) > 1)
--	
--	INSERT INTO [dqm].[s_tbladdresssecure_err]
--	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
--	    SELECT 
--					'ADDRESSCODE',
--					'FIELD MUST BE UNIQUE',
--					'ADDRESSCODE MUST BE UNIQUE',
--					--getdate(),
--					@lv_RUNTIME,
--					VERSTART, VEREND, aa.ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
--				FROM [asr_staging].[s_tbladdresssecure] aa
--			INNER JOIN DUPE_VALUES DV 
--			ON aa.ADDRESSCODE = DV.ADDRESSCODE
--			;
--

----------------------------------------------------------------------------------

	-- ADDRESS1 must not contain '|' or non printable characters


	-- DECLARE variables for use in the next several DQM checks

	DECLARE @tablename VARCHAR(1000) ='asr_staging.s_tbladdresssecure'
	DECLARE @columnname VARCHAR(100)='ADDRESS1'
	DECLARE @counter INT = 0
	DECLARE @sql VARCHAR(MAX)


--	-- create two temp tables for use in the next several DQM checks
--
--	create table #tempBADCHAR1
--	(BADCHAR varchar(MAX));
--
--	create table #tempBADCHAR2
--	(BADCHAR varchar(MAX));
--


-----------------------------------------------


	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2
	
	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into @tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into @tempBADCHAR2 select distinct(BADCHAR) from @tempBADCHAR1;

	

	-- truncate #tempBADCHAR1 in preparation for the next check

	delete from @tempBADCHAR1
	



	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124
	

	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into @tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into @tempBADCHAR2 select distinct(BADCHAR) from @tempBADCHAR1;



	-- truncate #tempBADCHAR1 in preparation for the next check

	delete from @tempBADCHAR1
	



	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into @tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into @tempBADCHAR2 select distinct(BADCHAR) from @tempBADCHAR1;


	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err

		INSERT INTO [dqm].[s_tbladdresssecure_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
			SELECT 
					'ADDRESS1',
					'FIELD CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
					'ADDRESS1 CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
					--getdate(),
					@lv_RUNTIME,
					VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
				FROM [asr_staging].[s_tbladdresssecure] a
				JOIN @tempBADCHAR2 t
				on a.ADDRESS1 = t.BADCHAR
				

	-- truncate temp tables in preparation for the next check

	delete from #tempBADCHAR1
	delete from #tempBADCHAR2

	drop table #tempBADCHAR1
	drop table #tempBADCHAR2

	
		 

----------------------------------------------------------------------------------

	-- ADDRESS2 must not contain '|' or non printable characters

	-- SET @columnname to ADDRESS2 table
	-- SET @counter to 0

--	SET @columnname='ADDRESS2'
--	SET @counter = 0
--	
--
--	-- begin check for ASCII character codes 0 through 31
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--	WHILE @counter <=31
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--	
--
--	-- truncate #tempBADCHAR1 in preparation for the next check
--	
--	truncate table #tempBADCHAR1
--
--
--
--	-- begin check for ASCII character code 124.  ASCII 124 is |
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2 
--
--	SET @counter = 124
--	
--	WHILE @counter =124
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--
--	-- truncate #tempBADCHAR1 in preparation for the next check
--	
--	truncate table #tempBADCHAR1
--	
--
--
--	-- begin check for ASCII character codes 127 through 255
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--	SET @counter = 127
--	
--	WHILE @counter <=255
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--		
--		
--		
--	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err		
--		
--	INSERT INTO [dqm].[s_tbladdresssecure_err]
--		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
--				SELECT 
--						'ADDRESS2',
--						'FIELD CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
--						'ADDRESS2 CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
--						--getdate(),
--						@lv_RUNTIME,
--						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
--					FROM [asr_staging].[s_tbladdresssecure] a
--					JOIN #tempBADCHAR2 t
--					on a.ADDRESS2 = t.BADCHAR
--
--
--	
--	-- truncate temp tables in preparation for the next check
--
--	truncate table #tempBADCHAR1
--	truncate table #tempBADCHAR2
--
--
--
--
------------------------------------------------------------------------------------
--	
--	-- CITY must not contain '|' or non printable characters
--	
--	-- SET @columnname to CITY table
--	-- SET @counter to 0	
--		
--	SET @columnname='CITY'
--	SET @counter = 0
--	
--
--	-- begin check for ASCII character codes 0 through 31
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--	WHILE @counter <=31
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--	
--	-- truncate #tempBADCHAR1 in preparation for the next check
--
--	truncate table #tempBADCHAR1
--	
--
--
--
--	-- begin check for ASCII character code 124.  ASCII 124 is |
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2 
--
--	SET @counter = 124
--	
--	WHILE @counter =124
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--
--	-- truncate #tempBADCHAR1 in preparation for the next check
--	
--	truncate table #tempBADCHAR1
--	
--
--
--
--	-- begin check for ASCII character codes 127 through 255
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--
--	SET @counter = 127
--	
--	WHILE @counter <=255
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--
--	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err
--		
--		INSERT INTO [dqm].[s_tbladdresssecure_err]
--			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
--				SELECT 
--						'CITY',
--						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
--						'CITY CANNOT CONTAIN NONPRINTABLE CHARS',
--						--getdate(),
--						@lv_RUNTIME,
--						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
--					FROM [asr_staging].[s_tbladdresssecure] a
--					JOIN #tempBADCHAR2 t
--					on a.CITY = t.BADCHAR
--
--
--	-- truncate temp tables in preparation for the next check
--
--		truncate table #tempBADCHAR1
--		truncate table #tempBADCHAR2
--
------------------------------------------------------------------------------------
-- 
--	-- STATECODE must not contain '|' or non printable characters
--
--	-- SET @columnname to STATECODE table
--	-- SET @counter to 0
--
--	SET @columnname='STATECODE'
--	SET @counter = 0
--	
--
--	-- begin check for ASCII character codes 0 through 31
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--	WHILE @counter <=31
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--	
--	-- truncate #tempBADCHAR1 in preparation for the next check
--
--	truncate table #tempBADCHAR1
--	
--
--
--
--	-- begin check for ASCII character code 124.  ASCII 124 is |
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2 
--
--	SET @counter = 124
--	
--	WHILE @counter =124
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--
--	-- truncate #tempBADCHAR1 in preparation for the next check
--
--	truncate table #tempBADCHAR1
--	
--
--
--
--	-- begin check for ASCII character codes 127 through 255
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--
--	SET @counter = 127
--	
--	WHILE @counter <=255
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--
--
--	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err
--
--		INSERT INTO [dqm].[s_tbladdresssecure_err]
--			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
--				SELECT 
--						'STATECODE',
--						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
--						'STATECODE CANNOT CONTAIN NONPRINTABLE CHARS',
--						--getdate(),
--						@lv_RUNTIME,
--						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
--					FROM [asr_staging].[s_tbladdresssecure] a
--					JOIN #tempBADCHAR2 t
--					on a.STATECODE = t.BADCHAR
--
--	-- truncate temp tables in preparation for the next check
--
--		truncate table #tempBADCHAR1
--		truncate table #tempBADCHAR2
--
------------------------------------------------------------------------------------
--
--	-- ZIPCODE must not contain '|' or non printable characters
--
--	-- SET @columnname to ZIPCODE table
--	-- SET @counter to 0
--
--	SET @columnname='ZIPCODE'
--	SET @counter = 0
--	
--
--	-- begin check for ASCII character codes 0 through 31
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--	WHILE @counter <=31
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--	
--	-- truncate #tempBADCHAR1 in preparation for the next check
--
--	truncate table #tempBADCHAR1
--	
--
--
--
--	-- begin check for ASCII character code 124.  ASCII 124 is |
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2 
--
--	SET @counter = 124
--	
--	WHILE @counter =124
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--
--	-- truncate #tempBADCHAR1 in preparation for the next check
--	
--	truncate table #tempBADCHAR1
--	
--
--
--
--	-- begin check for ASCII character codes 127 through 255
--	-- insert found records into #tempBADCHAR1
--	-- insert distinct records into #tempBADCHAR2
--
--	SET @counter = 127
--	
--	WHILE @counter <=255
--	BEGIN
--
--	SET @sql=
--
--		'insert into #tempBADCHAR1
--		SELECT '+@columnname+'
--		FROM '+@tablename+'
--		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'
--
--	EXEC (@sql)
--	SET @counter = @counter + 1
--	END
--
--	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
--
--
--	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err
--
--		INSERT INTO [dqm].[s_tbladdresssecure_err]
--			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
--				SELECT 
--						'ZIPCODE',
--						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
--						'ZIPCODE CANNOT CONTAIN NONPRINTABLE CHARS',
--						--getdate(),
--						@lv_RUNTIME,
--						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
--					FROM [asr_staging].[s_tbladdresssecure] a
--					JOIN #tempBADCHAR2 t
--					on a.ZIPCODE = t.BADCHAR
--
--
--	-- drop temp tables no longer needed for DQM checks
--
--	drop table #tempBADCHAR1
--	drop table #tempBADCHAR2
--
------------------------------------------------------------------------------------
--
--	-- STATECODE must be 2 characters long
--
--
--		INSERT INTO [dqm].[s_tbladdresssecure_err]
--			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
--			  SELECT 
--				'STATECODE',
--				'FIELD MUST BE 2 CHARS',
--				'STATECODE MUST BE 2 CHARS',
--				--getdate(),
--				@lv_RUNTIME,
--				VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
--			FROM [asr_staging].[s_tbladdresssecure]
--			WHERE len(statecode) <> 2
--
----------------------------------------------------------------------------------

	END	

END









