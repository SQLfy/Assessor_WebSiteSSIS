CREATE TABLE [asr_api_test].[LookupSPN] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [spn]            VARCHAR (30) NOT NULL,
    [township_range] VARCHAR (30) NOT NULL,
    [section]        VARCHAR (30) NOT NULL,
    [quarter]        VARCHAR (30) NOT NULL,
    [lot_block]      VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

