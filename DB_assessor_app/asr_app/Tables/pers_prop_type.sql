﻿CREATE TABLE [asr_app].[pers_prop_type] (
    [PERS_PROP_TYPE]   VARCHAR (50)  NOT NULL,
    [CODE_DESCR]       VARCHAR (256) NOT NULL,
    [ROW_START_DTM]    DATETIME      CONSTRAINT [DF_pers_prop_type_ROW_START_DATE] DEFAULT (getdate()) NULL,
    [ROW_END_DTM]      DATETIME      NULL,
    [ROW_CURRENT_FLAG] VARCHAR (1)   CONSTRAINT [DF_pers_prop_type_ROW_CURRENT_FLAG] DEFAULT ('Y') NULL,
    [CREATE_DTM]       DATETIME      CONSTRAINT [DF_pers_prop_type_ROW_CREATE_DTM] DEFAULT (getdate()) NULL,
    [CREATE_USER_ID]   VARCHAR (30)  CONSTRAINT [DF_pers_prop_type_CREATE_USER_ID] DEFAULT ('SSIS_ETL') NULL,
    [UPDATE_DTM]       DATETIME      NULL,
    [UPDATE_USER_ID]   VARCHAR (30)  NULL
);

