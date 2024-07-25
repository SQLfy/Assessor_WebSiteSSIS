CREATE TABLE [asr_api_test].[SearchAddress] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber] VARCHAR (30) NOT NULL,
    [street]        VARCHAR (80) NOT NULL,
    [city]          VARCHAR (80) NOT NULL,
    [zipCode]       VARCHAR (5)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

