﻿CREATE TABLE [asr_staging].[s_tlkpabstractcode] (
    [ABSTRACTCODE]                VARCHAR (10)  NULL,
    [ABSTRACTDESCRIPTION]         VARCHAR (500) NULL,
    [EQUIVALENCEABSTRACTCODE]     VARCHAR (10)  NULL,
    [ROLLABSTRACTVALUEFLAG]       NUMERIC (1)   NULL,
    [VALUEGROUPCODE]              NUMERIC (15)  NULL,
    [ACTUALPRECISION]             NUMERIC (11)  NULL,
    [ACTUALMINIMUMVALUE]          NUMERIC (11)  NULL,
    [ASSESSEDPRECISION]           NUMERIC (11)  NULL,
    [ASSESSEDMINIMUMVALUE]        NUMERIC (11)  NULL,
    [ACTUALROUNDTYPE]             VARCHAR (10)  NULL,
    [ASSESSEDROUNDTYPE]           VARCHAR (10)  NULL,
    [USEVALUEFLAG]                NUMERIC (1)   NULL,
    [ADJACTUALPRECISION]          NUMERIC (11)  NULL,
    [ADJACTUALMINIMUMVALUE]       NUMERIC (11)  NULL,
    [ADJACTUALROUNDTYPE]          VARCHAR (10)  NULL,
    [ADJASSESSEDPRECISION]        NUMERIC (11)  NULL,
    [ADJASSESSEDMINIMUMVALUE]     NUMERIC (11)  NULL,
    [ADJASSESSEDROUNDTYPE]        VARCHAR (10)  NULL,
    [ADJALTACTUALPRECISION]       NUMERIC (11)  NULL,
    [ADJALTACTUALMINVALUE]        NUMERIC (11)  NULL,
    [ADJALTACTUALROUNDTYPE]       VARCHAR (10)  NULL,
    [ADJALTASSESSEDPRECISION]     NUMERIC (11)  NULL,
    [ADJALTASSESSEDMINVALUE]      NUMERIC (11)  NULL,
    [ADJALTASSESSEDDROUNDTYPE]    VARCHAR (10)  NULL,
    [ALTASSESSEDPRECISION]        NUMERIC (11)  NULL,
    [ALTASSESSEDMINIMUMVALUE]     NUMERIC (11)  NULL,
    [ALTASSESSEDROUNDTYPE]        VARCHAR (10)  NULL,
    [SHOWADMINFLAG]               NUMERIC (1)   NULL,
    [CLASSIFICATIONID]            VARCHAR (2)   NULL,
    [LOCALGROWTHEXEMPTFLAG]       NUMERIC (1)   NULL,
    [EXPORTCNTGROUPEXCLUSIONFLAG] NUMERIC (1)   NULL,
    [SORTORDER]                   NUMERIC (9)   NULL,
    [ACTIVEFLAG]                  NUMERIC (1)   NULL,
    [LIMITTOABSTTYPE]             VARCHAR (1)   NULL,
    [JURISDICTIONID]              NUMERIC (15)  NULL,
    [LASTUPDATED]                 VARCHAR (22)  NULL,
    [ABSTRACTCATEGORYCODE]        VARCHAR (10)  NULL
);

