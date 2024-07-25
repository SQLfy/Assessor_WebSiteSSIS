CREATE TABLE [asr_api_test].[SearchQuality] (
    [id]                  INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber]       VARCHAR (30) NOT NULL,
    [improvement_quality] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

