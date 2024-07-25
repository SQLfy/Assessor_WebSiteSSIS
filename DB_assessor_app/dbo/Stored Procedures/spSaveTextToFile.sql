﻿CREATE PROCEDURE [dbo].[spSaveTextToFile]
  @TheString VARCHAR(MAX),
  @Filename VARCHAR(255),
  @Unicode INT=0
AS
  SET NOCOUNT ON
  DECLARE @MySpecialTempTable VARCHAR(255)
  DECLARE @Command NVARCHAR(4000)
  DECLARE @RESULT INT
 
 --SELECT @TheString
 --SELECT @FileName

--firstly we create a global temp table with a unique name
  SELECT  @MySpecialTempTable = '##temp'
       + CONVERT(VARCHAR(12), CONVERT(INT, RAND() * 1000000))
--then we create it using dynamic SQL, & insert a single row
--in it with the MAX Varchar stocked with the string we want
  SELECT  @Command = 'create table ['
       + @MySpecialTempTable
       + '] (MyID int identity(1,1), Bulkcol varchar(MAX))
insert into ['
       + @MySpecialTempTable
       + '](BulkCol) select @TheString'
  EXECUTE sp_ExecuteSQL @command, N'@TheString varchar(MAX)',
           @TheString
 
 
--then we execute the BCP to save the file
  SELECT  @Command = 'bcp "select BulkCol from ['
          + @MySpecialTempTable + ']'
          + '" queryout '
          + @Filename + ' '
         + CASE WHEN @Unicode=0 THEN '-c' ELSE '-w' END
          + ' -T -S' + @@servername
  --SELECT @Command
  EXECUTE @RESULT= xp_cmdshell @command, NO_OUTPUT
  --SELECT @RESULT
  EXECUTE ( 'Drop table ' + @MySpecialTempTable )
  RETURN @result
