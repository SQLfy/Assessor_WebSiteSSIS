CREATE TABLE [asr_api_test].[TaxAuthorityFundData] (
    [id]             INT             IDENTITY (1, 1) NOT NULL,
    [taxAuthorityId] VARCHAR (30)    NOT NULL,
    [fundCode]       VARCHAR (20)    NULL,
    [description]    VARCHAR (100)   NULL,
    [millLevy]       NUMERIC (11, 6) NULL,
    CONSTRAINT [PK_TaxAuthorityFundData] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_TaxAuthorityId]
    ON [asr_api_test].[TaxAuthorityFundData]([taxAuthorityId] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_TaxAuthorityIdFundCode]
    ON [asr_api_test].[TaxAuthorityFundData]([taxAuthorityId] ASC, [fundCode] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_Description]
    ON [asr_api_test].[TaxAuthorityFundData]([description] ASC);

