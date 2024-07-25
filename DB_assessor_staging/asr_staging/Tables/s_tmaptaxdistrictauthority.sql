CREATE TABLE [asr_staging].[s_tmaptaxdistrictauthority] (
    [TAXDISTRICT]        VARCHAR (10)    NULL,
    [TAXAUTHORITY]       VARCHAR (10)    NULL,
    [TAXYEAR]            NUMERIC (4)     NULL,
    [SORTORDER]          NUMERIC (9)     NULL,
    [JURISDICTIONID]     NUMERIC (15)    NULL,
    [LASTUPDATED]        VARCHAR (22)    NULL,
    [TIFAUTHORITY]       VARCHAR (10)    NULL,
    [TIFPERCENTAGE]      NUMERIC (8, 7)  NULL,
    [EXCESSVALUE]        NUMERIC (15, 2) NULL,
    [EXCESSVALUENOTUSED] NUMERIC (15, 2) NULL,
    [ETL_RUN_TIME]       DATETIME2 (7)   DEFAULT (getdate()) NULL
);

