CREATE TABLE [asr_api_test].[LookupAccountType] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [accountType] VARCHAR (1000) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_AccountType]
    ON [asr_api_test].[LookupAccountType]([accountType] ASC);

