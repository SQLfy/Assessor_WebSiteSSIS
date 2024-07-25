CREATE TABLE [asr_api_test].[SearchAbstractCode] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber] VARCHAR (30) NOT NULL,
    [abstract_code] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

