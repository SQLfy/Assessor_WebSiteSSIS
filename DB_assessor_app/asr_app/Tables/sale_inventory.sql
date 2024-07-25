CREATE TABLE [asr_app].[sale_inventory] (
    [recording_no]                          VARCHAR (30)     NOT NULL,
    [account_no]                            VARCHAR (30)     NOT NULL,
    [inventory_effective_date]              DATETIME2 (7)    NULL,
    [adjusted_sale_price]                   NUMERIC (15, 2)  NULL,
    [time_adjusted_sale_price]              NUMERIC (15, 2)  NULL,
    [account_type]                          VARCHAR (15)     NULL,
    [land_economic_area]                    VARCHAR (30)     NULL,
    [land_economic_area_description]        VARCHAR (50)     NULL,
    [property_type]                         VARCHAR (15)     NULL,
    [improvement_condition_type]            VARCHAR (40)     NULL,
    [improvement_quality]                   VARCHAR (15)     NULL,
    [improvement_abstract_code]             VARCHAR (10)     NULL,
    [improvement_abstract_code_description] VARCHAR (500)    NULL,
    [built_as_description]                  VARCHAR (50)     NULL,
    [built_as_year_built]                   NUMERIC (4)      NULL,
    [physical_age]                          NUMERIC (4)      NULL,
    [adjusted_year_built]                   NUMERIC (4)      NULL,
    [effective_age]                         NUMERIC (5)      NULL,
    [improvement_exterior]                  VARCHAR (50)     NULL,
    [class_code]                            VARCHAR (10)     NULL,
    [class_code_description]                VARCHAR (40)     NULL,
    [improvement_count]                     NUMERIC (15)     NULL,
    [built_as_total_unit_count]             NUMERIC (15)     NULL,
    [room_count]                            NUMERIC (7)      NULL,
    [bedroom_count]                         NUMERIC (7, 2)   NULL,
    [bath_count]                            NUMERIC (7, 2)   NULL,
    [total_improvement_square_footage]      NUMERIC (15, 2)  NULL,
    [residential_square_footage]            NUMERIC (15, 2)  NULL,
    [commercial_square_footage]             NUMERIC (15, 2)  NULL,
    [outbuilding_square_footage]            NUMERIC (15, 2)  NULL,
    [improvement_built_as_other]            NUMERIC (15)     NULL,
    [land_net_square_footage]               NUMERIC (20, 6)  NULL,
    [multiple_use_flag]                     NUMERIC (1)      NULL,
    [land_type]                             VARCHAR (15)     NULL,
    [land_abstract_code]                    VARCHAR (10)     NULL,
    [land_abstract_code_description]        VARCHAR (500)    NULL,
    [zoning_code]                           VARCHAR (50)     NULL,
    [zoning_code_description]               VARCHAR (40)     NULL,
    [platted_flag]                          BIT              NULL,
    [land_net_acre_count]                   NUMERIC (20, 6)  NULL,
    [hvac_type]                             VARCHAR (30)     NULL,
    [improvement_unit_type]                 VARCHAR (30)     NULL,
    [improvement_interior]                  VARCHAR (30)     NULL,
    [roof_cover]                            VARCHAR (30)     NULL,
    [roof_type]                             VARCHAR (30)     NULL,
    [neighborhood_code_1]                   VARCHAR (10)     NULL,
    [neighborhood_code_2]                   VARCHAR (10)     NULL,
    [neighborhood_extension_1]              VARCHAR (10)     NULL,
    [neighborhood_extension_2]              VARCHAR (10)     NULL,
    [outbuilding_count]                     NUMERIC (15, 2)  NULL,
    [floor_cover]                           VARCHAR (30)     NULL,
    [occupancy_code_description_1]          VARCHAR (50)     NULL,
    [occupancy_code_description_2]          VARCHAR (50)     NULL,
    [total_finished_square_footage]         NUMERIC (15, 2)  NULL,
    [total_unfinished_square_footage]       NUMERIC (15, 2)  NULL,
    [create_datetime]                       DATETIME2 (7)    NOT NULL,
    [create_user_id]                        VARCHAR (60)     NOT NULL,
    [update_datetime]                       DATETIME2 (7)    NULL,
    [update_user_id]                        VARCHAR (60)     NULL,
    [rowhash]                               VARBINARY (8000) NULL,
    CONSTRAINT [pk_sale_inventory] PRIMARY KEY CLUSTERED ([recording_no] ASC, [account_no] ASC),
    CONSTRAINT [fk_si_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[sale_inventory] NOCHECK CONSTRAINT [fk_si_account];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account type is grouping used by the Assessor’s Office to help classify a property by its use.  Examples are:
State Assessed
Residential
Commercial
HOA and so on.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'account_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General description of how the building is designed and used.  Examples include:  Residential, Commercial, Mobile Home, Industrial, etc…', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'property_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Condition rating of the improvement, as of the assessment date.  Examples include:  Low, Fair, Average, Good, Very Good and Excellent.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'improvement_condition_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The quality rating of the building as assigned by appraisal staff.  Examples include:  Low, Fair, Average, Good, Very Good and Excellent.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'improvement_quality';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total square footage of the building, including all Built As groups, excluding basements and mezzanines.  Othewise know as GLA or GBA.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sale_inventory', @level2type = N'COLUMN', @level2name = N'total_improvement_square_footage';

