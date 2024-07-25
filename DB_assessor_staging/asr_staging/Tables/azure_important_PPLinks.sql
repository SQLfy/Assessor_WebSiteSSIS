CREATE TABLE [asr_staging].[azure_important_PPLinks] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [LinkName]        NVARCHAR (220)  NULL,
    [LinkURL]         NVARCHAR (220)  NULL,
    [LinkOrder]       DECIMAL (28, 6) NULL,
    [create_datetime] DATETIME2 (7)   CONSTRAINT [DF_important_PPLinks_CREATE_DTM] DEFAULT (getdate()) NOT NULL,
    [create_user_id]  VARCHAR (60)    CONSTRAINT [DF_important_PPLinks_CREATE_USER_ID] DEFAULT (suser_name()) NOT NULL,
    [update_datetime] DATETIME2 (7)   NULL,
    [update_user_id]  VARCHAR (60)    NULL,
    CONSTRAINT [PK_azure_important_PPLinks] PRIMARY KEY CLUSTERED ([ID] ASC)
);

