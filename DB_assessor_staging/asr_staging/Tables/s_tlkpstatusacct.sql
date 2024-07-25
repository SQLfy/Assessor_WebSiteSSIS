CREATE TABLE [asr_staging].[s_tlkpstatusacct] (
    [ACCTSTATUSCODE]        VARCHAR (1)   NULL,
    [ACCTSTATUSDESCRIPTION] VARCHAR (15)  NULL,
    [ACTIVEFLAG]            NUMERIC (1)   NULL,
    [SORTORDER]             NUMERIC (9)   NULL,
    [JURISDICTIONID]        NUMERIC (15)  NULL,
    [LASTUPDATED]           VARCHAR (22)  NULL,
    [ETL_RUN_TIME]          DATETIME2 (7) DEFAULT (getdate()) NULL
);

