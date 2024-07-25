CREATE TABLE [asr_api_test].[SearchImprovement] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [accountNumber]  VARCHAR (30) NOT NULL,
    [improvement_sf] INT          NOT NULL,
    [property_type]  VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

