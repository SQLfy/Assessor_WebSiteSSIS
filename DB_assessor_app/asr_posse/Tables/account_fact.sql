﻿CREATE TABLE [asr_posse].[account_fact] (
    [ACCOUNT_NO]              VARCHAR (30)    NOT NULL,
    [STATE_PARCEL_NO]         VARCHAR (30)    NULL,
    [ACCOUNT_SUBTYPE_CODE]    VARCHAR (30)    NULL,
    [TAX_DISTRICT_NO]         VARCHAR (30)    NULL,
    [LAND_ECONOMIC_AREA_CODE] VARCHAR (30)    NULL,
    [ACCOUNT_TYPE_CODE]       VARCHAR (50)    NULL,
    [SUB_FILING_RECORDING_NO] VARCHAR (30)    NULL,
    [OWNER_NAME]              VARCHAR (256)   NULL,
    [MAILING_ADDRESS_LINE_1]  VARCHAR (80)    NULL,
    [MAILING_ADDRESS_LINE_2]  VARCHAR (80)    NULL,
    [MAILING_ADDRESS_LINE_3]  VARCHAR (80)    NULL,
    [MAILING_CITY_NAME]       VARCHAR (80)    NULL,
    [MAILING_STATE]           VARCHAR (80)    NULL,
    [MAILING_ZIP_CODE]        VARCHAR (30)    NULL,
    [MAILING_COUNTRY]         VARCHAR (80)    NULL,
    [UNIT_NO]                 VARCHAR (30)    NULL,
    [UNIT_DESIGNATOR]         VARCHAR (30)    NULL,
    [ADDRESS_NUMBER]          VARCHAR (10)    NULL,
    [ADDRESS_NUMBER_SUFFIX]   VARCHAR (30)    NULL,
    [PRE_DIRECTION_CODE]      VARCHAR (50)    NULL,
    [STREET_NAME]             VARCHAR (80)    NULL,
    [STREET_TYPE_CODE]        VARCHAR (30)    NULL,
    [POST_DIRECTION_CODE]     VARCHAR (50)    NULL,
    [CITY_NAME]               VARCHAR (50)    NULL,
    [LOCATION_STATE_CODE]     VARCHAR (50)    CONSTRAINT [DF_account_fact_LOC_STATE_CODE] DEFAULT ('CO') NULL,
    [LOCATION_ZIP_CODE]       VARCHAR (10)    NULL,
    [TOTAL_ACTUAL_VALUE]      NUMERIC (15, 2) NULL,
    [TOTAL_ASSESSED_VALUE]    NUMERIC (15, 2) NULL,
    [TOTAL_NET_ACRES]         NUMERIC (15, 4) NULL,
    [ACCOUNT_STATUS_CODE]     VARCHAR (50)    NULL,
    [FEDERAL_ID_NO]           VARCHAR (30)    NULL,
    [ROW_START_DTM]           DATETIME        CONSTRAINT [DF_account_fact_ROW_START_DATE] DEFAULT (getdate()) NULL,
    [ROW_END_DTM]             DATETIME        NULL,
    [ROW_CURRENT_FLAG]        VARCHAR (1)     CONSTRAINT [DF_account_fact_ROW_CURRENT_FLAG] DEFAULT ('Y') NULL,
    [CREATE_DTM]              DATETIME        CONSTRAINT [DF_account_fact_ROW_CREATE_DTM] DEFAULT (getdate()) NULL,
    [CREATE_USER_ID]          VARCHAR (30)    CONSTRAINT [DF_account_fact_CREATE_USER_ID] DEFAULT ('SSIS_ETL') NULL,
    [UPDATE_DTM]              DATETIME        NULL,
    [UPDATE_USER_ID]          VARCHAR (30)    NULL,
    [LEGAL_DESCR]             VARCHAR (2000)  NULL,
    [REDUCED_MILL_LEVY]       NUMERIC (15, 6) NULL,
    [REDUCED_TAX_RATE]        NUMERIC (15, 6) NULL,
    CONSTRAINT [PK_account_fact_accountno] PRIMARY KEY CLUSTERED ([ACCOUNT_NO] ASC)
);

