﻿CREATE TABLE [asr_staging].[s_tlkpaccttype] (
    [ACCTTYPE]        VARCHAR (15)  NULL,
    [APPRAISALTYPE]   VARCHAR (30)  NULL,
    [SORTORDER]       NUMERIC (9)   NULL,
    [ACTIVEFLAG]      NUMERIC (1)   NULL,
    [MHLPFLAG]        NUMERIC (1)   NULL,
    [JURISDICTIONID]  NUMERIC (15)  NULL,
    [MASSINCLUDEFLAG] NUMERIC (1)   NULL,
    [LASTUPDATED]     VARCHAR (22)  NULL,
    [ETL_RUN_TIME]    DATETIME2 (7) DEFAULT (getdate()) NULL
);

