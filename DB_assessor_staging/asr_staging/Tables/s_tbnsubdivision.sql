CREATE TABLE [asr_staging].[s_tbnsubdivision] (
    [SUBNO]          VARCHAR (30)    NULL,
    [SUBNAME]        VARCHAR (255)   NULL,
    [SUBDATECREATED] VARCHAR (22)    NULL,
    [SUBON2]         NUMERIC (20, 6) NULL,
    [SUBOT0]         VARCHAR (50)    NULL,
    [SUBOT1]         VARCHAR (50)    NULL,
    [SUBOD0]         VARCHAR (22)    NULL,
    [SUBOD1]         VARCHAR (22)    NULL,
    [SUBOM0]         VARCHAR (50)    NULL,
    [SUBOM1]         VARCHAR (50)    NULL,
    [SUBON0]         NUMERIC (20, 6) NULL,
    [SUBON1]         NUMERIC (20, 6) NULL,
    [JURISDICTIONID] NUMERIC (15)    NULL,
    [LASTUPDATED]    VARCHAR (22)    NULL,
    [ETL_RUN_TIME]   DATETIME2 (7)   DEFAULT (getdate()) NULL
);

