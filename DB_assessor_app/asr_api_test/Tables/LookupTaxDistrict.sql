CREATE TABLE [asr_api_test].[LookupTaxDistrict] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [taxDistrictNo] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_TaxDistrictNo]
    ON [asr_api_test].[LookupTaxDistrict]([taxDistrictNo] ASC);

