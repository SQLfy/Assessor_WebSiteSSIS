CREATE TABLE [asr_spatialest].[sale_inventory] (
    [recording_no]                          VARCHAR (30)     NOT NULL,
    [account_no]                            VARCHAR (30)     NOT NULL,
    [property_type]                         VARCHAR (15)     NULL,
    [improvement_quality]                   VARCHAR (15)     NULL,
    [built_as_description]                  VARCHAR (50)     NULL,
    [improvement_abstract_code_description] VARCHAR (500)    NULL,
    [built_as_year_built]                   NUMERIC (4)      NULL,
    [built_as_total_unit_count]             NUMERIC (15)     NULL,
    [bath_count]                            NUMERIC (7, 2)   NULL,
    [bedroom_count]                         NUMERIC (7, 2)   NULL,
    [total_finished_square_footage]         NUMERIC (15, 2)  NULL,
    [land_net_acre_count]                   NUMERIC (20, 6)  NULL,
    [create_datetime]                       DATETIME2 (7)    NOT NULL,
    [create_user_id]                        VARCHAR (60)     NOT NULL,
    [update_datetime]                       DATETIME2 (7)    NULL,
    [update_user_id]                        VARCHAR (60)     NULL,
    [rowhash]                               VARBINARY (8000) NULL,
    CONSTRAINT [pk_sale_inventory] PRIMARY KEY CLUSTERED ([recording_no] ASC, [account_no] ASC),
    CONSTRAINT [fk_si_sale] FOREIGN KEY ([recording_no]) REFERENCES [asr_spatialest].[sale] ([recording_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_spatialest].[sale_inventory] NOCHECK CONSTRAINT [fk_si_sale];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General description of how the building is designed and used.  Examples include:  Residential, Commercial, Mobile Home, Industrial, etc…', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'property_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The quality rating of the building as assigned by appraisal staff.  Examples include:  Low, Fair, Average, Good, Very Good and Excellent.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'improvement_quality';

