CREATE TABLE [asr_api_test].[AccountSalesData] (
    [id]              INT             IDENTITY (1, 1) NOT NULL,
    [accountNo]       VARCHAR (30)    NOT NULL,
    [recordingNumber] VARCHAR (20)    NULL,
    [grantor]         VARCHAR (100)   NULL,
    [grantee]         VARCHAR (100)   NULL,
    [date]            DATETIME2 (7)   NULL,
    [price]           NUMERIC (15, 2) NULL,
    [deedType]        VARCHAR (100)   NULL,
    [book]            VARCHAR (6)     NULL,
    [page]            VARCHAR (10)    NULL,
    [isValid1]        BIT             NULL,
    [isImproved]      BIT             NULL,
    CONSTRAINT [FK_AccountSalesData_AccountLevelData] FOREIGN KEY ([accountNo]) REFERENCES [asr_api_test].[AccountLevelData_Old] ([accountNumber]) NOT FOR REPLICATION
);


GO
ALTER TABLE [asr_api_test].[AccountSalesData] NOCHECK CONSTRAINT [FK_AccountSalesData_AccountLevelData];


GO
CREATE CLUSTERED INDEX [ClusteredIndex-20170608-150057]
    ON [asr_api_test].[AccountSalesData]([id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_AccountNo]
    ON [asr_api_test].[AccountSalesData]([accountNo] ASC)
    INCLUDE([recordingNumber], [price], [isValid1], [isImproved]);


GO
CREATE NONCLUSTERED INDEX [idx_SalePrice]
    ON [asr_api_test].[AccountSalesData]([price] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_SaleDate]
    ON [asr_api_test].[AccountSalesData]([date] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_RecordingNumber]
    ON [asr_api_test].[AccountSalesData]([recordingNumber] ASC);

