CREATE TABLE [asr_staging].[s_tblacctppdetail] (
    [VERSTART]                 NUMERIC (11)    NULL,
    [VEREND]                   NUMERIC (11)    NULL,
    [ACCOUNTNO]                VARCHAR (30)    NULL,
    [DETAILID]                 NUMERIC (15)    NULL,
    [PPRECORDNO]               NUMERIC (15, 2) NULL,
    [ABSTRACTCODE]             VARCHAR (10)    NULL,
    [ABSTRACTADJCODE]          VARCHAR (5)     NULL,
    [TAXDISTRICT]              VARCHAR (10)    NULL,
    [PPOGTYPE]                 VARCHAR (4)     NULL,
    [PPOGDESCRIPTIONTYPEID]    NUMERIC (4)     NULL,
    [ACQUISITIONYEAR]          NUMERIC (4)     NULL,
    [PPAGE]                    NUMERIC (5, 2)  NULL,
    [PPQUANTITY]               NUMERIC (15)    NULL,
    [TYPEFACTOR]               NUMERIC (15, 4) NULL,
    [ORIGINALCOST]             NUMERIC (15, 2) NULL,
    [PPMETHODCODE]             INT             NULL,
    [PPLIFEEXPECTANCY]         NUMERIC (5, 2)  NULL,
    [PPCONDITIONCODE]          VARCHAR (2)     NULL,
    [PPGOODPERCENT]            NUMERIC (15, 4) NULL,
    [PERCENTADDEDDEPRECIATION] NUMERIC (15, 4) NULL,
    [ROLLBACKFACTOR]           NUMERIC (15, 4) NULL,
    [PPABSTRACTVALUE]          NUMERIC (15, 2) NULL,
    [BESTINFOAVAILABLEFLAG]    NUMERIC (1)     NULL,
    [OMITTEDFLAG]              NUMERIC (1)     NULL,
    [DEPRECIATIONVALUE]        NUMERIC (15, 2) NULL,
    [REPORTEDACQUIREDYEAR]     NUMERIC (4)     NULL,
    [REPORTEDACQUIREDCOST]     NUMERIC (15, 2) NULL,
    [PPREPORTEDRECORDNO]       VARCHAR (30)    NULL,
    [PPMAKE]                   VARCHAR (25)    NULL,
    [PPMODEL]                  VARCHAR (25)    NULL,
    [PPLEASETERM]              VARCHAR (20)    NULL,
    [PPMONTHLYRENT]            NUMERIC (8, 2)  NULL,
    [PPLESSORCODE]             NUMERIC (15)    NULL,
    [PPDETAILDESCRIPTION]      VARCHAR (200)   NULL,
    [JURISDICTIONID]           NUMERIC (15)    NULL,
    [WRITEDATE]                VARCHAR (22)    NULL,
    [APPRAISALTYPE]            VARCHAR (30)    NULL,
    [SEQID]                    NUMERIC (15)    NULL
);


GO
CREATE CLUSTERED INDEX [idx_tblacctppdetail_acctno]
    ON [asr_staging].[s_tblacctppdetail]([ACCOUNTNO] ASC);

