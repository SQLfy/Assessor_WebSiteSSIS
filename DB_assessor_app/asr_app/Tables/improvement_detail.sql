CREATE TABLE [asr_app].[improvement_detail] (
    [account_no]                          VARCHAR (30)     NOT NULL,
    [improvement_no]                      NUMERIC (5)      NOT NULL,
    [improvement_detail_id]               NUMERIC (15)     NOT NULL,
    [improvement_detail_type]             VARCHAR (50)     NOT NULL,
    [improvement_detail_type_description] VARCHAR (100)    NULL,
    [detail_unit_count]                   NUMERIC (15, 4)  NULL,
    [addon_code]                          VARCHAR (50)     NULL,
    [addon_code_description]              VARCHAR (100)    NULL,
    [detail_built_year]                   VARCHAR (4)      NULL,
    [create_datetime]                     DATETIME2 (7)    NOT NULL,
    [create_user_id]                      VARCHAR (60)     NOT NULL,
    [update_datetime]                     DATETIME2 (7)    NULL,
    [update_user_id]                      VARCHAR (60)     NULL,
    [rowhash]                             VARBINARY (8000) NULL,
    CONSTRAINT [pk_improvement_detail] PRIMARY KEY CLUSTERED ([account_no] ASC, [improvement_no] ASC, [improvement_detail_id] ASC),
    CONSTRAINT [fk_id_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]),
    CONSTRAINT [fk_id_improvement] FOREIGN KEY ([account_no], [improvement_no]) REFERENCES [asr_app].[improvement] ([account_no], [improvement_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[improvement_detail] NOCHECK CONSTRAINT [fk_id_account];


GO
ALTER TABLE [asr_app].[improvement_detail] NOCHECK CONSTRAINT [fk_id_improvement];

