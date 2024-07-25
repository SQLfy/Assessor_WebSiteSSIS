CREATE TABLE [asr_staging].[azure_etl_parameter_OLD] (
    [ID]                   INT             NOT NULL,
    [PROPERTY_NAME]        NVARCHAR (220)  NULL,
    [PROPERTY_TYPE]        NVARCHAR (220)  NULL,
    [TEXT_VALUE]           NVARCHAR (220)  NULL,
    [NUMBER_VALUE]         DECIMAL (28, 6) NULL,
    [DATE_VALUE]           DATE            NULL,
    [BOOLEAN_VALUE]        BIT             NULL,
    [PROPERTY_DESCRIPTION] NVARCHAR (2000) NULL,
    [ETL_NAME]             NVARCHAR (220)  NOT NULL,
    CONSTRAINT [pk_azure_etl_parameter] PRIMARY KEY CLUSTERED ([ID] ASC)
);

