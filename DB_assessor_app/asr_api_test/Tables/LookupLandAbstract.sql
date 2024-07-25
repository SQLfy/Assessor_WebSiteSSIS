CREATE TABLE [asr_api_test].[LookupLandAbstract] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [abstractCode]     VARCHAR (50)  NOT NULL,
    [abstractCodeDesc] VARCHAR (150) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

