CREATE TABLE [asr_api_test].[AccountValueByAbstractCodeData] (
    [id]                      INT             IDENTITY (1, 1) NOT NULL,
    [accountNo]               VARCHAR (30)    NOT NULL,
    [taxYear]                 NUMERIC (4)     NULL,
    [abstractCode]            VARCHAR (50)    NULL,
    [abstractCodeDescription] VARCHAR (100)   NULL,
    [netAcres]                NUMERIC (15, 4) NULL,
    [actualValue]             NUMERIC (15, 2) NULL,
    [assessedValue]           NUMERIC (15, 2) NULL,
    [millLevy]                NUMERIC (11, 6) NULL,
    [taxDollars]              NUMERIC (15, 2) NULL,
    CONSTRAINT [FK_AccountValueByAbstractCodeData_AccountLevelData] FOREIGN KEY ([accountNo]) REFERENCES [asr_api_test].[AccountLevelData_Old] ([accountNumber]) NOT FOR REPLICATION
);


GO
ALTER TABLE [asr_api_test].[AccountValueByAbstractCodeData] NOCHECK CONSTRAINT [FK_AccountValueByAbstractCodeData_AccountLevelData];


GO
CREATE CLUSTERED INDEX [ClusteredIndex-20170608-150156]
    ON [asr_api_test].[AccountValueByAbstractCodeData]([id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_AccountNoTaxYearAbstractCodeAbstractCodeDescriptionActualValueAssessedValue]
    ON [asr_api_test].[AccountValueByAbstractCodeData]([accountNo] ASC, [taxYear] ASC, [abstractCode] ASC, [abstractCodeDescription] ASC, [actualValue] ASC, [assessedValue] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_ActualValue]
    ON [asr_api_test].[AccountValueByAbstractCodeData]([actualValue] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_AssessedValue]
    ON [asr_api_test].[AccountValueByAbstractCodeData]([assessedValue] ASC);

