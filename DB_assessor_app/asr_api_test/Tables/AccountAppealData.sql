CREATE TABLE [asr_api_test].[AccountAppealData] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [accountNo] VARCHAR (30)   NOT NULL,
    [appealNo]  NUMERIC (15)   NULL,
    [decision]  VARCHAR (30)   NULL,
    [reason]    VARCHAR (1000) NULL,
    [taxYear]   INT            NULL,
    CONSTRAINT [PK__ID] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_AccountAppealData_AccountLevelData] FOREIGN KEY ([accountNo]) REFERENCES [asr_api_test].[AccountLevelData_Old] ([accountNumber]) NOT FOR REPLICATION
);


GO
ALTER TABLE [asr_api_test].[AccountAppealData] NOCHECK CONSTRAINT [FK_AccountAppealData_AccountLevelData];


GO
CREATE NONCLUSTERED INDEX [idx_AccountNo]
    ON [asr_api_test].[AccountAppealData]([accountNo] ASC)
    INCLUDE([appealNo], [taxYear]);


GO
CREATE NONCLUSTERED INDEX [idx_AccountNoAppealNo]
    ON [asr_api_test].[AccountAppealData]([accountNo] ASC, [appealNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_AccountNoAppealNoTaxYear]
    ON [asr_api_test].[AccountAppealData]([accountNo] ASC, [appealNo] ASC, [taxYear] ASC);

