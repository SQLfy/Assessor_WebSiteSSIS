CREATE PROCEDURE [dbo].[usp_OLEWriteFile] (@FileName varchar(1000), @TextData NVARCHAR(MAX),@FileAction VARCHAR(12)) AS  
  
BEGIN  
DECLARE @OLEfilesytemobject INT
DECLARE @OLEResult INT  
DECLARE @FileID INT  
  
EXECUTE @OLEResult =   
sp_OACreate 'Scripting.FileSystemObject', @OLEfilesytemobject OUT  
IF @OLEResult <> 0  
BEGIN  
    RAISERROR('Error %d creating object.', 16, 1, @OLEResult)
    RETURN
END 
  
-- check if file exists  
EXEC sp_OAMethod @OLEfilesytemobject, 'FileExists', @OLEresult OUT, @FileName   
-- if file esists  
BEGIN     
  
IF (@FileAction = 'CREATENEW')  
PRINT 'New file specified, creating...'  
IF (@OLEresult=1 AND @FileAction = 'APPEND')   
PRINT 'File exists, appending...'  
IF (@OLEresult=0 AND @FileAction = 'APPEND')   
PRINT 'File doesnt exist, creating...'   
  
-- open file  
EXECUTE @OLEResult = sp_OAMethod @OLEfilesytemobject, 'OpenTextFile', @FileID OUT,  
@FileName, 8, 1   
IF @OLEResult <> 0  
BEGIN  
    RAISERROR('Error %d opening file.', 16, 1, @OLEResult)
    RETURN
END 
  
-- write Text1 to the file  
EXECUTE @OLEResult = sp_OAMethod @FileID, 'WriteLine', Null, @TextData  
IF @OLEResult <> 0  
BEGIN  
    RAISERROR('Error %d writing line.', 16, 1, @OLEResult)
    RETURN
END 
IF (@OLEresult=1 AND @FileAction = 'CREATENEW')  
PRINT 'File Exists, specify APPEND if this is the desired action'  
  
EXECUTE @OLEResult = sp_OADestroy @FileID  
EXECUTE @OLEResult = sp_OADestroy @OLEfilesytemobject  
  
END   
  
END  
