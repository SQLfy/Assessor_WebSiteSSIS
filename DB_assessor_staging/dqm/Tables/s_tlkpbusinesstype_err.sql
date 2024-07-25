CREATE TABLE [dqm].[s_tlkpbusinesstype_err] (
    [COLUMN_NAME]             VARCHAR (100) NOT NULL,
    [DQM_RULE]                VARCHAR (100) NOT NULL,
    [ERROR_DESCRIPTION]       VARCHAR (100) NOT NULL,
    [DQM_RUN_DATE]            DATE          NOT NULL,
    [BUSINESSCODE]            VARCHAR (10)  NULL,
    [BUSINESSTYPEDESCRIPTION] VARCHAR (50)  NULL,
    [ACTIVEFLAG]              NUMERIC (1)   NULL,
    [SORTORDER]               NUMERIC (9)   NULL,
    [JURISDICTIONID]          NUMERIC (15)  NULL,
    [LASTUPDATED]             VARCHAR (22)  NULL
);

