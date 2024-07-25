CREATE TABLE [asr_staging].[s_tlkptaxdistrict] (
    [TAXDISTRICT]                VARCHAR (10)  NULL,
    [TAXDISTRICTNAME]            VARCHAR (30)  NULL,
    [TAXAREA]                    VARCHAR (50)  NULL,
    [CREATIONDATE]               VARCHAR (22)  NULL,
    [SORTORDER]                  NUMERIC (9)   NULL,
    [ACTIVEFLAG]                 NUMERIC (1)   NULL,
    [JURISDICTIONID]             NUMERIC (15)  NULL,
    [TAXDISTRICTCATEGORY]        VARCHAR (10)  NULL,
    [LASTUPDATED]                VARCHAR (22)  NULL,
    [TAXDISTRICTTYPE]            NUMERIC (5)   NULL,
    [TAXDISTRICTID]              NUMERIC (15)  NULL,
    [ASSOCIATEDURBANRENEWALPLAN] VARCHAR (10)  NULL,
    [REPORTINGTAXDISTRICT]       VARCHAR (10)  NULL,
    [ETL_RUN_TIME]               DATETIME2 (7) DEFAULT (getdate()) NULL
);

