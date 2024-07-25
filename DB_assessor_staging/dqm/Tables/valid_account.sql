CREATE TABLE [dqm].[valid_account] (
    [account_no]      VARCHAR (30)  NOT NULL,
    [create_datetime] DATETIME2 (7) NOT NULL,
    [create_user_id]  VARCHAR (60)  NOT NULL,
    CONSTRAINT [pk_valid_account] PRIMARY KEY CLUSTERED ([account_no] ASC)
);

