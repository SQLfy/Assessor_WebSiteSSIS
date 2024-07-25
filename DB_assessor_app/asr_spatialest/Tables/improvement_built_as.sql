CREATE TABLE [asr_spatialest].[improvement_built_as] (
    [account_no]                 VARCHAR (30)     NOT NULL,
    [improvement_no]             NUMERIC (5)      NOT NULL,
    [built_as_detail_id]         NUMERIC (15)     NOT NULL,
    [built_as_code_description]  VARCHAR (100)    NULL,
    [exterior_construction_type] VARCHAR (50)     NULL,
    [no_of_story]                NUMERIC (5, 2)   NULL,
    [room_count]                 NUMERIC (7)      NULL,
    [bedroom_count]              NUMERIC (7, 2)   NULL,
    [total_unit_count]           NUMERIC (7)      NULL,
    [built_year]                 VARCHAR (4)      NULL,
    [built_as_sf]                NUMERIC (15)     NULL,
    [bathroom_count]             NUMERIC (7, 2)   NULL,
    [heat_type]                  VARCHAR (50)     NULL,
    [create_datetime]            DATETIME2 (7)    NOT NULL,
    [create_user_id]             VARCHAR (60)     NOT NULL,
    [update_datetime]            DATETIME2 (7)    NULL,
    [update_user_id]             VARCHAR (60)     NULL,
    [rowhash]                    VARBINARY (8000) NULL,
    CONSTRAINT [pk_improvement_built_as] PRIMARY KEY CLUSTERED ([account_no] ASC, [improvement_no] ASC, [built_as_detail_id] ASC),
    CONSTRAINT [fk_iba_improvement] FOREIGN KEY ([account_no], [improvement_no]) REFERENCES [asr_spatialest].[improvement] ([account_no], [improvement_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_spatialest].[improvement_built_as] NOCHECK CONSTRAINT [fk_iba_improvement];

