CREATE TABLE [asr_staging].[PRRW_ETL_Parameters_OLD] (
    [ID]                   INT             NULL,
    [property_name]        VARCHAR (220)   NULL,
    [property_type]        VARCHAR (220)   NULL,
    [property_description] VARCHAR (2000)  NULL,
    [parameter_format]     VARCHAR (220)   NULL,
    [parameter_value]      VARCHAR (220)   NULL,
    [text_value]           VARCHAR (220)   NULL,
    [number_value]         NUMERIC (28, 6) NULL,
    [date_value]           DATE            NULL,
    [boolean_value]        VARCHAR (15)    NULL,
    [etl_name]             VARCHAR (220)   NULL
);

