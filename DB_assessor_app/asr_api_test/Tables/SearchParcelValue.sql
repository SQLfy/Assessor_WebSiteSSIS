CREATE TABLE [asr_api_test].[SearchParcelValue] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber] VARCHAR (30) NOT NULL,
    [actual_value]  NUMERIC (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

