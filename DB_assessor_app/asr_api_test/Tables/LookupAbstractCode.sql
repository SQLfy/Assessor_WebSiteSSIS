CREATE TABLE [asr_api_test].[LookupAbstractCode] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [abstractCode]     VARCHAR (30)  NOT NULL,
    [abstractCodeDesc] VARCHAR (150) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [IX_ImprovementOccupancyKVP] UNIQUE NONCLUSTERED ([abstractCode] ASC)
);

