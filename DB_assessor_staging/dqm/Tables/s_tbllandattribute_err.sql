﻿CREATE TABLE [dqm].[s_tbllandattribute_err] (
    [COLUMN_NAME]         VARCHAR (100)   NOT NULL,
    [DQM_RULE]            VARCHAR (100)   NOT NULL,
    [ERROR_DESCRIPTION]   VARCHAR (100)   NOT NULL,
    [DQM_RUN_DATE]        DATE            NOT NULL,
    [VERSTART]            NUMERIC (11)    NULL,
    [VEREND]              NUMERIC (11)    NULL,
    [ACCOUNTNO]           VARCHAR (30)    NULL,
    [DETAILID]            NUMERIC (15)    NULL,
    [ATTRIBUTETYPE]       VARCHAR (30)    NULL,
    [ATTRIBUTESUBTYPE]    VARCHAR (50)    NULL,
    [ATTRIBUTEADJUSTMENT] NUMERIC (15, 6) NULL,
    [FILTERTYPE]          VARCHAR (15)    NULL,
    [LANDATTRIBUTEOT0]    VARCHAR (50)    NULL,
    [LANDATTRIBUTEOT1]    VARCHAR (50)    NULL,
    [LANDATTRIBUTEON0]    NUMERIC (20, 6) NULL,
    [LANDATTRIBUTEON1]    NUMERIC (20, 6) NULL,
    [LANDATTRIBUTEON2]    NUMERIC (20, 6) NULL,
    [LANDATTRIBUTEOD0]    VARCHAR (22)    NULL,
    [LANDATTRIBUTEOD1]    VARCHAR (22)    NULL,
    [LANDATTRIBUTEOM0]    VARCHAR (50)    NULL,
    [LANDATTRIBUTEOM1]    VARCHAR (50)    NULL,
    [JURISDICTIONID]      NUMERIC (15)    NULL,
    [WRITEDATE]           VARCHAR (22)    NULL,
    [SEQID]               NUMERIC (15)    NULL
);
