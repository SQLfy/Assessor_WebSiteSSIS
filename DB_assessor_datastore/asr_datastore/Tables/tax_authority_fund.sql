CREATE TABLE [asr_datastore].[tax_authority_fund] (
    [tax_authority_no]     VARCHAR (30)     NOT NULL,
    [tax_fund_code]        VARCHAR (20)     NOT NULL,
    [levy_type_id]         NUMERIC (4)      NOT NULL,
    [levy_type]            VARCHAR (50)     NOT NULL,
    [assessed_mill_levy]   NUMERIC (11, 6)  NULL,
    [tax_fund_description] VARCHAR (100)    NULL,
    [create_datetime]      DATETIME2 (7)    NOT NULL,
    [create_user_id]       VARCHAR (60)     NOT NULL,
    [update_datetime]      DATETIME2 (7)    NULL,
    [update_user_id]       VARCHAR (60)     NULL,
    [rowhash]              VARBINARY (8000) NULL,
    CONSTRAINT [pk_tax_authority_fund] PRIMARY KEY CLUSTERED ([tax_authority_no] ASC, [tax_fund_code] ASC, [levy_type_id] ASC),
    CONSTRAINT [fk_taf_tax_authority] FOREIGN KEY ([tax_authority_no]) REFERENCES [asr_datastore].[tax_authority] ([tax_authority_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_datastore].[tax_authority_fund] NOCHECK CONSTRAINT [fk_taf_tax_authority];


GO
CREATE NONCLUSTERED INDEX [fk_taf_tax_authority]
    ON [asr_datastore].[tax_authority_fund]([tax_authority_no] ASC);

