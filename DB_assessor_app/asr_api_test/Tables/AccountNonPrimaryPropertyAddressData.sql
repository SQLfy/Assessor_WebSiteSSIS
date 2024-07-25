CREATE TABLE [asr_api_test].[AccountNonPrimaryPropertyAddressData] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [accountNo] VARCHAR (30)  NOT NULL,
    [street]    VARCHAR (315) NULL,
    [city]      VARCHAR (50)  NULL,
    [zipCode]   VARCHAR (10)  NULL,
    CONSTRAINT [PK_AccountNonPrimaryPropertyAddressData] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_AccountNonPrimaryPropertyAddressData_AccountLevelData1] FOREIGN KEY ([accountNo]) REFERENCES [asr_api_test].[AccountLevelData_Old] ([accountNumber]) NOT FOR REPLICATION
);


GO
ALTER TABLE [asr_api_test].[AccountNonPrimaryPropertyAddressData] NOCHECK CONSTRAINT [FK_AccountNonPrimaryPropertyAddressData_AccountLevelData1];


GO
CREATE NONCLUSTERED INDEX [idx_AccountNo]
    ON [asr_api_test].[AccountNonPrimaryPropertyAddressData]([accountNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_Street]
    ON [asr_api_test].[AccountNonPrimaryPropertyAddressData]([street] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_City]
    ON [asr_api_test].[AccountNonPrimaryPropertyAddressData]([city] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_ZipCode]
    ON [asr_api_test].[AccountNonPrimaryPropertyAddressData]([zipCode] ASC);

