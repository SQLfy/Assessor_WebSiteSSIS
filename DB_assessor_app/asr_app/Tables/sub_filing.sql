CREATE TABLE [asr_app].[sub_filing] (
    [sub_filing_recording_no]   VARCHAR (30)     NOT NULL,
    [subdivision_no]            VARCHAR (30)     NOT NULL,
    [subdivision_name]          VARCHAR (256)    NULL,
    [filing_no]                 VARCHAR (30)     NOT NULL,
    [filing_description]        VARCHAR (80)     NULL,
    [dedicated_sub_filing_name] VARCHAR (256)    NULL,
    [create_datetime]           DATETIME2 (7)    NOT NULL,
    [create_user_id]            VARCHAR (60)     NOT NULL,
    [update_datetime]           DATETIME2 (7)    NULL,
    [update_user_id]            VARCHAR (60)     NULL,
    [rowhash]                   VARBINARY (8000) NULL,
    CONSTRAINT [pk_sub_filing] PRIMARY KEY CLUSTERED ([sub_filing_recording_no] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A subdivision filing is a group of parcels that exist as a sub-set of a larger subdivision.

Subdivisions may be one phase/filing, or many, such as is the case with Highlands Ranch. In subdivisions that have filings, the developer has decided to create the lots in phases, or groups, instead of creating all the lots at one time. This may be due to many reasons including the acreage involved, the infrastructure needed such as roads, available funding, etc.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The recording no that is assigned to the recorded subdivision plat for the filing. 

Recording number(aka reception number) is a number that is assigned by the Clerk and Recorder to a document at the time it is recorded. The Recording Number has replaced the Book and Page numbering system for recorded documents in Douglas County.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing', @level2type = N'COLUMN', @level2name = N'sub_filing_recording_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The five digits number assigned by Assessor'' s office to each subdivision. There will be a subdivision record created for metes and bounds parcels. For example, subdivision no 05040 is HIGHLANDS RANCH.

Subdivisions are pieces of land which are split through a specific process in order to create individiual lots that are smaller than 35-acres in size.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing', @level2type = N'COLUMN', @level2name = N'subdivision_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the platted subdivision name. For example 05040 is HIGHLANDS RANCH', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing', @level2type = N'COLUMN', @level2name = N'subdivision_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When a subdivision is developed in phases, each phase will be assigned a filing no.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing', @level2type = N'COLUMN', @level2name = N'filing_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An amendment is a change to the subdivision and/or filing. For example, there are originally 8 lots and the developer now wants 6 instead. He would do an amendment to replat the lots into 6 from the original 8.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing', @level2type = N'COLUMN', @level2name = N'filing_description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A name of the subdivison filing that is different from the platted name.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing', @level2type = N'COLUMN', @level2name = N'dedicated_sub_filing_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sub_filing', @level2type = N'COLUMN', @level2name = N'rowhash';

