CREATE TABLE [asr_posse].[tax_district_authority] (
    [tax_district_no]  VARCHAR (30) NOT NULL,
    [tax_authority_no] VARCHAR (30) NOT NULL,
    [create_datetime]  VARCHAR (20) NOT NULL,
    [create_user_id]   VARCHAR (60) NOT NULL,
    [update_datetime]  VARCHAR (20) NULL,
    [update_user_id]   VARCHAR (60) NULL,
    CONSTRAINT [pk_tax_district_authority] PRIMARY KEY CLUSTERED ([tax_district_no] ASC, [tax_authority_no] ASC),
    CONSTRAINT [fk_tda_tax_authority] FOREIGN KEY ([tax_authority_no]) REFERENCES [asr_posse].[tax_authority] ([tax_authority_no]) ON DELETE CASCADE,
    CONSTRAINT [fk_tda_tax_district] FOREIGN KEY ([tax_district_no]) REFERENCES [asr_posse].[tax_district] ([tax_district_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_posse].[tax_district_authority] NOCHECK CONSTRAINT [fk_tda_tax_authority];


GO
ALTER TABLE [asr_posse].[tax_district_authority] NOCHECK CONSTRAINT [fk_tda_tax_district];

