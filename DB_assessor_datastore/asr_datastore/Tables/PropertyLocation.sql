﻿CREATE TABLE [asr_datastore].[PropertyLocation] (
    [ID]                      INT             IDENTITY (1, 1) NOT NULL,
    [ACCOUNT_NO]              VARCHAR (30)    NULL,
    [ACCOUNT_TYPE_CODE]       VARCHAR (15)    NULL,
    [STATE_PARCEL_NO]         VARCHAR (30)    NULL,
    [ADDRESS_NUMBER]          VARCHAR (15)    NULL,
    [PRE_DIRECTION_CODE]      VARCHAR (2)     NULL,
    [STREET_NAME]             VARCHAR (50)    NULL,
    [STREET_TYPE_CODE]        VARCHAR (4)     NULL,
    [UNIT_NO]                 VARCHAR (6)     NULL,
    [LOCATION_ZIP_CODE]       VARCHAR (10)    NULL,
    [CITY_NAME]               VARCHAR (50)    NULL,
    [LEGAL_DESCR]             VARCHAR (MAX)   NULL,
    [SECTION]                 VARCHAR (15)    NULL,
    [TOWNSHIP]                VARCHAR (15)    NULL,
    [RANGE]                   VARCHAR (15)    NULL,
    [QUARTER]                 VARCHAR (15)    NULL,
    [LAND_ECONOMIC_AREA_CODE] VARCHAR (30)    NULL,
    [VACANT_FLAG]             VARCHAR (1)     NULL,
    [TOTAL_NET_ACRES]         NUMERIC (20, 6) NULL,
    [TAX_DISTRICT_NO]         VARCHAR (10)    NULL,
    [NEIGHBORHOOD_CODE]       VARCHAR (10)    NULL,
    [NEIGHBORHOOD_EXTENSION]  VARCHAR (10)    NULL,
    [Location]                NVARCHAR (32)   NULL,
    [create_dtm]              DATETIME        DEFAULT (getdate()) NULL,
    [create_user_id]          VARCHAR (30)    DEFAULT ('SSIS_ETL') NULL,
    [update_dtm]              DATETIME        NULL,
    [update_user_id]          VARCHAR (30)    NULL
);

