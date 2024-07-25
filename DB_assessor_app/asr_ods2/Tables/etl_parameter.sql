CREATE TABLE [asr_ods2].[etl_parameter] (
    [parameter_name]        VARCHAR (50)   NOT NULL,
    [parameter_value]       VARCHAR (100)  NOT NULL,
    [parameter_description] VARCHAR (1000) NULL,
    [create_datetime]       DATETIME2 (7)  NOT NULL,
    [create_user_id]        VARCHAR (60)   NOT NULL,
    [update_datetime]       DATETIME2 (7)  NULL,
    [update_user_id]        VARCHAR (60)   NULL,
    CONSTRAINT [pk_etl_parameter] PRIMARY KEY CLUSTERED ([parameter_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'ETL parameters control the behavior of the ETL processes.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'etl_parameter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The name of a parameter.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'etl_parameter', @level2type = N'COLUMN', @level2name = N'parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The value of a parameter.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'etl_parameter', @level2type = N'COLUMN', @level2name = N'parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The description that describes the intented use of a parameter.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'etl_parameter', @level2type = N'COLUMN', @level2name = N'parameter_description';

