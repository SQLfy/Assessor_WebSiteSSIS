CREATE TABLE [asr_ods2].[account] (
    [account_no]                 VARCHAR (30)     NOT NULL,
    [state_parcel_no]            VARCHAR (30)     NULL,
    [tax_district_no]            VARCHAR (30)     NOT NULL,
    [sub_filing_recording_no]    VARCHAR (30)     NULL,
    [account_type]               VARCHAR (30)     NOT NULL,
    [appraisal_type]             VARCHAR (30)     NOT NULL,
    [account_status]             VARCHAR (30)     NOT NULL,
    [account_status_description] VARCHAR (100)    NULL,
    [legal_description]          VARCHAR (MAX)    NULL,
    [longitude_x]                NUMERIC (30, 8)  NULL,
    [latitude_y]                 NUMERIC (30, 8)  NULL,
    [location]                   VARCHAR (50)     NULL,
    [create_datetime]            DATETIME2 (7)    NOT NULL,
    [create_user_id]             VARCHAR (60)     NOT NULL,
    [update_datetime]            DATETIME2 (7)    NULL,
    [update_user_id]             VARCHAR (60)     NULL,
    [rowhash]                    VARBINARY (8000) NULL,
    [elevation_z]                NUMERIC (30, 8)  NULL,
    [qtr]                        VARCHAR (15)     NULL,
    [section]                    VARCHAR (15)     NULL,
    [township]                   VARCHAR (15)     NULL,
    [range]                      VARCHAR (15)     NULL,
    CONSTRAINT [pk_account] PRIMARY KEY CLUSTERED ([account_no] ASC),
    CONSTRAINT [fk_a_sub_filing] FOREIGN KEY ([sub_filing_recording_no]) REFERENCES [asr_ods2].[sub_filing] ([sub_filing_recording_no]) ON DELETE CASCADE,
    CONSTRAINT [fk_a_tax_district] FOREIGN KEY ([tax_district_no]) REFERENCES [asr_ods2].[tax_district] ([tax_district_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_ods2].[account] NOCHECK CONSTRAINT [fk_a_sub_filing];


GO
ALTER TABLE [asr_ods2].[account] NOCHECK CONSTRAINT [fk_a_tax_district];


GO
CREATE NONCLUSTERED INDEX [fk_a_sub_filing]
    ON [asr_ods2].[account]([sub_filing_recording_no] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_a_tax_district]
    ON [asr_ods2].[account]([tax_district_no] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Account is a vehicle used to manage ownership of properties.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A twelve digit number assigned in accordance with a geographic location, consisting of numbers assigned to township, section, quarter­section, block and lot.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'state_parcel_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'tax_district_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The recording no that is assigned to the recorded subdivision plat for the filing. 

Recording number(aka reception number) is a number that is assigned by the Clerk and Recorder to a document at the time it is recorded. The Recording Number has replaced the Book and Page numbering system for recorded documents in Douglas County.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'sub_filing_recording_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Account type is grouping used by the Assessor’s Office to help classify a property by its use.  Examples are:
State Assessed
Residential
Commercial
HOA and so on.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'account_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Appraisal type indicates the type of appraisal for an account. Examples are:
Real
Personal
State Assessed
OilGase', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'appraisal_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The status of an account. Examples are A, I, and D.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'account_status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The description of account  status. For example,  Active for A, Inactive for I, and Deleted for D.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'account_status_description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A description of land that identifies the real estate according to a system established or approved by law; an exact description that enables the real estate to be located and identified.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'legal_description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Latitude is the Y axis, longitude is the X axis', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'longitude_x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Latitude is the Y axis, longitude is the X axis.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'latitude_y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The (y, x) value pair of a location.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'location';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account', @level2type = N'COLUMN', @level2name = N'rowhash';

