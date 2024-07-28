﻿CREATE TABLE [asr_staging].[s_tblacctnbhd] (
    [VERSTART]            NUMERIC (11)    NULL,
    [VEREND]              NUMERIC (11)    NULL,
    [ACCOUNTNO]           VARCHAR (30)    NULL,
    [NBHDCODE]            VARCHAR (10)    NULL,
    [NBHDEXTENSION]       VARCHAR (10)    NULL,
    [PROPERTYTYPE]        VARCHAR (15)    NULL,
    [NBHDADJUSTMENTVALUE] NUMERIC (15, 4) NULL,
    [ACCTNBHDON0]         NUMERIC (20, 6) NULL,
    [ACCTNBHDON1]         NUMERIC (20, 6) NULL,
    [ACCTNBHDON2]         NUMERIC (20, 6) NULL,
    [ACCTNBHDOD0]         VARCHAR (22)    NULL,
    [ACCTNBHDOD1]         VARCHAR (22)    NULL,
    [ACCTNBHDOM0]         VARCHAR (50)    NULL,
    [ACCTNBHDOM1]         VARCHAR (50)    NULL,
    [ACCTNBHDOT0]         VARCHAR (50)    NULL,
    [ACCTNBHDOT1]         VARCHAR (50)    NULL,
    [JURISDICTIONID]      NUMERIC (15)    NULL,
    [WRITEDATE]           VARCHAR (22)    NULL,
    [SEQID]               NUMERIC (15)    NULL,
    [ETL_RUN_TIME]        DATETIME2 (7)   DEFAULT (getdate()) NULL
);
