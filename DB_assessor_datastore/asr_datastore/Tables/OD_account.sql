CREATE TABLE [asr_datastore].[OD_account] (
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
    [bldg_permit_auth_id]        INT              NULL,
    [qtr]                        VARCHAR (15)     NULL,
    [section]                    VARCHAR (15)     NULL,
    [township]                   VARCHAR (15)     NULL,
    [range]                      VARCHAR (15)     NULL,
    [assessment_year]            VARCHAR (4)      NOT NULL,
    CONSTRAINT [pk_OD_account] PRIMARY KEY CLUSTERED ([account_no] ASC),
    CONSTRAINT [fk_OD_a_sub_filing] FOREIGN KEY ([sub_filing_recording_no]) REFERENCES [asr_datastore].[sub_filing] ([sub_filing_recording_no]) ON DELETE CASCADE,
    CONSTRAINT [fk_OD_a_tax_district] FOREIGN KEY ([tax_district_no]) REFERENCES [asr_datastore].[tax_district] ([tax_district_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_datastore].[OD_account] NOCHECK CONSTRAINT [fk_OD_a_sub_filing];


GO
ALTER TABLE [asr_datastore].[OD_account] NOCHECK CONSTRAINT [fk_OD_a_tax_district];

