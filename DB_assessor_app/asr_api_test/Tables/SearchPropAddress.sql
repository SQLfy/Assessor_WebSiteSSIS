CREATE TABLE [asr_api_test].[SearchPropAddress] (
    [id]                INT          IDENTITY (1, 1) NOT NULL,
    [city_name]         VARCHAR (50) NULL,
    [location_zip_code] VARCHAR (10) NULL,
    [street_name]       VARCHAR (80) NULL,
    [accountNumber]     VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

