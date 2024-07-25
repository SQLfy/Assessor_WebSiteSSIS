CREATE TABLE [asr_app].[improvement_fact_new] (
    [ACCOUNT_NO]                   VARCHAR (30)    NULL,
    [IMPROVEMENT_SF]               NUMERIC (11)    NULL,
    [NO_OF_FIREPLACE]              NUMERIC (15, 4) NULL,
    [TOTAL_GARAGE_SF]              NUMERIC (15, 4) NULL,
    [WALKOUT_BASEMENT_FLAG]        VARCHAR (1)     NULL,
    [TOTAL_PORCH_SF]               NUMERIC (15, 4) NULL,
    [TOTAL_FINISHED_BASEMENT_SF]   NUMERIC (15, 4) NULL,
    [TOTAL_UNFINISHED_BASEMENT_SF] NUMERIC (15, 4) NULL,
    [IMPROVEMENT_NO]               NUMERIC (5)     NULL,
    [IMPROVEMENT_DETAIL_ID]        VARCHAR (60)    NULL,
    [PROPERTY_TYPE]                VARCHAR (50)    NULL,
    [CONDITION_TYPE]               VARCHAR (50)    NULL,
    [IMPROVEMENT_QUALITY]          VARCHAR (50)    NULL,
    [COMPLETED_PERCENT]            NUMERIC (7, 4)  NULL,
    [IMPROVEMENT_UNIT_TYPE]        VARCHAR (30)    NULL
);

