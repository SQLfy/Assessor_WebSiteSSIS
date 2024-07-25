CREATE TABLE [asr_app].[value_from_tsgvacctabstvalue_BKUP] (
    [account_no]                       VARCHAR (30)    NOT NULL,
    [tax_year]                         NUMERIC (4)     NOT NULL,
    [valuation_class_code]             VARCHAR (50)    NOT NULL,
    [tax_district_no]                  VARCHAR (30)    NOT NULL,
    [raw_assessed_value]               NUMERIC (15, 2) NULL,
    [raw_tax_dollars]                  NUMERIC (15, 2) NULL,
    [actual_value]                     NUMERIC (15, 2) NULL,
    [mill_levy]                        NUMERIC (11, 6) NULL,
    [create_datetime]                  DATETIME2 (7)   NOT NULL,
    [create_user_id]                   VARCHAR (60)    NOT NULL,
    [account_type]                     VARCHAR (30)    NULL,
    [net_acres]                        NUMERIC (15, 4) NULL,
    [valuation_class_code_description] VARCHAR (100)   NULL
);

