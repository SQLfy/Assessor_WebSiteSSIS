﻿CREATE TABLE [asr_staging].[s_tblacctpp] (
    [VERSTART]                   NUMERIC (11)    NULL,
    [VEREND]                     NUMERIC (11)    NULL,
    [ACCOUNTNO]                  VARCHAR (30)    NULL,
    [PPCERTIFICATIONCODE]        VARCHAR (25)    NULL,
    [PPCERTIFICATIONDATE]        VARCHAR (22)    NULL,
    [JURISDICTIONAUDITDATE]      VARCHAR (22)    NULL,
    [NOVSENTDATE]                VARCHAR (22)    NULL,
    [ASSOCIATEDREALSF]           NUMERIC (15, 2) NULL,
    [PPAUDITEDBY]                VARCHAR (30)    NULL,
    [PPDECLARATIONSENTDATE]      VARCHAR (22)    NULL,
    [PPDECLARATIONRETURNDATE]    VARCHAR (22)    NULL,
    [ASSOCIATEDREALUNITCOUNT]    NUMERIC (15)    NULL,
    [LATEDECLARATIONFLAG]        NUMERIC (1)     NULL,
    [PRECOLLECTDATE]             VARCHAR (22)    NULL,
    [LETTERSENTFLAG]             NUMERIC (1)     NULL,
    [PPAPPRAISER]                VARCHAR (30)    NULL,
    [PPAPPRASALDATE]             VARCHAR (22)    NULL,
    [CROPTYPE]                   VARCHAR (30)    NULL,
    [ACRESUSED]                  NUMERIC (15, 2) NULL,
    [FARMSERVICEAGENCYFLAG]      NUMERIC (1)     NULL,
    [FARMSERVICEAGENCYNO]        VARCHAR (30)    NULL,
    [NOCHANGEFLAG]               NUMERIC (1)     NULL,
    [AUDITDATE]                  VARCHAR (22)    NULL,
    [NODECLARATIONFLAG]          NUMERIC (1)     NULL,
    [BESTINFOAVAILABLEFLAG]      NUMERIC (1)     NULL,
    [PPCITYCODE]                 VARCHAR (3)     NULL,
    [ATTACHMENTCOUNT]            NUMERIC (2)     NULL,
    [SPECIALDISTRICT1]           VARCHAR (2)     NULL,
    [SPECIALDISTRICT2]           VARCHAR (2)     NULL,
    [AREACODEID]                 VARCHAR (3)     NULL,
    [DESKAUDITBY]                VARCHAR (30)    NULL,
    [PPUNITTYPE]                 VARCHAR (4)     NULL,
    [APPRAISEDVALUEPERUNIT]      NUMERIC (15, 2) NULL,
    [UNITNUMBER]                 NUMERIC (4)     NULL,
    [SMALLACCTCERTIFICATIONFLAG] NUMERIC (1)     NULL,
    [STATESALESTAXID]            VARCHAR (14)    NULL,
    [FEDERALID]                  VARCHAR (9)     NULL,
    [ACCTPPON0]                  NUMERIC (20, 6) NULL,
    [ACCTPPON1]                  NUMERIC (20, 6) NULL,
    [ACCTPPON2]                  NUMERIC (20, 6) NULL,
    [ELECTRONICFILEFLAG]         NUMERIC (1)     NULL,
    [ACCTPPOD0]                  VARCHAR (22)    NULL,
    [ACCTPPOD1]                  VARCHAR (22)    NULL,
    [ACCTPPOM0]                  VARCHAR (50)    NULL,
    [ACCTPPOM1]                  VARCHAR (50)    NULL,
    [ACCTPPOT0]                  VARCHAR (50)    NULL,
    [ACCTPPOT1]                  VARCHAR (50)    NULL,
    [BUSINESSCODE]               VARCHAR (10)    NULL,
    [JURISDICTIONID]             NUMERIC (15)    NULL,
    [WRITEDATE]                  VARCHAR (22)    NULL,
    [SEQID]                      NUMERIC (15)    NULL,
    [ONLINEFILINGOPTOUTFLAG]     NUMERIC (1)     NULL
);
