CREATE TABLE [asr_staging].[s_tblimpsbltas] (
    [DETAILID]            NUMERIC (15)    NULL,
    [VERSTART]            NUMERIC (11)    NULL,
    [VEREND]              NUMERIC (11)    NULL,
    [ACCOUNTNO]           VARCHAR (30)    NULL,
    [IMPNO]               NUMERIC (7, 2)  NULL,
    [BLTASCODE]           NUMERIC (15)    NULL,
    [HVACPERCENT]         NUMERIC (15, 4) NULL,
    [CLIMATE]             VARCHAR (15)    NULL,
    [IMPEXTERIOR]         VARCHAR (50)    NULL,
    [IMPINTERIOR]         VARCHAR (30)    NULL,
    [BLTASSTORIES]        NUMERIC (15, 2) NULL,
    [BLTASSTORYHEIGHT]    NUMERIC (15)    NULL,
    [ROOFTYPE]            VARCHAR (30)    NULL,
    [ROOFCOVER]           VARCHAR (30)    NULL,
    [FLOORCOVER]          VARCHAR (30)    NULL,
    [BLTASFOUNDATION]     VARCHAR (30)    NULL,
    [ROOMCOUNT]           NUMERIC (7)     NULL,
    [BEDROOMCOUNT]        NUMERIC (7, 2)  NULL,
    [BLTASTOTALUNITCOUNT] NUMERIC (15)    NULL,
    [IMPBLTASOTHER]       NUMERIC (15)    NULL,
    [CLASSCODE]           VARCHAR (10)    NULL,
    [DIAMETER]            NUMERIC (15)    NULL,
    [CAPACITY]            NUMERIC (15)    NULL,
    [BLTASHORSEPOWER]     NUMERIC (15)    NULL,
    [BLTASHEIGHT]         NUMERIC (15)    NULL,
    [BLTASYEARBUILT]      NUMERIC (4)     NULL,
    [YEARREMODELED]       NUMERIC (4)     NULL,
    [REMODELEDPERCENT]    NUMERIC (15, 4) NULL,
    [EFFECTIVEAGE]        NUMERIC (5)     NULL,
    [BLTASLENGTH]         NUMERIC (15)    NULL,
    [BLTASWIDTH]          NUMERIC (15)    NULL,
    [MHTAGLENGTH]         NUMERIC (15)    NULL,
    [MHTAGWIDTH]          NUMERIC (15)    NULL,
    [MHSKIRT]             VARCHAR (30)    NULL,
    [MHSKIRTLINEARFEET]   NUMERIC (15)    NULL,
    [MHWALLTYPE]          VARCHAR (32)    NULL,
    [BLTASSF]             NUMERIC (15)    NULL,
    [SPRINKLERSF]         NUMERIC (15)    NULL,
    [BATHCOUNT]           NUMERIC (7, 2)  NULL,
    [PRIMARYBLTASORDERNO] NUMERIC (5)     NULL,
    [JURISDICTIONID]      NUMERIC (15)    NULL,
    [HVACTYPE]            VARCHAR (30)    NULL,
    [IMPSBLTASOT0]        VARCHAR (50)    NULL,
    [IMPSBLTASOT1]        VARCHAR (50)    NULL,
    [IMPSBLTASOM0]        VARCHAR (50)    NULL,
    [IMPSBLTASOM1]        VARCHAR (50)    NULL,
    [IMPSBLTASOD0]        VARCHAR (22)    NULL,
    [IMPSBLTASOD1]        VARCHAR (22)    NULL,
    [IMPSBLTASON0]        NUMERIC (20, 6) NULL,
    [IMPSBLTASON1]        NUMERIC (20, 6) NULL,
    [IMPSBLTASON2]        NUMERIC (20, 6) NULL,
    [WRITEDATE]           VARCHAR (22)    NULL,
    [MHDEPRCODE]          VARCHAR (10)    NULL,
    [MHMAKE]              VARCHAR (50)    NULL,
    [MHMODELNAME]         VARCHAR (30)    NULL,
    [SEQID]               NUMERIC (15)    NULL,
    [APEXID]              NUMERIC (15)    NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_ACCOUNTNO]
    ON [asr_staging].[s_tblimpsbltas]([ACCOUNTNO] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_IMPNO]
    ON [asr_staging].[s_tblimpsbltas]([IMPNO] ASC);

