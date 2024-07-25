CREATE TABLE [dbo].[prsqlasr_improvement_fact_NOT_USED] (
    [ACCOUNT_NO]                   VARCHAR (30)    NULL,
    [BUILDING_ID]                  VARCHAR (5)     NULL,
    [IMPROVEMENT_EID]              NUMERIC (18)    NULL,
    [QUALITY_CODE]                 VARCHAR (50)    NULL,
    [CONDITION_CODE]               VARCHAR (50)    NULL,
    [PROPERTY_TYPE_CODE]           VARCHAR (50)    NULL,
    [IMPROVEMENT_SF]               NUMERIC (11)    NULL,
    [COMPLETION_PERCENT]           NUMERIC (7, 4)  NULL,
    [UNIT_TYPE]                    VARCHAR (50)    NULL,
    [NO_OF_FIREPLACE]              NUMERIC (15, 4) NULL,
    [TOTAL_GARAGE_SF]              NUMERIC (15, 4) NULL,
    [WALKOUT_BASEMENT_FLAG]        VARCHAR (1)     NULL,
    [TOTAL_PORCH_SF]               NUMERIC (15, 4) NULL,
    [TOTAL_FINISHED_BASEMENT_SF]   NUMERIC (15, 4) NULL,
    [TOTAL_UNFINISHED_BASEMENT_SF] NUMERIC (15, 4) NULL,
    [ROW_START_DTM]                DATETIME        NULL,
    [ROW_END_DTM]                  DATETIME        NULL,
    [ROW_CURRENT_FLAG]             VARCHAR (1)     NULL,
    [CREATE_DTM]                   DATETIME        NULL,
    [CREATE_USER_ID]               VARCHAR (30)    NULL,
    [UPDATE_DTM]                   DATETIME        NULL,
    [UPDATE_USER_ID]               VARCHAR (30)    NULL
);


GO
CREATE CLUSTERED INDEX [CI_account_bldg_id]
    ON [dbo].[prsqlasr_improvement_fact_NOT_USED]([ACCOUNT_NO] ASC, [BUILDING_ID] ASC);

