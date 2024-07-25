CREATE TABLE [asr_datastore].[land] (
    [state_parcel_no] VARCHAR (30) NOT NULL,
    [assessment_year] VARCHAR (4)  NOT NULL,
    [vacant_flag]     VARCHAR (1)  NULL,
    [create_dtm]      DATETIME     DEFAULT (getdate()) NULL,
    [create_user_id]  VARCHAR (30) DEFAULT ('SSIS_ETL') NULL,
    [update_dtm]      DATETIME     NULL,
    [update_user_id]  VARCHAR (30) NULL
);

