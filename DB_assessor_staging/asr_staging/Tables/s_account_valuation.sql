CREATE TABLE [asr_staging].[s_account_valuation] (
    [ABSTCODE]           VARCHAR (10)    NOT NULL,
    [ACCOUNT_NO]         VARCHAR (30)    NOT NULL,
    [NEWGROWTHACTVAL]    NUMERIC (38, 2) NULL,
    [NEWGROWTHASSESSVAL] NUMERIC (38, 2) NULL,
    [NET_ACRES]          NUMERIC (38, 6) NULL,
    [NEW_GROWTH_FLAG]    VARCHAR (1)     NULL
);

