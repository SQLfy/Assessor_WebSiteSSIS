CREATE TABLE [asr_datastore].[etl_parameter] (
    [parameter_name]        VARCHAR (50)   NOT NULL,
    [parameter_value]       VARCHAR (100)  NOT NULL,
    [parameter_description] VARCHAR (1000) NULL,
    [create_datetime]       DATETIME2 (7)  NOT NULL,
    [create_user_id]        VARCHAR (60)   NOT NULL,
    [update_datetime]       DATETIME2 (7)  NULL,
    [update_user_id]        VARCHAR (60)   NULL,
    CONSTRAINT [pk_etl_parameter] PRIMARY KEY CLUSTERED ([parameter_name] ASC)
);

