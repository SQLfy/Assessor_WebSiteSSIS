CREATE TABLE [asr_ods2].[tax_district_authority] (
    [tax_district_no]  VARCHAR (30)  NOT NULL,
    [tax_authority_no] VARCHAR (30)  NOT NULL,
    [create_datetime]  DATETIME2 (7) NOT NULL,
    [create_user_id]   VARCHAR (60)  NOT NULL,
    [update_datetime]  DATETIME2 (7) NULL,
    [update_user_id]   VARCHAR (60)  NULL,
    CONSTRAINT [pk_tax_district_authority] PRIMARY KEY CLUSTERED ([tax_district_no] ASC, [tax_authority_no] ASC)
);

