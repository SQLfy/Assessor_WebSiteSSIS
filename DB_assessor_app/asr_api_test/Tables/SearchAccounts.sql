CREATE TABLE [asr_api_test].[SearchAccounts] (
    [id]                INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber]     VARCHAR (30) NOT NULL,
    [stateParcelNumber] VARCHAR (50) NOT NULL,
    [accountType]       VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

