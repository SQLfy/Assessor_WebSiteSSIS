﻿CREATE TABLE [asr_app].[appeal_account] (
    [TAX_YEAR]                     NUMERIC (4)      NULL,
    [APPEAL_NO]                    NUMERIC (15)     NULL,
    [ACCOUNT_NO]                   VARCHAR (30)     NULL,
    [APPEAL_ADJUST_DENY_REASON_ID] NUMERIC (15)     NULL,
    [APPEAL_COMMENT]               VARCHAR (255)    NULL,
    [APPEAL_ACCOUNT_END_VALUE]     NUMERIC (15, 2)  NULL,
    [VALUE_GROUP_DESCRIPTION]      VARCHAR (50)     NULL,
    [APPEALACCTON0]                NUMERIC (20, 6)  NULL,
    [APPEALACCTON1]                NUMERIC (20, 6)  NULL,
    [APPEALACCTON2]                NUMERIC (20, 6)  NULL,
    [APPEALACCTOD0]                VARCHAR (22)     NULL,
    [APPEALACCTOD1]                VARCHAR (22)     NULL,
    [APPEALACCTOM0]                VARCHAR (50)     NULL,
    [APPEALACCTOM1]                VARCHAR (50)     NULL,
    [APPEALACCTOT0]                VARCHAR (50)     NULL,
    [APPEALACCTOT1]                VARCHAR (50)     NULL,
    [JURISDICTION_ID]              NUMERIC (15)     NULL,
    [WRITE_DATE]                   VARCHAR (22)     NULL,
    [BEGINNING_ACCOUNT_VALUE]      NUMERIC (15, 2)  NULL,
    [APPEAL_DECISION]              VARCHAR (30)     NULL,
    [APPEAL_ACCT_REASON_DESC]      VARCHAR (1000)   NULL,
    [ADD_BOARD_APPEAL_END_VALUE]   NUMERIC (15, 2)  NULL,
    [SEQ_ID]                       NUMERIC (15)     NULL,
    [CREATE_DATEIME]               DATETIME2 (7)    NOT NULL,
    [CREATE_USER_ID]               VARCHAR (60)     NOT NULL,
    [UPDATE_DATETIME]              DATETIME2 (7)    NULL,
    [UPDATE_USER_ID]               VARCHAR (60)     NULL,
    [ROWHASH]                      VARBINARY (8000) NULL
);

