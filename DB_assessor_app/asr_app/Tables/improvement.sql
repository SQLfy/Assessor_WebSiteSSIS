CREATE TABLE [asr_app].[improvement] (
    [account_no]            VARCHAR (30)     NOT NULL,
    [improvement_no]        NUMERIC (5)      NOT NULL,
    [completed_percent]     NUMERIC (7, 4)   NULL,
    [improvement_quality]   VARCHAR (50)     NULL,
    [improvement_perimeter] NUMERIC (15)     NULL,
    [improvement_sf]        NUMERIC (15)     NULL,
    [improvement_net_sf]    NUMERIC (15)     NULL,
    [property_type]         VARCHAR (50)     NULL,
    [condition_type]        VARCHAR (50)     NULL,
    [approach_type]         VARCHAR (50)     NULL,
    [create_datetime]       DATETIME2 (7)    NOT NULL,
    [create_user_id]        VARCHAR (60)     NOT NULL,
    [update_datetime]       DATETIME2 (7)    NULL,
    [update_user_id]        VARCHAR (60)     NULL,
    [rowhash]               VARBINARY (8000) NULL,
    [primary_flag]          BIT              NULL,
    [improvement_unit_type] VARCHAR (30)     NULL,
    CONSTRAINT [pk_improvement] PRIMARY KEY CLUSTERED ([account_no] ASC, [improvement_no] ASC),
    CONSTRAINT [fk_imp_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[improvement] NOCHECK CONSTRAINT [fk_imp_account];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Anything done to raw land with the intention of increasing its value is an improvement. Improvements are physical structures built or placed on lands. Common examples are residential buildings, outbuildings and mobile homesThere is one record in this table per building, never less or more.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for each improvement on a given account.  Once assigned to a building, this does not change.  Acts a key field for joining other improvement tables.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'improvement_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the percent complete of the building as of the assessment date of the given year.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'completed_percent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The quality rating of the building as assigned by appraisal staff.  Examples include:  Low, Fair, Average, Good, Very Good and Excellent.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'improvement_quality';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The linear measurement of the footprint of the building.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'improvement_perimeter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total square footage of the building, including all Built As groups, excluding basements and mezzanines.  Othewise know as GLA or GBA.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'improvement_sf';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total leaseable size of the builiding in square foot.  Should be less than impsf.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'improvement_net_sf';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General description of how the building is designed and used.  Examples include:  Residential, Commercial, Mobile Home, Industrial, etc…', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'property_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Condition rating of the improvement, as of the assessment date.  Examples include:  Low, Fair, Average, Good, Very Good and Excellent.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'condition_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of general valuation methodology being used for the building.  Examples include:  Cost, Market, Income, etc…', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'improvement', @level2type = N'COLUMN', @level2name = N'approach_type';

