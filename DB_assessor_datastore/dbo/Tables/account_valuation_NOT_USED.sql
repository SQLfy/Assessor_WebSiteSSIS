CREATE TABLE [dbo].[account_valuation_NOT_USED] (
    [ACCOUNT_VALUATION_EID] INT             IDENTITY (1, 1) NOT NULL,
    [VALUATION_CLASS_CODE]  VARCHAR (50)    NOT NULL,
    [ACCOUNT_NO]            VARCHAR (30)    NOT NULL,
    [ACTUAL_VALUE]          NUMERIC (15, 2) NULL,
    [ASSESSED_VALUE]        NUMERIC (15, 2) NULL,
    [NET_ACRES]             NUMERIC (15, 4) NULL,
    [NEW_GROWTH_FLAG]       VARCHAR (1)     NULL,
    [ROW_START_DTM]         DATETIME        CONSTRAINT [DF_account_valuation_ROW_START_DATE] DEFAULT (getdate()) NULL,
    [ROW_END_DTM]           DATETIME        NULL,
    [ROW_CURRENT_FLAG]      VARCHAR (1)     CONSTRAINT [DF_account_valuation_ROW_CURRENT_FLAG] DEFAULT ('Y') NULL,
    [CREATE_DTM]            DATETIME        CONSTRAINT [DF_account_valuation_ROW_CREATE_DTM] DEFAULT (getdate()) NULL,
    [CREATE_USER_ID]        VARCHAR (30)    CONSTRAINT [DF_account_valuation_CREATE_USER_ID] DEFAULT ('SSIS_ETL') NULL,
    [UPDATE_DTM]            DATETIME        NULL,
    [UPDATE_USER_ID]        VARCHAR (30)    NULL
);

