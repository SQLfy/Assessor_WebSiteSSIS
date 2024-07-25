CREATE TABLE [asr_datastore].[account_subtype_lkup] (
    [account_subtype_code] VARCHAR (30) NOT NULL,
    [account_type_code]    VARCHAR (30) NOT NULL,
    CONSTRAINT [PK_account_subtype_lkup] PRIMARY KEY CLUSTERED ([account_subtype_code] ASC, [account_type_code] ASC)
);

