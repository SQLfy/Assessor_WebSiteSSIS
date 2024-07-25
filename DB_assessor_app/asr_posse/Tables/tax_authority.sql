CREATE TABLE [asr_posse].[tax_authority] (
    [tax_authority_no]       VARCHAR (30)     NOT NULL,
    [tax_authority_name]     VARCHAR (256)    NULL,
    [authority_type]         VARCHAR (100)    NULL,
    [create_datetime]        VARCHAR (20)     NOT NULL,
    [create_user_id]         VARCHAR (60)     NOT NULL,
    [update_datetime]        VARCHAR (20)     NULL,
    [update_user_id]         VARCHAR (60)     NULL,
    [contact_person]         VARCHAR (60)     NULL,
    [contact_address_line_1] VARCHAR (80)     NULL,
    [contact_address_line_2] VARCHAR (80)     NULL,
    [contact_city_name]      VARCHAR (50)     NULL,
    [contact_state]          VARCHAR (80)     NULL,
    [contact_zip_code]       VARCHAR (10)     NULL,
    [active_flag]            INT              NULL,
    [rowhash]                VARBINARY (8000) NULL,
    [contact_phone]          VARCHAR (18)     NULL,
    CONSTRAINT [pk_tax_authority] PRIMARY KEY CLUSTERED ([tax_authority_no] ASC)
);

