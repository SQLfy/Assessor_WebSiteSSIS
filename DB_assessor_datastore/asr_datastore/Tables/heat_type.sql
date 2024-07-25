CREATE TABLE [asr_datastore].[heat_type] (
    [heat_type]      VARCHAR (50)  NOT NULL,
    [code_descr]     VARCHAR (256) NOT NULL,
    [create_dtm]     DATETIME      DEFAULT (getdate()) NULL,
    [create_user_id] VARCHAR (30)  DEFAULT ('SSIS_ETL') NULL,
    [update_dtm]     DATETIME      NULL,
    [update_user_id] VARCHAR (30)  NULL
);

