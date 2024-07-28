﻿CREATE TABLE [asr_staging].[etl_parameter_testing] (
    [PARAMETER_NAME]  VARCHAR (50)   NOT NULL,
    [PARAMETER_VALUE] VARCHAR (100)  NULL,
    [PARAMETER_DESCR] VARCHAR (1000) NULL,
    [CREATE_DTM]      DATETIME2 (7)  NULL,
    [CREATE_USER_ID]  VARCHAR (30)   NULL,
    [UPDATE_DTM]      DATETIME2 (7)  NULL,
    [UPDATE_USER_ID]  VARCHAR (30)   NULL
);
