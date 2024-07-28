﻿CREATE TABLE [asr_datastore].[property_sale] (
    [ACCOUNT_NO]                   VARCHAR (30)    NULL,
    [RECORDING_NO]                 VARCHAR (20)    NULL,
    [ACCOUNT_TYPE_CODE]            VARCHAR (50)    NULL,
    [SUBDIVISION_NO]               VARCHAR (30)    NULL,
    [SUB_FILING_RECORDING_NO]      VARCHAR (30)    NULL,
    [LOT_NO]                       VARCHAR (30)    NULL,
    [BLOCK_NO]                     VARCHAR (30)    NULL,
    [PROPERTY_TYPE_CODE]           VARCHAR (50)    NULL,
    [QUALITY_CODE]                 VARCHAR (50)    NULL,
    [BUILT_YEAR]                   VARCHAR (15)    NULL,
    [BASEMENT_UNFINISHED_SF]       NUMERIC (8, 2)  NULL,
    [BASEMENT_FINISHED_SF]         NUMERIC (8, 2)  NULL,
    [WALKOUT_BASEMENT_FLAG]        VARCHAR (1)     NULL,
    [GARAGE_SF]                    NUMERIC (8, 2)  NULL,
    [NET_ACRES]                    NUMERIC (15, 4) NULL,
    [OCCUPANCY_CODE]               VARCHAR (50)    NULL,
    [HEAT_TYPE]                    VARCHAR (50)    NULL,
    [BUILT_AS_CODE]                VARCHAR (50)    NULL,
    [NO_OF_BEDROOM]                INT             NULL,
    [NO_OF_BATHROOM]               NUMERIC (7, 2)  NULL,
    [UNIT_TYPE]                    VARCHAR (50)    NULL,
    [ROW_START_DTM]                DATETIME        CONSTRAINT [DF_property_sale_ROW_START_DATE] DEFAULT (getdate()) NULL,
    [ROW_END_DTM]                  DATETIME        NULL,
    [ROW_CURRENT_FLAG]             VARCHAR (1)     CONSTRAINT [DF_property_sale_ROW_CURRENT_FLAG] DEFAULT ('Y') NULL,
    [CREATE_DTM]                   DATETIME        CONSTRAINT [DF_property_sale_ROW_CREATE_DTM] DEFAULT (getdate()) NULL,
    [CREATE_USER_ID]               VARCHAR (30)    CONSTRAINT [DF_property_sale_CREATE_USER_ID] DEFAULT ('SSIS_ETL') NULL,
    [UPDATE_DTM]                   DATETIME        NULL,
    [UPDATE_USER_ID]               VARCHAR (30)    NULL,
    [TOTAL_IMP_SF]                 NUMERIC (11)    NULL,
    [DISTRESSED_SALE_FLAG]         VARCHAR (1)     NULL,
    [LAND_VALUATION_CLASS_CODE]    VARCHAR (50)    NULL,
    [LAND_ECONOMIC_AREA_CODE]      VARCHAR (50)    NULL,
    [NEIGHBORHOOD_CODE]            VARCHAR (50)    NULL,
    [NEIGHBORHOOD_EXTENSION]       VARCHAR (50)    NULL,
    [NO_OF_BUILDING]               INT             NULL,
    [VALID_ARMS_LENGTH_TRANS_FLAG] VARCHAR (1)     NULL
);
