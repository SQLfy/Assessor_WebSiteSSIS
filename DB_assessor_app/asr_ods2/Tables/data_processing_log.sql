CREATE TABLE [asr_ods2].[data_processing_log] (
    [data_processing_log_id] INT           IDENTITY (1, 1) NOT NULL,
    [process_name]           VARCHAR (50)  NOT NULL,
    [process_start_time]     DATETIME2 (7) CONSTRAINT [df_process_start_time] DEFAULT (getdate()) NOT NULL,
    [process_end_time]       DATETIME2 (7) NULL,
    [process_status]         VARCHAR (50)  NOT NULL,
    CONSTRAINT [pk_data_processing_log] PRIMARY KEY CLUSTERED ([data_processing_log_id] ASC),
    CONSTRAINT [uk_data_processing_log] UNIQUE NONCLUSTERED ([process_name] ASC, [process_start_time] ASC)
);

