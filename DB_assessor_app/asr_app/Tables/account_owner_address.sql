CREATE TABLE [asr_app].[account_owner_address] (
    [account_no]         VARCHAR (30)     NOT NULL,
    [person_code]        CHAR (18)        NOT NULL,
    [primary_owner_flag] BIT              NOT NULL,
    [owner_name]         VARCHAR (256)    NOT NULL,
    [owner_name_1]       VARCHAR (256)    NOT NULL,
    [owner_name_2]       VARCHAR (256)    NULL,
    [ownership_percent]  NUMERIC (9, 8)   NULL,
    [federal_id_no]      VARCHAR (30)     NULL,
    [address_line_1]     VARCHAR (80)     NULL,
    [address_line_2]     VARCHAR (80)     NULL,
    [city_name]          VARCHAR (80)     NULL,
    [state]              VARCHAR (80)     NULL,
    [zip_code]           VARCHAR (30)     NULL,
    [country]            VARCHAR (80)     NULL,
    [create_datetime]    DATETIME2 (7)    NOT NULL,
    [create_user_id]     VARCHAR (60)     NOT NULL,
    [update_datetime]    DATETIME2 (7)    NULL,
    [update_user_id]     VARCHAR (60)     NULL,
    [rowhash]            VARBINARY (8000) NULL,
    [private_flag]       BIT              NULL,
    CONSTRAINT [pk_account_owner_address] PRIMARY KEY CLUSTERED ([account_no] ASC, [person_code] ASC),
    CONSTRAINT [fk_aoa_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[account_owner_address] NOCHECK CONSTRAINT [fk_aoa_account];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Titled owners are the complete owner names on the recorded deed of the property.
--
Title is a document, usually given to a home buyer with the deed, which states that the title to the property is believed to be clear; usually prepared by an attorney or another qualified person who has examined the abstract of title for the property.

The mailing address of a property(aka titled) owner, provided by that owner to the Assessor’s Office.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique person identifierfrom the source system.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'person_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'One account could have multiple titled owners. 1 indicates a primary owner while 0 indicates non-primary owner.


', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'primary_owner_flag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the owner(s) as stated in the deed.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'owner_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The percent of ownership this owner has over the property.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'ownership_percent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Federal identification number.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'federal_id_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The line 1 of a mailing address.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'address_line_1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The line 2 of a mailing address.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'address_line_2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of mailing city.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'city_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of state or province.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'state';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Zip code', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'zip_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The country where the mailing address belongs.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'country';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'rowhash';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate whether a person is peace officer or domestic violence related and requires special attention when consuming this information. 1 indicates yes, special attention is required while 0 indicates no, no special attention is needed.
', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'account_owner_address', @level2type = N'COLUMN', @level2name = N'private_flag';

