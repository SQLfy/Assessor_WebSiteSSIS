CREATE TABLE [asr_api_test].[SearchTaxInfo] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [accountNumber]    VARCHAR (30)  NOT NULL,
    [taxAuthorityNo]   VARCHAR (30)  NOT NULL,
    [taxAuthorityName] VARCHAR (256) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

