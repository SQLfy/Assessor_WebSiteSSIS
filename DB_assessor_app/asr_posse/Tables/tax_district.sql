CREATE TABLE [asr_posse].[tax_district] (
    [tax_district_no]   VARCHAR (30)  NOT NULL,
    [tax_district_name] VARCHAR (256) NULL,
    [create_datetime]   VARCHAR (20)  NOT NULL,
    [create_user_id]    VARCHAR (30)  NOT NULL,
    [update_datetime]   VARCHAR (20)  NULL,
    [update_user_id]    VARCHAR (30)  NULL,
    CONSTRAINT [pk_tax_district] PRIMARY KEY CLUSTERED ([tax_district_no] ASC)
);

