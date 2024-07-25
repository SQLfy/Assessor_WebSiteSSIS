CREATE TABLE [asr_adv_search_query].[account_number] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [account_no] VARCHAR (30) NOT NULL,
    CONSTRAINT [PK_account_number] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_account_number]
    ON [asr_adv_search_query].[account_number]([id] ASC);

