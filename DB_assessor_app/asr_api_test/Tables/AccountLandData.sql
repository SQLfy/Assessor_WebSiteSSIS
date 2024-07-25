CREATE TABLE [asr_api_test].[AccountLandData] (
    [id]                             INT             IDENTITY (1, 1) NOT NULL,
    [accountNo]                      VARCHAR (30)    NOT NULL,
    [attributeType]                  VARCHAR (30)    NULL,
    [attributeTypeDescription]       VARCHAR (50)    NULL,
    [attributeAdjustment]            NUMERIC (15, 6) NULL,
    [segmentAbstractCode]            VARCHAR (50)    NULL,
    [segmentAbstractCodeDescription] VARCHAR (100)   NULL,
    [type]                           VARCHAR (50)    NULL,
    [acres]                          NUMERIC (20, 6) NULL,
    [actualValue]                    NUMERIC (15, 2) NULL,
    [landSf]                         NUMERIC (20, 6) NULL,
    CONSTRAINT [PK_AccountLandData] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_AccountLandData_AccountLevelData] FOREIGN KEY ([accountNo]) REFERENCES [asr_api_test].[AccountLevelData_Old] ([accountNumber]) NOT FOR REPLICATION
);


GO
ALTER TABLE [asr_api_test].[AccountLandData] NOCHECK CONSTRAINT [FK_AccountLandData_AccountLevelData];


GO
CREATE NONCLUSTERED INDEX [idx_AttributeTypeDescription]
    ON [asr_api_test].[AccountLandData]([attributeTypeDescription] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_SegmentAbstractCode]
    ON [asr_api_test].[AccountLandData]([segmentAbstractCode] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_Acres]
    ON [asr_api_test].[AccountLandData]([acres] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_LandSf]
    ON [asr_api_test].[AccountLandData]([landSf] ASC);

