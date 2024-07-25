CREATE TABLE [asr_staging].[s_tlkptaxauthority] (
    [TAXAUTHORITY]                 VARCHAR (10)  NULL,
    [STATEAUTHORITYCODE]           VARCHAR (10)  NULL,
    [AUTHORITYTYPE]                VARCHAR (60)  NULL,
    [AUTHORITYNAME]                VARCHAR (50)  NULL,
    [CREATIONDATE]                 VARCHAR (22)  NULL,
    [CONTACTPERSON]                VARCHAR (50)  NULL,
    [CONTACTADDRESS1]              VARCHAR (40)  NULL,
    [CONTACTADDRESS2]              VARCHAR (40)  NULL,
    [CONTACTCITY]                  VARCHAR (40)  NULL,
    [CONTACTSTATE]                 VARCHAR (2)   NULL,
    [CONTACTZIPCODE]               VARCHAR (10)  NULL,
    [AFFILIATE]                    VARCHAR (10)  NULL,
    [AUTHORITYSIZE]                VARCHAR (10)  NULL,
    [SORTORDER]                    NUMERIC (9)   NULL,
    [ACTIVEFLAG]                   NUMERIC (1)   NULL,
    [JURISDICTIONID]               NUMERIC (15)  NULL,
    [LASTUPDATED]                  VARCHAR (22)  NULL,
    [CONTACTPHONE]                 VARCHAR (18)  NULL,
    [AUTHORITYVALUETYPE]           VARCHAR (15)  NULL,
    [ISURBANRENEWALAUTHORIZERFLAG] NUMERIC (1)   NULL,
    [ETL_RUN_TIME]                 DATETIME2 (7) DEFAULT (getdate()) NULL
);

