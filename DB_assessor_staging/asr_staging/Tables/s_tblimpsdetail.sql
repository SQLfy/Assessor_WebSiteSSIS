CREATE TABLE [asr_staging].[s_tblimpsdetail] (
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
    [IMPDETAILTYPEID]      NUMERIC (5)     NULL
);


GO
CREATE CLUSTERED INDEX [s_tblimpsdetail_ClusteredIndex-accountno_impno]
    ON [asr_staging].[s_tblimpsdetail]([ACCOUNTNO] ASC, [IMPNO] ASC);

