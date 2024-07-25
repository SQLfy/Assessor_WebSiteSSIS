CREATE TABLE [dqm].[s_tmaptaxdistrictauthority_err] (
    [COLUMN_NAME]        VARCHAR (100)   NOT NULL,
    [DQM_RULE]           VARCHAR (100)   NOT NULL,
    [ERROR_DESCRIPTION]  VARCHAR (100)   NOT NULL,
    [DQM_RUN_DATE]       DATE            NOT NULL,
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

