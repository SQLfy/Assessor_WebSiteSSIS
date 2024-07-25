CREATE TABLE [asr_staging].[rw_extract_ETL_Parameters] (
    [ID]                   INT             NULL,
    [property_name]        VARCHAR (255)   NULL,
    [property_type]        VARCHAR (255)   NULL,
    [property_description] VARCHAR (2000)  NULL,
    [parameter_format]     VARCHAR (255)   NULL,
    [parameter_value]      VARCHAR (255)   NULL,
    [text_value]           VARCHAR (255)   NULL,
    [number_value]         NUMERIC (28, 6) NULL,
    [date_value]           DATE            NULL,
    [boolean_value]        VARCHAR (15)    NULL,
    [etl_name]             VARCHAR (255)   NULL
);

