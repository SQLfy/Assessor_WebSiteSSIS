CREATE TABLE [asr_api_test].[SearchLand] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber] VARCHAR (30) NOT NULL,
    [acres]         NUMERIC (13) NOT NULL,
    [landType]      VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

