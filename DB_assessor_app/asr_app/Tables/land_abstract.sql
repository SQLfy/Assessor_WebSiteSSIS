CREATE TABLE [asr_app].[land_abstract] (
    [account_no]                VARCHAR (30)     NOT NULL,
    [abstract_code]             VARCHAR (50)     NOT NULL,
    [land_abstract_detail_id]   NUMERIC (15)     NOT NULL,
    [land_type]                 VARCHAR (50)     NULL,
    [land_acres]                NUMERIC (20, 6)  NULL,
    [land_sf]                   NUMERIC (20, 6)  NULL,
    [land_unit_count]           NUMERIC (20, 6)  NULL,
    [land_value_per]            NUMERIC (15, 2)  NOT NULL,
    [land_value]                NUMERIC (15, 2)  NULL,
    [land_override_flag]        BIT              NOT NULL,
    [land_override_total]       NUMERIC (15, 2)  NULL,
    [land_actual_value]         NUMERIC (15, 2)  NULL,
    [land_class]                VARCHAR (10)     NULL,
    [land_subclass]             VARCHAR (10)     NULL,
    [land_valued_by]            VARCHAR (50)     NULL,
    [land_value_measure]        VARCHAR (50)     NULL,
    [create_datetime]           DATETIME2 (7)    NOT NULL,
    [create_user_id]            VARCHAR (60)     NOT NULL,
    [update_datetime]           DATETIME2 (7)    NULL,
    [update_user_id]            VARCHAR (60)     NULL,
    [rowhash]                   VARBINARY (8000) NULL,
    [abstract_code_description] VARCHAR (100)    NULL,
    CONSTRAINT [pk_land_abstract] PRIMARY KEY CLUSTERED ([account_no] ASC, [abstract_code] ASC, [land_abstract_detail_id] ASC),
    CONSTRAINT [fk_la_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[land_abstract] NOCHECK CONSTRAINT [fk_la_account];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'land_abstract', @level2type = N'COLUMN', @level2name = N'account_no';

