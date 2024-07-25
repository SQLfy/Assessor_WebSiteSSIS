CREATE TABLE [asr_api_test].[LookupSubdivision] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [subdivisionNo]   VARCHAR (30)  NOT NULL,
    [subdivisionName] VARCHAR (256) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_SubDivisionNo]
    ON [asr_api_test].[LookupSubdivision]([subdivisionNo] ASC);

