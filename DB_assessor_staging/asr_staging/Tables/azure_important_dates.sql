CREATE TABLE [asr_staging].[azure_important_dates] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (255) NULL,
    [Reappraisal]     NVARCHAR (255) NULL,
    [Event_Name]      NVARCHAR (255) NULL,
    [Intervening]     NVARCHAR (255) NULL,
    [Category]        NVARCHAR (255) NULL,
    [create_datetime] DATETIME2 (7)  CONSTRAINT [DF_important_dates_CREATE_DTM] DEFAULT (getdate()) NOT NULL,
    [create_user_id]  VARCHAR (60)   CONSTRAINT [DF_important_dates_CREATE_USER_ID] DEFAULT (suser_name()) NOT NULL,
    [update_datetime] DATETIME2 (7)  NULL,
    [update_user_id]  VARCHAR (60)   NULL,
    [Title]           NVARCHAR (255) NULL,
    CONSTRAINT [PK_azure_important_dates] PRIMARY KEY CLUSTERED ([ID] ASC)
);

