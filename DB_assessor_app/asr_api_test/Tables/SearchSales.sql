CREATE TABLE [asr_api_test].[SearchSales] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [accountNumber] VARCHAR (30)  NOT NULL,
    [salePrice]     NUMERIC (15)  NOT NULL,
    [saleDate]      DATETIME2 (7) NOT NULL,
    [recording_no]  VARCHAR (20)  NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

