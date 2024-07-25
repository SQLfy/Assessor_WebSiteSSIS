CREATE TABLE [asr_app].[tax_district_authority] (
    [tax_district_no]  VARCHAR (30)  NOT NULL,
    [tax_authority_no] VARCHAR (30)  NOT NULL,
    [create_datetime]  DATETIME2 (7) NOT NULL,
    [create_user_id]   VARCHAR (60)  NOT NULL,
    [update_datetime]  DATETIME2 (7) NULL,
    [update_user_id]   VARCHAR (60)  NULL,
    CONSTRAINT [pk_tax_district_authority] PRIMARY KEY CLUSTERED ([tax_district_no] ASC, [tax_authority_no] ASC),
    CONSTRAINT [fk_tda_tax_authority] FOREIGN KEY ([tax_authority_no]) REFERENCES [asr_app].[tax_authority] ([tax_authority_no]) ON DELETE CASCADE,
    CONSTRAINT [fk_tda_tax_district] FOREIGN KEY ([tax_district_no]) REFERENCES [asr_app].[tax_district] ([tax_district_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[tax_district_authority] NOCHECK CONSTRAINT [fk_tda_tax_authority];


GO
ALTER TABLE [asr_app].[tax_district_authority] NOCHECK CONSTRAINT [fk_tda_tax_district];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to store tax authorities that make up tax districts for the target tax year.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'tax_district_authority';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'tax_district_authority', @level2type = N'COLUMN', @level2name = N'tax_district_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A four digits number that identifies a taxing authority.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'tax_district_authority', @level2type = N'COLUMN', @level2name = N'tax_authority_no';

