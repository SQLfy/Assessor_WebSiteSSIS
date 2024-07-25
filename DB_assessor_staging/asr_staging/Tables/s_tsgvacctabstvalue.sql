CREATE TABLE [asr_staging].[s_tsgvacctabstvalue] (
    [VERSTART]                    NUMERIC (11)    NULL,
    [VEREND]                      NUMERIC (11)    NULL,
    [ACCOUNTNO]                   VARCHAR (30)    NOT NULL,
    [ABSTRACTCODE]                VARCHAR (10)    NOT NULL,
    [TAXDISTRICT]                 VARCHAR (10)    NOT NULL,
    [TAXYEAR]                     NUMERIC (4)     NOT NULL,
    [ACTUALVALUE]                 NUMERIC (15, 2) NULL,
    [RAWASSESSEDVALUE]            NUMERIC (15, 2) NULL,
    [NEWCONSTVALUECHANGE]         NUMERIC (15, 2) NULL,
    [NEWCONSTVALUECHANGEASSESSED] NUMERIC (15, 2) NULL,
    [JURISDICTIONID]              NUMERIC (15)    NULL,
    [WRITEDATE]                   VARCHAR (22)    NULL,
    [SEQID]                       NUMERIC (15)    NOT NULL,
    [MILLLEVY]                    NUMERIC (11, 6) NULL,
    [ASSESSMENTRATIO]             NUMERIC (15, 6) NULL
);

