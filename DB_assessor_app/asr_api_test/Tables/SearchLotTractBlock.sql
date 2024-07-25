CREATE TABLE [asr_api_test].[SearchLotTractBlock] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [lotNo]         VARCHAR (30) NOT NULL,
    [tractNo]       VARCHAR (30) NOT NULL,
    [blockNo]       VARCHAR (30) NOT NULL,
    [accountNumber] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

