CREATE TABLE [asr_staging].[s_tlkpdeedtype] (
    [DEEDCODE]                 VARCHAR (10) NULL,
    [DEEDDESCRIPTION]          VARCHAR (40) NULL,
    [SORTORDER]                NUMERIC (9)  NULL,
    [ACTIVEFLAG]               NUMERIC (1)  NULL,
    [EFFECTEXEMPTIONSFLAG]     NUMERIC (1)  NULL,
    [EFFECTCAPFLAG]            NUMERIC (1)  NULL,
    [INCLUDEINSALESRATIOSFLAG] NUMERIC (1)  NULL,
    [JURISDICTIONID]           NUMERIC (15) NULL,
    [NONSALEFLAG]              NUMERIC (1)  NULL,
    [LASTUPDATED]              VARCHAR (22) NULL
);

