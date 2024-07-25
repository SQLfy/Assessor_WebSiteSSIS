CREATE TABLE [dbo].[WebETL] (
    [ID]                   INT            NOT NULL,
    [PROPERTY_NAME]        VARCHAR (250)  NULL,
    [PROPERTY_TYPE]        NVARCHAR (255) NULL,
    [PROPERTY_DESCRIPTION] VARCHAR (1000) NULL,
    [PARAMETER_FORMAT]     VARCHAR (50)   NULL,
    [PARAMETER_VALUE]      VARCHAR (100)  NULL,
    [ETL_NAME]             VARCHAR (50)   NULL
);


GO

CREATE Trigger [dbo].[trg_WebETL_audit_update] ON [dbo].[WebETL] AFTER UPDATE AS  
BEGIN  
    SET NOCOUNT ON

    INSERT Audit.WebETL(ParamID,ParameterName,ParameterValue,Action,RowType,ChangedBy)
    SELECT ID,ETL_NAME,PARAMETER_VALUE,'Updated','Old',SUSER_SNAME() FROM Deleted

    INSERT Audit.WebETL(ParamID,ParameterName,ParameterValue,Action,RowType,ChangedBy)
    SELECT ID,ETL_NAME,PARAMETER_VALUE,'Updated','New',SUSER_SNAME() FROM Inserted

END

GO

CREATE Trigger [dbo].[trg_WebETL_audit_insert] ON [dbo].[WebETL] AFTER INSERT AS  
BEGIN  
    SET NOCOUNT ON

    INSERT Audit.WebETL(ParamID,ParameterName,ParameterValue,Action,RowType,ChangedBy)
    SELECT ID,ETL_NAME,PARAMETER_VALUE,'Inserted','New',SUSER_SNAME() FROM Inserted

END

GO


CREATE Trigger [dbo].[trg_WebETL_audit_delete] ON [dbo].[WebETL] AFTER DELETE AS  
BEGIN  
    SET NOCOUNT ON

    INSERT Audit.WebETL(ParamID,ParameterName,ParameterValue,Action,RowType,ChangedBy)
    SELECT ID,ETL_NAME,PARAMETER_VALUE,'Deleted','Old',SUSER_SNAME() FROM Deleted

END
