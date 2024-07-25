CREATE TABLE [asr_opendata].[account_platted_lot] (
    [ACCOUNT_NO]              VARCHAR (30) NOT NULL,
    [SUB_FILING_RECORDING_NO] VARCHAR (30) NOT NULL,
    [PLATTED_LOT_EID]         INT          NOT NULL,
    [ROW_START_DTM]           DATETIME     CONSTRAINT [OD_account_platted_lot_ROW_START__DATE] DEFAULT (getdate()) NULL,
    [ROW_END_DTM]             DATETIME     NULL,
    [ROW_CURRENT_FLAG]        VARCHAR (1)  CONSTRAINT [OD_account_platted_lot__ROW_CURRENT_FLAG] DEFAULT ('Y') NULL,
    [CREATE_DTM]              DATETIME     CONSTRAINT [OD_account_platted_lot__ROW_CREATE_DTM] DEFAULT (getdate()) NULL,
    [CREATE_USER_ID]          VARCHAR (30) CONSTRAINT [OD_account_platted_lot_CREATE_USER_ID] DEFAULT ('Y') NULL,
    [UPDATE_DTM]              DATETIME     NULL,
    [UPDATE_USER_ID]          VARCHAR (30) NULL
);

