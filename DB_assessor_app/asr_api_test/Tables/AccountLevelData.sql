CREATE TABLE [asr_api_test].[AccountLevelData] (
    [accountNumber]                   VARCHAR (30)    NOT NULL,
    [stateParcelNumber]               VARCHAR (30)    NULL,
    [taxDistrictNo]                   VARCHAR (30)    NOT NULL,
    [subFilingRecordingNo]            VARCHAR (30)    NULL,
    [accountType]                     VARCHAR (30)    NOT NULL,
    [appraisalType]                   VARCHAR (30)    NOT NULL,
    [accountStatus]                   VARCHAR (30)    NOT NULL,
    [accountStatusDescription]        VARCHAR (100)   NULL,
    [legalDescription]                VARCHAR (MAX)   NULL,
    [longitude]                       NUMERIC (30, 8) NULL,
    [latitude]                        NUMERIC (30, 8) NULL,
    [location]                        VARCHAR (50)    NULL,
    [elevation]                       NUMERIC (30, 8) NULL,
    [bldgPermitAuthId]                INT             NULL,
    [quartersection]                  VARCHAR (15)    NULL,
    [section]                         VARCHAR (15)    NULL,
    [township]                        VARCHAR (15)    NULL,
    [range]                           VARCHAR (15)    NULL,
    [zoningCode]                      VARCHAR (50)    NULL,
    [zoningCodeDescription]           VARCHAR (100)   NULL,
    [defaultLea]                      VARCHAR (30)    NULL,
    [defaultLeaDescription]           VARCHAR (100)   NULL,
    [totalImprovementInterestPercent] NUMERIC (9, 6)  NULL,
    [totalLandInterestPercent]        NUMERIC (9, 6)  NULL,
    [isVacant]                        BIT             NULL,
    [isImprovementOnly]               BIT             NULL,
    [isTif]                           BIT             NULL,
    [isPlatted]                       BIT             NULL,
    [numberOfBuildings]               VARCHAR (10)    NULL,
    [subdivisionNo]                   VARCHAR (30)    NULL,
    [subdivisionName]                 VARCHAR (256)   NULL,
    [filingNumber]                    VARCHAR (30)    NULL,
    [recordingNumber]                 VARCHAR (30)    NULL,
    [isPrivate]                       BIT             NULL,
    [mailingAddressIsPrimary]         BIT             NULL,
    [ownerName]                       VARCHAR (256)   NULL,
    [mailingAddressStreet]            VARCHAR (80)    NULL,
    [mailingAddressStreet2]           VARCHAR (80)    NULL,
    [mailingAddressCity]              VARCHAR (80)    NULL,
    [mailingAddressState]             VARCHAR (80)    NULL,
    [mailingAddressZipCode]           VARCHAR (30)    NULL,
    [propertyAddressIsPrimary]        BIT             NULL,
    [propertyAddressStreet]           VARCHAR (315)   NULL,
    [propertyAddressCity]             VARCHAR (50)    NULL,
    [propertyAddressZipCode]          VARCHAR (10)    NULL,
    [buildingPermitAuthorityName]     NVARCHAR (100)  NULL,
    [buildingPermitAuthorityPhone]    NVARCHAR (30)   NULL,
    [buildingPermitAuthorityEmail]    NVARCHAR (220)  NULL,
    [buildingPermitAuthorityURL]      NVARCHAR (220)  NULL,
    [buildingPermitAuthorityStreet]   NVARCHAR (220)  NULL,
    [buildingPermitAuthorityCity]     NVARCHAR (100)  NULL,
    [buildingPermitAuthorityZipCode]  NVARCHAR (20)   NULL,
    CONSTRAINT [PK_AccountLevelData] PRIMARY KEY CLUSTERED ([accountNumber] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_AccountType]
    ON [asr_api_test].[AccountLevelData]([accountType] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_StateParcelNumber]
    ON [asr_api_test].[AccountLevelData]([stateParcelNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_OwnerName]
    ON [asr_api_test].[AccountLevelData]([ownerName] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_SubFilingRecordingNo]
    ON [asr_api_test].[AccountLevelData]([subFilingRecordingNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_TaxDistrict]
    ON [asr_api_test].[AccountLevelData]([taxDistrictNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_FilingNumber]
    ON [asr_api_test].[AccountLevelData]([filingNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_SubDivisionNoSubDivisionName]
    ON [asr_api_test].[AccountLevelData]([subdivisionNo] ASC, [subdivisionName] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_Section]
    ON [asr_api_test].[AccountLevelData]([section] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_Township]
    ON [asr_api_test].[AccountLevelData]([township] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_Range]
    ON [asr_api_test].[AccountLevelData]([range] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_PrimaryPropertyAddressStreet]
    ON [asr_api_test].[AccountLevelData]([propertyAddressStreet] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_PrimaryPropertyAddressCity]
    ON [asr_api_test].[AccountLevelData]([propertyAddressCity] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_PrimaryPropertyAddressZipCode]
    ON [asr_api_test].[AccountLevelData]([propertyAddressZipCode] ASC);

