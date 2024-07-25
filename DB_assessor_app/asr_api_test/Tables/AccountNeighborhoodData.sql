CREATE TABLE [asr_api_test].[AccountNeighborhoodData] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [accountNo] VARCHAR (30) NOT NULL,
    [code]      VARCHAR (50) NULL,
    [extension] VARCHAR (50) NULL,
    CONSTRAINT [FK_AccountNeighborhoodData_AccountLevelData] FOREIGN KEY ([accountNo]) REFERENCES [asr_api_test].[AccountLevelData_Old] ([accountNumber]) NOT FOR REPLICATION
);


GO
ALTER TABLE [asr_api_test].[AccountNeighborhoodData] NOCHECK CONSTRAINT [FK_AccountNeighborhoodData_AccountLevelData];


GO
CREATE CLUSTERED INDEX [ClusteredIndex-20170608-150012]
    ON [asr_api_test].[AccountNeighborhoodData]([id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_AccountNo]
    ON [asr_api_test].[AccountNeighborhoodData]([accountNo] ASC)
    INCLUDE([code], [extension]);


GO
CREATE NONCLUSTERED INDEX [idx_NeighborhoodCode]
    ON [asr_api_test].[AccountNeighborhoodData]([code] ASC);

