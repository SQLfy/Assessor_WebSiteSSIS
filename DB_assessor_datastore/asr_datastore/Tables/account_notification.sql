CREATE TABLE [asr_datastore].[account_notification] (
    [ACCOUNTNO]       VARCHAR (30)    NOT NULL,
    [NOTEID]          INT             NOT NULL,
    [NOTE]            NVARCHAR (1000) NULL,
    [NOTE_DESC]       NVARCHAR (4000) NULL,
    [NOTE_ACTIVE]     NCHAR (1)       NULL,
    [NOTE_VALID_FROM] DATE            NULL,
    [NOTE_VALID_TO]   DATE            NULL,
    [ETL_RUN_TIME]    DATETIME        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_account_notification] PRIMARY KEY CLUSTERED ([ACCOUNTNO] ASC, [NOTEID] ASC)
);


GO


GO
