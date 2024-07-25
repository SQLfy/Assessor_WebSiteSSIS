﻿CREATE TABLE [asr_staging].[s_tblsubaccount] (
    [VERSTART]       NUMERIC (11)    NULL,
    [VEREND]         NUMERIC (11)    NULL,
    [SUBNO]          VARCHAR (30)    NULL,
    [FILINGNO]       VARCHAR (30)    NULL,
    [ACCOUNTNO]      VARCHAR (30)    NULL,
    [BLOCK]          VARCHAR (20)    NULL,
    [LOT]            VARCHAR (20)    NULL,
    [TRACT]          VARCHAR (20)    NULL,
    [SUBACCOUNTON0]  NUMERIC (20, 6) NULL,
    [SUBACCOUNTON1]  NUMERIC (20, 6) NULL,
    [SUBACCOUNTON2]  NUMERIC (20, 6) NULL,
    [SUBACCOUNTOD0]  VARCHAR (22)    NULL,
    [SUBACCOUNTOD1]  VARCHAR (22)    NULL,
    [SUBACCOUNTOM0]  VARCHAR (50)    NULL,
    [SUBACCOUNTOM1]  VARCHAR (50)    NULL,
    [SUBACCOUNTOT0]  VARCHAR (50)    NULL,
    [SUBACCOUNTOT1]  VARCHAR (50)    NULL,
    [JURISDICTIONID] NUMERIC (15)    NULL,
    [WRITEDATE]      VARCHAR (22)    NULL,
    [SEQID]          NUMERIC (15)    NULL,
    [PRIORSUBNO]     VARCHAR (30)    NULL,
    [PRIORFILINGNO]  VARCHAR (30)    NULL,
    [ETL_RUN_TIME]   DATETIME2 (7)   DEFAULT (getdate()) NULL
);


GO
CREATE CLUSTERED INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno]
    ON [asr_staging].[s_tblsubaccount]([ACCOUNTNO] ASC);

