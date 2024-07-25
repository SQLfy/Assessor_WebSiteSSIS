CREATE TABLE [asr_app].[real_account] (
    [account_no]                         VARCHAR (30)     NOT NULL,
    [no_of_buildings]                    VARCHAR (10)     NOT NULL,
    [vacant_flag]                        BIT              NOT NULL,
    [improvement_only_flag]              BIT              NOT NULL,
    [tif_flag]                           BIT              NOT NULL,
    [zoning_code]                        VARCHAR (50)     NULL,
    [zoning_code_description]            VARCHAR (100)    NULL,
    [platted_flag]                       BIT              NOT NULL,
    [default_lea]                        VARCHAR (30)     NULL,
    [default_lea_description]            VARCHAR (100)    NULL,
    [create_datetime]                    DATETIME2 (7)    NOT NULL,
    [create_user_id]                     VARCHAR (60)     NOT NULL,
    [update_datetime]                    DATETIME2 (7)    NULL,
    [update_user_id]                     VARCHAR (60)     NULL,
    [rowhash]                            VARBINARY (8000) NULL,
    [total_improvement_interest_percent] NUMERIC (9, 6)   NULL,
    [total_land_interest_percent]        NUMERIC (9, 6)   NULL,
    CONSTRAINT [pk_real_account] PRIMARY KEY CLUSTERED ([account_no] ASC),
    CONSTRAINT [fk_ra_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[real_account] NOCHECK CONSTRAINT [fk_ra_account];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Physical real estate. In some states, real property is defined by statute and is synonymous with "real estate".', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Binary value indicating whether the parcel includes improvements or not, whether ythey are part of the account or not.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'vacant_flag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Binary value indicating whether the account includes an ownership in land.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'improvement_only_flag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Binary value indicating whether the parcel is included in a tax increment finance district.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'tif_flag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Abbreviated Zoning Code that applies to parcel.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'zoning_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of zoning_code.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'zoning_code_description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Binary value indicating if the parcel has been platted.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'platted_flag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Land Economic Area for the parcel.  Used for grouping similar lots in similar locations for mass appraisal purposes.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'default_lea';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of lea.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'real_account', @level2type = N'COLUMN', @level2name = N'default_lea_description';

