﻿CREATE TABLE [dqm].[s_tblimpsdetail_err] (
    [COLUMN_NAME]          VARCHAR (100)   NOT NULL,
    [DQM_RULE]             VARCHAR (100)   NOT NULL,
    [ERROR_DESCRIPTION]    VARCHAR (100)   NOT NULL,
    [DQM_RUN_DATE]         DATE            NOT NULL,
    [DETAILID]             NUMERIC (15)    NULL,
    [VERSTART]             NUMERIC (11)    NULL,
    [VEREND]               NUMERIC (11)    NULL,
    [ACCOUNTNO]            VARCHAR (30)    NULL,
    [IMPNO]                NUMERIC (7, 2)  NULL,
    [IMPDETAILTYPE]        VARCHAR (30)    NULL,
    [IMPDETAILDESCRIPTION] VARCHAR (50)    NULL,
    [DETAILUNITCOUNT]      NUMERIC (15, 4) NULL,
    [DETAILYEARBUILT]      NUMERIC (4)     NULL,
    [ADDONCODE]            NUMERIC (15)    NULL,
    [JURISDICTIONID]       NUMERIC (15)    NULL,
    [APEXLINKFLAG]         NUMERIC (1)     NULL,
    [IMPSDETAILOT0]        VARCHAR (50)    NULL,
    [IMPSDETAILOT1]        VARCHAR (50)    NULL,
    [IMPSDETAILOM0]        VARCHAR (50)    NULL,
    [IMPSDETAILOM1]        VARCHAR (50)    NULL,
    [IMPSDETAILOD0]        VARCHAR (22)    NULL,
    [IMPSDETAILOD1]        VARCHAR (22)    NULL,
    [IMPSDETAILON0]        NUMERIC (20, 6) NULL,
    [IMPSDETAILON1]        NUMERIC (20, 6) NULL,
    [IMPSDETAILON2]        NUMERIC (20, 6) NULL,
    [WRITEDATE]            VARCHAR (22)    NULL,
    [SEQID]                NUMERIC (15)    NULL,
    [IMPDETAILTYPEID]      NUMERIC (5)     NULL,
    [ETL_RUN_TIME]         DATETIME2 (7)   DEFAULT (getdate()) NULL
);

