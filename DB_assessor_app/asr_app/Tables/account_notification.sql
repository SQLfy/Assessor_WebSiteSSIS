CREATE TABLE [asr_app].[account_notification] (
    [account_no]       VARCHAR (30)    NOT NULL,
    [noteid]           INT             NOT NULL,
    [note]             NVARCHAR (1000) NOT NULL,
    [note_description] NVARCHAR (2000) NOT NULL,
    [note_active]      NCHAR (1)       NOT NULL,
    [create_datetime]  DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [create_user_id]   VARCHAR (60)    DEFAULT (suser_sname()) NOT NULL,
    [update_datetime]  DATETIME2 (7)   NULL,
    [update_user_id]   VARCHAR (60)    NULL,
    CONSTRAINT [pk_account_notification] PRIMARY KEY CLUSTERED ([account_no] ASC, [noteid] ASC),
    CONSTRAINT [fk_account_notifications_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[account_notification] NOCHECK CONSTRAINT [fk_account_notifications_account];




GO



