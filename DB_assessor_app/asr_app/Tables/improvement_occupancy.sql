CREATE TABLE [asr_app].[improvement_occupancy] (
    [account_no]                 VARCHAR (30)     NOT NULL,
    [improvement_no]             NUMERIC (5)      NOT NULL,
    [occupancy_detail_id]        NUMERIC (15)     NOT NULL,
    [occupancy_code]             VARCHAR (50)     NOT NULL,
    [occupancy_code_description] VARCHAR (100)    NULL,
    [occupancy_percent]          NUMERIC (7, 4)   NOT NULL,
    [abstract_code]              VARCHAR (50)     NULL,
    [abstract_code_description]  VARCHAR (100)    NULL,
    [abstract_value]             NUMERIC (15)     NULL,
    [create_datetime]            DATETIME2 (7)    NOT NULL,
    [create_user_id]             VARCHAR (60)     NOT NULL,
    [update_datetime]            DATETIME2 (7)    NULL,
    [update_user_id]             VARCHAR (60)     NULL,
    [rowhash]                    VARBINARY (8000) NULL,
    [primary_flag]               BIT              NULL,
    CONSTRAINT [pk_improvement_occupancy] PRIMARY KEY CLUSTERED ([account_no] ASC, [improvement_no] ASC, [occupancy_detail_id] ASC),
    CONSTRAINT [fk_io_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]),
    CONSTRAINT [fk_io_improvement] FOREIGN KEY ([account_no], [improvement_no]) REFERENCES [asr_app].[improvement] ([account_no], [improvement_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[improvement_occupancy] NOCHECK CONSTRAINT [fk_io_account];


GO
ALTER TABLE [asr_app].[improvement_occupancy] NOCHECK CONSTRAINT [fk_io_improvement];

