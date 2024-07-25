CREATE TABLE [asr_datastore].[pers_prop_detail] (
    [PERS_PROP_DETAIL_EID] INT             IDENTITY (1, 1) NOT NULL,
    [ACCOUNT_NO]           VARCHAR (30)    NOT NULL,
    [DETAIL_ID]            VARCHAR (30)    NOT NULL,
    [PERS_PROP_TYPE]       VARCHAR (50)    NULL,
    [ASSET_TYPE_CODE]      VARCHAR (50)    NULL,
    [ASSET_CONDITION_CODE] VARCHAR (50)    NULL,
    [ACQUIRED_YEAR]        VARCHAR (4)     NULL,
    [QUANTITY]             NUMERIC (6)     NULL,
    [ORIGINAL_COST]        NUMERIC (15, 2) NULL,
    [ASSET_DETAIL_DESCR]   VARCHAR (256)   NULL,
    [ROW_START_DTM]        DATETIME        CONSTRAINT [DF_pers_prop_detail_ROW_START_DATE] DEFAULT (getdate()) NULL,
    [ROW_END_DTM]          DATETIME        NULL,
    [ROW_CURRENT_FLAG]     VARCHAR (1)     CONSTRAINT [DF_pers_prop_detail_ROW_CURRENT_FLAG] DEFAULT ('Y') NULL,
    [CREATE_DTM]           DATETIME        CONSTRAINT [DF_pers_prop_detail_ROW_CREATE_DTM] DEFAULT (getdate()) NULL,
    [CREATE_USER_ID]       VARCHAR (30)    CONSTRAINT [DF_pers_prop_detail_CREATE_USER_ID] DEFAULT ('SSIS_ETL') NULL,
    [UPDATE_DTM]           DATETIME        NULL,
    [UPDATE_USER_ID]       VARCHAR (30)    NULL,
    CONSTRAINT [PK_pers_prop_detail] PRIMARY KEY CLUSTERED ([PERS_PROP_DETAIL_EID] ASC)
);

