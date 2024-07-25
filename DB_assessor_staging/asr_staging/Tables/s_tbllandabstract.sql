﻿CREATE TABLE [asr_staging].[s_tbllandabstract] (
    [ACCOUNTNO]             VARCHAR (30)    NULL,
    [VERSTART]              NUMERIC (11)    NULL,
    [VEREND]                NUMERIC (11)    NULL,
    [LANDTYPE]              VARCHAR (15)    NULL,
    [ABSTRACTCODE]          VARCHAR (10)    NULL,
    [LANDACRES]             NUMERIC (20, 6) NULL,
    [LANDSF]                NUMERIC (20, 6) NULL,
    [LANDFF]                NUMERIC (20, 6) NULL,
    [LANDUNITCOUNT]         NUMERIC (20, 6) NULL,
    [LANDVALUEPER]          NUMERIC (15, 2) NULL,
    [LANDVALUE]             NUMERIC (15, 2) NULL,
    [LANDOVERRIDEFLAG]      NUMERIC (1)     NULL,
    [LANDOVERRIDETOTAL]     NUMERIC (15, 2) NULL,
    [LANDACTUALTOTAL]       NUMERIC (15, 2) NULL,
    [LANDCLASS]             VARCHAR (10)    NULL,
    [LANDSUBCLASS]          VARCHAR (10)    NULL,
    [LANDVALUEBY]           VARCHAR (20)    NULL,
    [LANDVALUEMEASURE]      VARCHAR (20)    NULL,
    [ABSTRACTINDATE]        VARCHAR (22)    NULL,
    [ABSTRACTOUTDATE]       VARCHAR (22)    NULL,
    [PRORATETYPE]           VARCHAR (10)    NULL,
    [LANDACTIVEFLAG]        NUMERIC (1)     NULL,
    [DETAILID]              NUMERIC (15)    NULL,
    [ABSTRACTADJCODE]       VARCHAR (5)     NULL,
    [LANDVALUEPERADJFACTOR] NUMERIC (15, 6) NULL,
    [ATTRIBUTEADJFLAG]      NUMERIC (1)     NULL,
    [LANDADJSIZE]           NUMERIC (20, 6) NULL,
    [LANDOVERRIDEADJSIZE]   NUMERIC (20, 6) NULL,
    [LANDABSTRACTON0]       NUMERIC (20, 6) NULL,
    [LANDABSTRACTON1]       NUMERIC (20, 6) NULL,
    [LANDABSTRACTON2]       NUMERIC (20, 6) NULL,
    [LANDOVERRIDEVALUEPER]  NUMERIC (15, 2) NULL,
    [TAXDISTRICT]           VARCHAR (10)    NULL,
    [LANDABSTRACTOD0]       VARCHAR (22)    NULL,
    [LANDABSTRACTOD1]       VARCHAR (22)    NULL,
    [LANDABSTRACTOM0]       VARCHAR (50)    NULL,
    [LANDABSTRACTOM1]       VARCHAR (50)    NULL,
    [LANDABSTRACTOT0]       VARCHAR (50)    NULL,
    [LANDABSTRACTOT1]       VARCHAR (50)    NULL,
    [JURISDICTIONID]        NUMERIC (15)    NULL,
    [WRITEDATE]             VARCHAR (22)    NULL,
    [MSALANDVALUE]          NUMERIC (15, 2) NULL,
    [MSALANDVALUEPER]       NUMERIC (15, 2) NULL,
    [LEA]                   VARCHAR (30)    NULL,
    [SEQID]                 NUMERIC (15)    NULL
);


GO
CREATE CLUSTERED INDEX [s_tbllandabstract_ClusteredIndex-accountno]
    ON [asr_staging].[s_tbllandabstract]([ACCOUNTNO] ASC);

