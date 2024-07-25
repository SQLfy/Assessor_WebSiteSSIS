
CREATE PROCEDURE dbo.sp_DisplayOAErrorInfo
    @Object int,
    @HResult int
AS
    DECLARE @Output nvarchar(255);
    DECLARE @HRHex nchar(10);
    DECLARE @HR int;
    DECLARE @Source nvarchar(255);
    DECLARE @Description nvarchar(255);
    PRINT N'OLE Automation Error Information';
    EXEC sp_HexToChar @HResult, @HRHex OUT;
    SELECT @Output = N'  HRESULT: ' + @HRHex;
    PRINT @Output;
    EXEC @HR = sp_OAGetErrorInfo
        @Object,
        @Source OUT,
        @Description OUT;
    IF @HR = 0
    BEGIN
        SELECT @Output = N'  Source: ' + @Source;
        PRINT @Output;
        SELECT @Output = N'  Description: '
               + @Description;
        PRINT @Output;
    END
    ELSE
    BEGIN
       PRINT N' sp_OAGetErrorInfo failed.';
       RETURN;
    END




