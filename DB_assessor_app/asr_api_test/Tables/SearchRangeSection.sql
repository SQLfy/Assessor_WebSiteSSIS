CREATE TABLE [asr_api_test].[SearchRangeSection] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber] VARCHAR (30) NOT NULL,
    [range]         VARCHAR (15) NOT NULL,
    [section]       VARCHAR (15) NOT NULL,
    [township]      VARCHAR (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

