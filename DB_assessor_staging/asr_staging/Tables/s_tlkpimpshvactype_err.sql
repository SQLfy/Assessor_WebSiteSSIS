CREATE TABLE [asr_staging].[s_tlkpimpshvactype_err] (
    [COLUMN_NAME]       VARCHAR (100) NOT NULL,
    [DQM_RULE]          VARCHAR (100) NOT NULL,
    [ERROR_DESCRIPTION] VARCHAR (100) NOT NULL,
    [DQM_RUN_DATE]      DATE          NOT NULL,
    [HVACTYPE]          VARCHAR (30)  NULL,
    [PROPERTYTYPE]      VARCHAR (15)  NULL,
    [SORTORDER]         NUMERIC (9)   NULL,
    [ACTIVEFLAG]        NUMERIC (1)   NULL,
    [JURISDICTIONID]    NUMERIC (15)  NULL,
    [LASTUPDATED]       VARCHAR (22)  NULL
);

