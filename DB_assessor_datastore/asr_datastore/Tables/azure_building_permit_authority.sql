CREATE TABLE [asr_datastore].[azure_building_permit_authority] (
    [bldg_permit_auth_id]         INT            NOT NULL,
    [authority_name]              NVARCHAR (100) NULL,
    [phone]                       NVARCHAR (30)  NULL,
    [street]                      NVARCHAR (220) NULL,
    [city]                        NVARCHAR (100) NULL,
    [zip]                         NVARCHAR (20)  NULL,
    [associated_tax_authority_no] NVARCHAR (30)  NOT NULL,
    [email]                       NVARCHAR (220) NULL,
    [URL]                         NVARCHAR (220) NULL,
    [create_datetime]             DATETIME2 (7)  CONSTRAINT [DF_permit_authority_CREATE_DTM] DEFAULT (getdate()) NOT NULL,
    [create_user_id]              VARCHAR (60)   CONSTRAINT [DF_permit_authority_CREATE_USER_ID] DEFAULT (suser_name()) NOT NULL,
    [update_datetime]             DATETIME2 (7)  NULL,
    [update_user_id]              VARCHAR (60)   NULL,
    CONSTRAINT [PK_building_permit_authority] PRIMARY KEY CLUSTERED ([bldg_permit_auth_id] ASC)
);

