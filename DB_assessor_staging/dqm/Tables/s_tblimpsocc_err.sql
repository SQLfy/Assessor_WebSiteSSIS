﻿CREATE TABLE [dqm].[s_tblimpsocc_err] (
    [COLUMN_NAME]       VARCHAR (100)   NOT NULL,
    [DQM_RULE]          VARCHAR (100)   NOT NULL,
    [ERROR_DESCRIPTION] VARCHAR (100)   NOT NULL,
    [DQM_RUN_DATE]      DATE            NOT NULL,
    [DETAILID]          NUMERIC (15)    NULL,
    [VERSTART]          NUMERIC (11)    NULL,
    [VEREND]            NUMERIC (11)    NULL,
    [ACCOUNTNO]         VARCHAR (30)    NULL,
    [IMPNO]             NUMERIC (7, 2)  NULL,
    [OCCCODE]           NUMERIC (15)    NULL,
    [OCCPERCENT]        NUMERIC (15, 4) NULL,
    [ABSTRACTCODE]      VARCHAR (10)    NULL,
    [IMPABSTRACTVALUE]  NUMERIC (15, 2) NULL,
    [ABSTRACTINDATE]    VARCHAR (22)    NULL,
    [ABSTRACTOUTDATE]   VARCHAR (22)    NULL,
    [ABSTRACTADJCODE]   VARCHAR (5)     NULL,
    [PRORATETYPE]       VARCHAR (10)    NULL,
    [TAXDISTRICT]       VARCHAR (10)    NULL,
    [JURISDICTIONID]    NUMERIC (15)    NULL,
    [IMPSOCCOT0]        VARCHAR (50)    NULL,
    [IMPSOCCOT1]        VARCHAR (50)    NULL,
    [IMPSOCCOM0]        VARCHAR (50)    NULL,
    [IMPSOCCOM1]        VARCHAR (50)    NULL,
    [IMPSOCCOD0]        VARCHAR (22)    NULL,
    [IMPSOCCOD1]        VARCHAR (22)    NULL,
    [IMPSOCCON0]        NUMERIC (20, 6) NULL,
    [IMPSOCCON1]        NUMERIC (20, 6) NULL,
    [IMPSOCCON2]        NUMERIC (20, 6) NULL,
    [WRITEDATE]         VARCHAR (22)    NULL,
    [OCCCOMPLETEDPCT]   NUMERIC (15, 4) NULL,
    [SEQID]             NUMERIC (15)    NULL,
    [ETL_RUN_TIME]      DATETIME2 (7)   DEFAULT (getdate()) NULL
);
