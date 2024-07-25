﻿CREATE TABLE [dqm].[s_tlkpimpsaddons_err] (
    [COLUMN_NAME]            VARCHAR (100)   NOT NULL,
    [DQM_RULE]               VARCHAR (100)   NOT NULL,
    [ERROR_DESCRIPTION]      VARCHAR (100)   NOT NULL,
    [DQM_RUN_DATE]           DATE            NOT NULL,
    [ADDONDESCRIPTION]       VARCHAR (50)    NULL,
    [ADDONVALUE]             NUMERIC (15, 2) NULL,
    [ADDONFILTERTYPE]        VARCHAR (50)    NULL,
    [DEPRTYPE]               VARCHAR (20)    NULL,
    [OVERRIDELIFEEXPECTANCY] NUMERIC (3)     NULL,
    [SORTORDER]              NUMERIC (9)     NULL,
    [ACTIVEFLAG]             NUMERIC (1)     NULL,
    [USEINANALYSISFLAG]      NUMERIC (1)     NULL,
    [IMPDETAILTYPE]          VARCHAR (30)    NULL,
    [ADDONCODE]              NUMERIC (15)    NULL,
    [JURISDICTIONID]         NUMERIC (15)    NULL,
    [LASTUPDATED]            VARCHAR (22)    NULL,
    [APEXLINKFLAG]           NUMERIC (1)     NULL
);

