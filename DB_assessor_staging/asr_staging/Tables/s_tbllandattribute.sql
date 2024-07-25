﻿CREATE TABLE [asr_staging].[s_tbllandattribute] (
    [VERSTART]            NUMERIC (11)    NULL,
    [VEREND]              NUMERIC (11)    NULL,
    [ACCOUNTNO]           VARCHAR (30)    NULL,
    [DETAILID]            NUMERIC (15)    NULL,
    [ATTRIBUTETYPE]       VARCHAR (30)    NULL,
    [ATTRIBUTESUBTYPE]    VARCHAR (50)    NULL,
    [ATTRIBUTEADJUSTMENT] NUMERIC (15, 6) NULL,
    [FILTERTYPE]          VARCHAR (15)    NULL,
    [LANDATTRIBUTEOT0]    VARCHAR (50)    NULL,
    [LANDATTRIBUTEOT1]    VARCHAR (50)    NULL,
    [LANDATTRIBUTEON0]    NUMERIC (20, 6) NULL,
    [LANDATTRIBUTEON1]    NUMERIC (20, 6) NULL,
    [LANDATTRIBUTEON2]    NUMERIC (20, 6) NULL,
    [LANDATTRIBUTEOD0]    VARCHAR (22)    NULL,
    [LANDATTRIBUTEOD1]    VARCHAR (22)    NULL,
    [LANDATTRIBUTEOM0]    VARCHAR (50)    NULL,
    [LANDATTRIBUTEOM1]    VARCHAR (50)    NULL,
    [JURISDICTIONID]      NUMERIC (15)    NULL,
    [WRITEDATE]           VARCHAR (22)    NULL,
    [SEQID]               NUMERIC (15)    NULL
);


GO
CREATE CLUSTERED INDEX [s_tbllandattribute_ClusteredIndex-accountno]
    ON [asr_staging].[s_tbllandattribute]([ACCOUNTNO] ASC);

