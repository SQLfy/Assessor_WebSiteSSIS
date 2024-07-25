CREATE TABLE [asr_api_test].[LookupTypeCode] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [typeCode]    VARCHAR (30) NOT NULL,
    [subTypeCode] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

