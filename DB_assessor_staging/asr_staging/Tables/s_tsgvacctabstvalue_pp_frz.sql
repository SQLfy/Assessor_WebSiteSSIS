CREATE TABLE [asr_staging].[s_tsgvacctabstvalue_pp_frz] (
    [VERSTART]                    NUMERIC (11)    NULL,
    [VEREND]                      NUMERIC (11)    NULL,
    [ACCOUNTNO]                   VARCHAR (30)    NULL,
    [ABSTRACTCODE]                VARCHAR (10)    NULL,
    [TAXYEAR]                     NUMERIC (4)     NULL,
    [ACTUALVALUE]                 NUMERIC (15, 2) NULL,
    [RAWASSESSEDVALUE]            NUMERIC (15, 2) NULL,
    [NEWCONSTVALUECHANGE]         NUMERIC (15, 2) NULL,
    [NEWCONSTVALUECHANGEASSESSED] NUMERIC (15, 2) NULL,
    [JURISDICTIONID]              NUMERIC (15)    NULL,
    [WRITEDATE]                   VARCHAR (22)    NULL,
    [SEQID]                       NUMERIC (15)    NOT NULL,
    [MILLLEVY]                    NUMERIC (11, 6) NULL,
    [TAXDISTRICT]                 VARCHAR (10)    NULL
);

