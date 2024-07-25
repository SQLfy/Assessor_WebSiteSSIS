CREATE TABLE [asr_staging].[s_tblsaleacct] (
    [VERSTART]               NUMERIC (11)    NULL,
    [VEREND]                 NUMERIC (11)    NULL,
    [RECEPTIONNO]            VARCHAR (30)    NULL,
    [ACCOUNTNO]              VARCHAR (30)    NULL,
    [INVENTORYEFFECTIVEDATE] VARCHAR (22)    NULL,
    [ACCTADJSALEPRICE]       NUMERIC (15, 2) NULL,
    [GROUPPRIMARYACCTFLAG]   NUMERIC (1)     NULL,
    [SALEACCTON0]            NUMERIC (20, 6) NULL,
    [SALEACCTON1]            NUMERIC (20, 6) NULL,
    [SALEACCTON2]            NUMERIC (20, 6) NULL,
    [SALEACCTOD0]            VARCHAR (22)    NULL,
    [SALEACCTOD1]            VARCHAR (22)    NULL,
    [SALEACCTOM0]            VARCHAR (50)    NULL,
    [SALEACCTOM1]            VARCHAR (50)    NULL,
    [SALEACCTOT0]            VARCHAR (50)    NULL,
    [SALEACCTOT1]            VARCHAR (50)    NULL,
    [JURISDICTIONID]         NUMERIC (15)    NULL,
    [WRITEDATE]              VARCHAR (22)    NULL,
    [SALEACCTPENALTYDATE]    VARCHAR (22)    NULL,
    [SALEACCTPENALTYFLAG]    NUMERIC (1)     NULL,
    [SEQID]                  NUMERIC (15)    NULL
);


GO
CREATE CLUSTERED INDEX [s_tblsaleacct_ClusteredIndex-receptionno]
    ON [asr_staging].[s_tblsaleacct]([RECEPTIONNO] ASC);

