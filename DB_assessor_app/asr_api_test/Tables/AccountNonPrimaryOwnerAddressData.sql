CREATE TABLE [asr_api_test].[AccountNonPrimaryOwnerAddressData] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [accountNo] VARCHAR (30)  NOT NULL,
    [isPrivate] BIT           NULL,
    [name]      VARCHAR (256) NULL,
    [street]    VARCHAR (80)  NULL,
    [street2]   VARCHAR (80)  NULL,
    [city]      VARCHAR (80)  NULL,
    [state]     VARCHAR (80)  NULL,
    [zipCode]   VARCHAR (30)  NULL,
    CONSTRAINT [PK_AccountNonPrimaryOwnerAddressData] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_AccountNonPrimaryOwnerAddressData_AccountLevelData] FOREIGN KEY ([accountNo]) REFERENCES [asr_api_test].[AccountLevelData_Old] ([accountNumber]) NOT FOR REPLICATION
);


GO
ALTER TABLE [asr_api_test].[AccountNonPrimaryOwnerAddressData] NOCHECK CONSTRAINT [FK_AccountNonPrimaryOwnerAddressData_AccountLevelData];


GO
CREATE NONCLUSTERED INDEX [idx_AccountNo]
    ON [asr_api_test].[AccountNonPrimaryOwnerAddressData]([accountNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_Name]
    ON [asr_api_test].[AccountNonPrimaryOwnerAddressData]([name] ASC);

