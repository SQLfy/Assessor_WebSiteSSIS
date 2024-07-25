CREATE TABLE [asr_datastore].[improvement_occupancy_test] (
    [account_no]                 VARCHAR (30)     NOT NULL,
    [improvement_no]             NUMERIC (5)      NOT NULL,
    [occupancy_detail_id]        NUMERIC (15)     NOT NULL,
    [occupancy_code]             VARCHAR (50)     NOT NULL,
    [occupancy_code_description] VARCHAR (100)    NULL,
    [occupancy_percent]          NUMERIC (7, 4)   NOT NULL,
    [abstract_code]              VARCHAR (50)     NULL,
    [abstract_code_description]  VARCHAR (100)    NULL,
    [abstract_value]             NUMERIC (15, 2)  NULL,
    [create_datetime]            DATETIME2 (7)    NOT NULL,
    [create_user_id]             VARCHAR (60)     NOT NULL,
    [update_datetime]            DATETIME2 (7)    NULL,
    [update_user_id]             VARCHAR (60)     NULL,
    [primary_flag]               BIT              NULL,
    [rowhash]                    VARBINARY (8000) NULL
);

