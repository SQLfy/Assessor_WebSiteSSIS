﻿CREATE TABLE [asr_staging].[s_tlkpzoning] (
    [ZONINGCODE]        VARCHAR (50)    NULL,
    [ZONINGDESCRIPTION] VARCHAR (40)    NULL,
    [SORTORDER]         NUMERIC (9)     NULL,
    [ACTIVEFLAG]        NUMERIC (1)     NULL,
    [JURISDICTIONID]    NUMERIC (15)    NULL,
    [LASTUPDATED]       DATETIME2 (0)   NULL,
    [ZONINGFACTOR]      NUMERIC (15, 4) NULL
);

