CREATE TABLE [asr_api_test].[LookupTaxAuthority] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [taxAuthoritytNo]  VARCHAR (30)  NOT NULL,
    [taxAuthorityName] VARCHAR (150) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_TaxAuthorityNo]
    ON [asr_api_test].[LookupTaxAuthority]([taxAuthoritytNo] ASC);

