CREATE TABLE [dqm].[assessor_unit_test_result] (
    [table_name]        NVARCHAR (100) NULL,
    [table_count]       INT            NULL,
    [error_table_count] INT            NULL,
    [unit_test_result]  NVARCHAR (50)  NULL,
    [run_date]          DATETIME       NULL,
    [notes]             VARCHAR (250)  NULL
);

