CREATE TABLE [dbo].[valuation_class_code] (
    [valuation_class_code] VARCHAR (50)    NULL,
    [code_descr]           VARCHAR (256)   NULL,
    [valuation_type_code]  VARCHAR (50)    NULL,
    [exempt_flag]          VARCHAR (1)     NULL,
    [assessment_ratio]     NUMERIC (15, 6) NULL,
    [row_current_flag]     VARCHAR (1)     NULL,
    [create_user_id]       VARCHAR (30)    CONSTRAINT [DF_valuation_class_code_create_user_id] DEFAULT ('SSIS_ETL') NULL,
    [create_dtm]           DATETIME        CONSTRAINT [DF_valuation_class_code] DEFAULT (getdate()) NULL,
    [update_user_id]       VARCHAR (30)    NULL,
    [update_dtm]           DATETIME        NULL
);

