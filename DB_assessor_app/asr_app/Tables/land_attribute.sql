CREATE TABLE [asr_app].[land_attribute] (
    [account_no]           VARCHAR (30)     NOT NULL,
    [detail_id]            NUMERIC (15)     NOT NULL,
    [attribute_type]       VARCHAR (30)     NULL,
    [attribute_subtype]    VARCHAR (50)     NULL,
    [attribute_adjustment] NUMERIC (15, 6)  NULL,
    [create_datetime]      DATETIME2 (7)    NOT NULL,
    [create_user_id]       VARCHAR (60)     NOT NULL,
    [update_datetime]      DATETIME2 (7)    NULL,
    [update_user_id]       VARCHAR (60)     NULL,
    [rowhash]              VARBINARY (8000) NULL,
    CONSTRAINT [pk_land_attribute] PRIMARY KEY CLUSTERED ([account_no] ASC, [detail_id] ASC),
    CONSTRAINT [fk_lat_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[land_attribute] NOCHECK CONSTRAINT [fk_lat_account];


GO
CREATE NONCLUSTERED INDEX [idx_land_atttribute_acctno]
    ON [asr_app].[land_attribute]([attribute_type] ASC)
    INCLUDE([account_no]);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'land_attribute', @level2type = N'COLUMN', @level2name = N'account_no';

