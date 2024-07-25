CREATE TABLE [asr_staging].[azure_building_permit_authority] (
    [bldg_permit_auth_id]         INT            IDENTITY (1, 1) NOT NULL,
    [authority_name]              NVARCHAR (255) NULL,
    [phone]                       NVARCHAR (255) NULL,
    [street]                      NVARCHAR (255) NULL,
    [city]                        NVARCHAR (255) NULL,
    [zip]                         NVARCHAR (255) NULL,
    [associated_tax_authority_no] NVARCHAR (255) NOT NULL,
    [email]                       NVARCHAR (255) NULL,
    [URL]                         NVARCHAR (255) NULL,
    [create_datetime]             DATETIME2 (7)  CONSTRAINT [DF_permit_authority_CREATE_DTM] DEFAULT (getdate()) NOT NULL,
    [create_user_id]              VARCHAR (60)   CONSTRAINT [DF_permit_authority_CREATE_USER_ID] DEFAULT (suser_name()) NOT NULL,
    [update_datetime]             DATETIME2 (7)  NULL,
    [update_user_id]              VARCHAR (60)   NULL,
    CONSTRAINT [PK_building_permit_authority] PRIMARY KEY CLUSTERED ([bldg_permit_auth_id] ASC)
);

