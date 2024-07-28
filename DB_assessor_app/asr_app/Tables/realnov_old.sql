﻿CREATE TABLE [asr_app].[realnov_old] (
    [account_no]            VARCHAR (30)     NULL,
    [TAXYEAR]               NUMERIC (4)      NULL,
    [PARCELNO]              VARCHAR (30)     NULL,
    [PROPADDRESS]           VARCHAR (81)     NULL,
    [LEGALDESCRIPTION1]     NVARCHAR (1024)  NULL,
    [LEGALDESCRIPTION2]     NVARCHAR (1024)  NULL,
    [LEGALDESCRIPTION3]     NVARCHAR (1024)  NULL,
    [NAME1]                 VARCHAR (40)     NULL,
    [NAME2]                 VARCHAR (40)     NULL,
    [PNAME1]                VARCHAR (40)     NULL,
    [PNAME2]                VARCHAR (40)     NULL,
    [OWNERADDRESS1]         VARCHAR (40)     NULL,
    [OWNERADDRESS2]         VARCHAR (40)     NULL,
    [OWNERCITY]             VARCHAR (50)     NULL,
    [OWNERSTATE]            VARCHAR (2)      NULL,
    [OWNERZIP]              VARCHAR (5)      NULL,
    [PROPCLASS1]            VARCHAR (50)     NULL,
    [PRIORVALUE1]           VARCHAR (8000)   NULL,
    [CURRENTVALUE1]         VARCHAR (8000)   NULL,
    [INCREASEDECREASE1]     VARCHAR (8000)   NULL,
    [PROPCLASS2]            VARCHAR (50)     NULL,
    [PRIORVALUE2]           VARCHAR (8000)   NULL,
    [CURRENTVALUE2]         VARCHAR (8000)   NULL,
    [INCREASEDECREASE2]     VARCHAR (8000)   NULL,
    [PROPCLASS3]            VARCHAR (50)     NULL,
    [PRIORVALUE3]           VARCHAR (8000)   NULL,
    [CURRENTVALUE3]         VARCHAR (8000)   NULL,
    [INCREASEDECREASE3]     VARCHAR (8000)   NULL,
    [PROPCLASS4]            VARCHAR (50)     NULL,
    [PRIORVALUE4]           VARCHAR (8000)   NULL,
    [CURRENTVALUE4]         VARCHAR (8000)   NULL,
    [INCREASEDECREASE4]     VARCHAR (8000)   NULL,
    [PROPCLASS5]            VARCHAR (50)     NULL,
    [PRIORVALUE5]           VARCHAR (50)     NULL,
    [CURRENTVALUE5]         VARCHAR (50)     NULL,
    [INCREASEDECREASE5]     VARCHAR (50)     NULL,
    [PROPCLASS6]            VARCHAR (50)     NULL,
    [PRIORVALUE6]           VARCHAR (50)     NULL,
    [CURRENTVALUE6]         VARCHAR (50)     NULL,
    [INCREASEDECREASE6]     VARCHAR (50)     NULL,
    [TOTALPRIOR]            VARCHAR (8000)   NULL,
    [TOTALCURRENT]          VARCHAR (8000)   NULL,
    [TOTALINCREASEDECREASE] VARCHAR (8000)   NULL,
    [VALUEYEAR]             INT              NULL,
    [PROPERTYTYPE]          VARCHAR (15)     NULL,
    [PRIMARYBUILDING]       VARCHAR (10)     NULL,
    [BUILDINGCOUNT]         VARCHAR (3)      NULL,
    [SUBDIVISION]           VARCHAR (18)     NULL,
    [NEIGHBORHOOD]          VARCHAR (10)     NULL,
    [RESIDENTIALSF]         NUMERIC (10)     NULL,
    [STYLE]                 VARCHAR (18)     NULL,
    [QUALITY]               VARCHAR (15)     NULL,
    [YEARBUILT]             VARCHAR (10)     NULL,
    [HEATTYPE]              VARCHAR (18)     NULL,
    [BASEMENTSF]            NUMERIC (10)     NULL,
    [FINISHEDBSMNTSF]       NUMERIC (10)     NULL,
    [BASEMENTTYPE]          VARCHAR (10)     NULL,
    [GARAGESF]              NUMERIC (10)     NULL,
    [IMPSF]                 NUMERIC (10)     NULL,
    [COMMERCIALSF]          NUMERIC (10)     NULL,
    [OUTBUILDINGSF]         NUMERIC (10)     NULL,
    [LANDTYPE]              VARCHAR (15)     NULL,
    [ACREAGE]               VARCHAR (10)     NULL,
    [LEA]                   VARCHAR (30)     NULL,
    [LANDATTRIBUTES]        VARCHAR (150)    NULL,
    [APPRDATEYEAR]          VARCHAR (10)     NULL,
    [REAPPRYEAR]            VARCHAR (10)     NULL,
    [BEGPERYEAR]            VARCHAR (10)     NULL,
    [ENDPERYEAR]            VARCHAR (10)     NULL,
    [CBOEDEADLINE]          VARCHAR (10)     NULL,
    [PRINTFLAG]             VARCHAR (1)      NULL,
    [BULKNOVFLAG]           VARCHAR (1)      NULL,
    [PRIVATEFLAG]           VARCHAR (1)      NULL,
    [create_datetime]       DATETIME2 (7)    NULL,
    [create_user_id]        VARCHAR (60)     NOT NULL,
    [update_datetime]       DATETIME2 (7)    NULL,
    [update_user_id]        VARCHAR (60)     NULL,
    [rowhash]               VARBINARY (8000) NULL,
    [ASSESSOR]              VARCHAR (50)     NULL,
    CONSTRAINT [fk_nov_account_old] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[realnov_old] NOCHECK CONSTRAINT [fk_nov_account_old];


GO
CREATE CLUSTERED INDEX [IDX_Account_Taxyear]
    ON [asr_app].[realnov_old]([account_no] ASC, [TAXYEAR] ASC);
