﻿CREATE TABLE [asr_opendata].[platted_lot] (
    [PLATTED_LOT_EID]  INT          IDENTITY (1, 1) NOT NULL,
    [STATE_PARCEL_NO]  VARCHAR (30) NOT NULL,
    [LOT_NO]           VARCHAR (30) NULL,
    [BLOCK_NO]         VARCHAR (30) NULL,
    [TRACT_NO]         VARCHAR (30) NULL,
    [ROW_START_DTM]    DATETIME     DEFAULT (getdate()) NULL,
    [ROW_END_DTM]      DATETIME     NULL,
    [ROW_CURRENT_FLAG] VARCHAR (1)  DEFAULT ('Y') NULL,
    [CREATE_DTM]       DATETIME     NULL,
    [CREATE_USER_ID]   VARCHAR (30) NULL,
    [UPDATE_DTM]       DATETIME     NULL,
    [UPDATE_USER_ID]   VARCHAR (30) NULL,
    PRIMARY KEY CLUSTERED ([PLATTED_LOT_EID] ASC)
);

