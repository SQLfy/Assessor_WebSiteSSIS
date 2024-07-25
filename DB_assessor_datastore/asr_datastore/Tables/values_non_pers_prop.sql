CREATE TABLE [asr_datastore].[values_non_pers_prop] (
    [seq_id]                                 NUMERIC (15)     NOT NULL,
    [version_start_date]                     NUMERIC (11)     NULL,
    [version_end_date]                       NUMERIC (11)     NULL,
    [account_no]                             VARCHAR (30)     NULL,
    [abstract_code]                          VARCHAR (10)     NULL,
    [tax_year]                               NUMERIC (4)      NULL,
    [actual_value]                           NUMERIC (15, 2)  NULL,
    [raw_assessed_value]                     NUMERIC (15, 2)  NULL,
    [new_construction_value_change]          NUMERIC (15, 2)  NULL,
    [new_construction_value_change_assessed] NUMERIC (15, 2)  NULL,
    [jurisdiction_id]                        NUMERIC (15)     NULL,
    [write_date]                             VARCHAR (22)     NULL,
    [create_datetime]                        DATETIME2 (7)    NOT NULL,
    [create_user_id]                         VARCHAR (60)     NOT NULL,
    [update_datetime]                        DATETIME2 (7)    NULL,
    [update_user_id]                         VARCHAR (60)     NULL,
    [rowhash]                                VARBINARY (8000) NULL,
    [abstract_code_description]              VARCHAR (100)    NULL,
    CONSTRAINT [pk_values_non_pers_prop] PRIMARY KEY CLUSTERED ([seq_id] ASC)
);

