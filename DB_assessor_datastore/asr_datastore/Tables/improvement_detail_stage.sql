CREATE TABLE [asr_datastore].[improvement_detail_stage] (
    [account_no]              VARCHAR (30)    NOT NULL,
    [improvement_no]          INT             NOT NULL,
    [improvement_id]          INT             NULL,
    [fire_places_count]       INT             NULL,
    [garage_sf]               NUMERIC (15, 4) NULL,
    [is_walkout_basement]     VARCHAR (5)     NULL,
    [finished_basement_sf]    NUMERIC (15, 4) NULL,
    [unfinished_basement_sf]  NUMERIC (15, 4) NULL,
    [finished_basement_pct]   NUMERIC (7, 4)  NULL,
    [unfinished_basement_pct] NUMERIC (7, 4)  NULL,
    [total_porch_sf]          NUMERIC (15, 4) NULL,
    [created_date]            DATETIME        NOT NULL,
    [created_user]            VARCHAR (30)    NOT NULL,
    [updated_date]            DATETIME        NOT NULL,
    [updated_user]            VARCHAR (30)    NOT NULL
);

