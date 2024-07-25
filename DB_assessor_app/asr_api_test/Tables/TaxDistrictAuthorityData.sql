CREATE TABLE [asr_api_test].[TaxDistrictAuthorityData] (
    [id]                         INT           IDENTITY (1, 1) NOT NULL,
    [taxDistrictNo]              VARCHAR (30)  NOT NULL,
    [taxAuthorityNo]             VARCHAR (30)  NOT NULL,
    [taxAuthorityName]           VARCHAR (256) NULL,
    [taxAuthorityPointOfContact] VARCHAR (60)  NULL,
    [taxAuthorityContactPhone]   VARCHAR (18)  NULL,
    [taxAuthorityContactStreet]  VARCHAR (80)  NULL,
    [taxAuthorityContactStreet2] VARCHAR (80)  NULL,
    [taxAuthorityContactCity]    VARCHAR (50)  NULL,
    [taxAuthorityZipCode]        VARCHAR (10)  NULL,
    CONSTRAINT [PK_TaxDistrictAuthorityData] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_TaxDistrict]
    ON [asr_api_test].[TaxDistrictAuthorityData]([taxDistrictNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_TaxAuthorityNo]
    ON [asr_api_test].[TaxDistrictAuthorityData]([taxAuthorityNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_TaxDistrictNoTaxAuthorityNo]
    ON [asr_api_test].[TaxDistrictAuthorityData]([taxDistrictNo] ASC, [taxAuthorityNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_TaxAuthorityName]
    ON [asr_api_test].[TaxDistrictAuthorityData]([taxAuthorityName] ASC);

