CREATE TABLE [asr_app].[azure_important_dates_old] (
    [ID]              INT            NOT NULL,
    [Description]     NVARCHAR (220) NULL,
    [Reappraisal]     NVARCHAR (30)  NULL,
    [Event_Name]      NVARCHAR (220) NULL,
    [Intervening]     NVARCHAR (30)  NULL,
    [Category]        NVARCHAR (30)  NULL,
    [create_datetime] DATETIME2 (7)  CONSTRAINT [DF_important_dates_CREATE_DTM_old] DEFAULT (getdate()) NOT NULL,
    [create_user_id]  VARCHAR (60)   CONSTRAINT [DF_important_dates_CREATE_USER_ID_old] DEFAULT (suser_name()) NOT NULL,
    [update_datetime] DATETIME2 (7)  NULL,
    [update_user_id]  VARCHAR (60)   NULL,
    [Title]           NVARCHAR (220) NULL,
    CONSTRAINT [PK_azure_important_dates_old] PRIMARY KEY CLUSTERED ([ID] ASC)
);

