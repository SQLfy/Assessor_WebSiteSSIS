CREATE TABLE [asr_api_test].[LookupQuality] (
    [id]      INT          IDENTITY (1, 1) NOT NULL,
    [quality] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_Quality]
    ON [asr_api_test].[LookupQuality]([quality] ASC);

