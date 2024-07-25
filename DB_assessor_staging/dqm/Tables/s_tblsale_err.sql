CREATE TABLE [dqm].[s_tblsale_err] (
    [COLUMN_NAME]       VARCHAR (100)   NOT NULL,
    [DQM_RULE]          VARCHAR (100)   NOT NULL,
    [ERROR_DESCRIPTION] VARCHAR (100)   NOT NULL,
    [DQM_RUN_DATE]      DATE            NOT NULL,
    [VERSTART]          NUMERIC (11)    NULL,
    [VEREND]            NUMERIC (11)    NULL,
    [RECEPTIONNO]       VARCHAR (30)    NULL,
    [BOOK]              VARCHAR (6)     NULL,
    [PAGE]              VARCHAR (10)    NULL,
    [GRANTOR]           VARCHAR (80)    NULL,
    [GRANTEE]           VARCHAR (80)    NULL,
    [DOCUMENTDATE]      VARCHAR (22)    NULL,
    [SALEDATE]          VARCHAR (22)    NULL,
    [DEEDCODE]          VARCHAR (10)    NULL,
    [SALEPRICE]         NUMERIC (15, 2) NULL,
    [PPADJAMOUNT]       NUMERIC (15, 2) NULL,
    [GOODWILLADJAMOUNT] NUMERIC (15, 2) NULL,
    [OTHERADJAMOUNT]    NUMERIC (15, 2) NULL,
    [TIMEADJ]           NUMERIC (15, 4) NULL,
    [NONSALEFLAG]       NUMERIC (1)     NULL,
    [JURISDICTIONID]    NUMERIC (15)    NULL,
    [WRITEDATE]         VARCHAR (22)    NULL,
    [SEQID]             NUMERIC (15)    NULL,
    [ETL_RUN_TIME]      DATETIME2 (7)   DEFAULT (getdate()) NULL
);


GO
CREATE CLUSTERED INDEX [s_tblsale_err_ClusteredIndex-receptionno]
    ON [dqm].[s_tblsale_err]([RECEPTIONNO] ASC);

