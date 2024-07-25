CREATE TABLE [asr_datastore].[subdivision] (
    [subdivision_no]   VARCHAR (30)  NOT NULL,
    [subdivision_name] VARCHAR (256) NULL,
    [create_dtm]       DATETIME      DEFAULT (getdate()) NULL,
    [create_user_id]   VARCHAR (30)  DEFAULT ('SSIS_ETL') NULL,
    [update_dtm]       DATETIME      NULL,
    [update_user_id]   VARCHAR (30)  NULL
);

