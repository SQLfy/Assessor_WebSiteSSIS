CREATE TABLE [asr_datastore].[occupancy_code] (
    [occupancy_code] VARCHAR (50)  NULL,
    [code_descr]     VARCHAR (256) NULL,
    [create_dtm]     DATETIME      DEFAULT (getdate()) NULL,
    [create_user_id] VARCHAR (30)  DEFAULT ('SSIS_ETL') NULL,
    [update_dtm]     DATETIME      NULL,
    [update_user_id] VARCHAR (30)  NULL
);

