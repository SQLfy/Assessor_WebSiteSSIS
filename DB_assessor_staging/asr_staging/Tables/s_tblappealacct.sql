﻿CREATE TABLE [asr_staging].[s_tblappealacct] (
    [VERSTART]                 NUMERIC (11)    NULL,
    [VEREND]                   NUMERIC (11)    NULL,
    [TAXYEAR]                  NUMERIC (4)     NULL,
    [APPEALNO]                 NUMERIC (15)    NULL,
    [ACCOUNTNO]                VARCHAR (30)    NULL,
    [APPEALADJUSTDENYREASONID] NUMERIC (15)    NULL,
    [APPEALCOMMENT]            VARCHAR (255)   NULL,
    [APPEALACCOUNTENDVALUE]    NUMERIC (15, 2) NULL,
    [VALUEGROUPDESCRIPTION]    VARCHAR (50)    NULL,
    [APPEALACCTON0]            NUMERIC (20, 6) NULL,
    [APPEALACCTON1]            NUMERIC (20, 6) NULL,
    [APPEALACCTON2]            NUMERIC (20, 6) NULL,
    [APPEALACCTOD0]            VARCHAR (22)    NULL,
    [APPEALACCTOD1]            VARCHAR (22)    NULL,
    [APPEALACCTOM0]            VARCHAR (50)    NULL,
    [APPEALACCTOM1]            VARCHAR (50)    NULL,
    [APPEALACCTOT0]            VARCHAR (50)    NULL,
    [APPEALACCTOT1]            VARCHAR (50)    NULL,
    [JURISDICTIONID]           NUMERIC (15)    NULL,
    [WRITEDATE]                VARCHAR (22)    NULL,
    [BEGINNINGACCOUNTVALUE]    NUMERIC (15, 2) NULL,
    [APPEALDECISION]           VARCHAR (30)    NULL,
    [APPEALACCTREASONDESC]     VARCHAR (1000)  NULL,
    [ADDBOARDAPPEALENDVALUE]   NUMERIC (15, 2) NULL,
    [SEQID]                    NUMERIC (15)    NULL
);

