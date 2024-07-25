﻿CREATE TABLE [dqm].[s_tblpersonsecure_err] (
    [COLUMN_NAME]       VARCHAR (100)   NOT NULL,
    [DQM_RULE]          VARCHAR (100)   NOT NULL,
    [ERROR_DESCRIPTION] VARCHAR (100)   NOT NULL,
    [DQM_RUN_DATE]      DATE            NOT NULL,
    [VERSTART]          NUMERIC (11)    NULL,
    [VEREND]            NUMERIC (11)    NULL,
    [PERSONCODE]        NUMERIC (15)    NULL,
    [NAME1]             VARCHAR (60)    NULL,
    [NAME2]             VARCHAR (60)    NULL,
    [PHONE]             VARCHAR (18)    NULL,
    [FAX]               VARCHAR (18)    NULL,
    [MOBILE]            VARCHAR (18)    NULL,
    [PAGER]             VARCHAR (18)    NULL,
    [EMAILADDRESS]      VARCHAR (100)   NULL,
    [FEDERALIDNO]       VARCHAR (30)    NULL,
    [PRIVATEFLAG]       NUMERIC (1)     NULL,
    [PERSONON0]         NUMERIC (20, 6) NULL,
    [PERSONON1]         NUMERIC (20, 6) NULL,
    [PERSONON2]         NUMERIC (20, 6) NULL,
    [ALTNAME1]          VARCHAR (60)    NULL,
    [PERSONTYPEID]      NUMERIC (15)    NULL,
    [JURISDICTIONID]    NUMERIC (15)    NULL,
    [PERSONOD0]         VARCHAR (22)    NULL,
    [PERSONOD1]         VARCHAR (22)    NULL,
    [PERSONOM0]         VARCHAR (50)    NULL,
    [PERSONOM1]         VARCHAR (50)    NULL,
    [PERSONOT0]         VARCHAR (50)    NULL,
    [PERSONOT1]         VARCHAR (50)    NULL,
    [WRITEDATE]         VARCHAR (22)    NULL,
    [SEQID]             NUMERIC (15)    NULL,
    [ETL_RUN_TIME]      DATETIME2 (7)   DEFAULT (getdate()) NULL
);

