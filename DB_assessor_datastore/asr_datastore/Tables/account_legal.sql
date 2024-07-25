CREATE TABLE [asr_datastore].[account_legal] (
    [ACCOUNTNO] VARCHAR (30)   NOT NULL,
    [LEGAL]     VARCHAR (4000) NULL,
    CONSTRAINT [pk_account_legal] PRIMARY KEY CLUSTERED ([ACCOUNTNO] ASC)
);

