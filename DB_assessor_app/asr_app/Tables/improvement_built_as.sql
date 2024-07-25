CREATE TABLE [asr_app].[improvement_built_as] (
    [account_no]                    VARCHAR (30)     NOT NULL,
    [improvement_no]                NUMERIC (5)      NOT NULL,
    [built_as_detail_id]            NUMERIC (15)     NOT NULL,
    [built_as_code]                 VARCHAR (50)     NOT NULL,
    [built_as_code_description]     VARCHAR (100)    NULL,
    [hvac_percent]                  NUMERIC (7, 4)   NULL,
    [exterior_construction_type]    VARCHAR (50)     NULL,
    [interior_finish_type]          VARCHAR (50)     NULL,
    [no_of_story]                   NUMERIC (5, 2)   NULL,
    [typical_story_height]          NUMERIC (5)      NULL,
    [roof_construction_type]        VARCHAR (50)     NULL,
    [roof_material_type]            VARCHAR (50)     NULL,
    [floor_material_type]           VARCHAR (50)     NULL,
    [room_count]                    NUMERIC (7)      NULL,
    [bedroom_count]                 NUMERIC (7, 2)   NULL,
    [total_unit_count]              NUMERIC (7)      NULL,
    [class_code]                    VARCHAR (50)     NULL,
    [class_code_description]        VARCHAR (100)    NULL,
    [built_year]                    VARCHAR (4)      NULL,
    [remodeled_year]                VARCHAR (4)      NULL,
    [remodeled_percent]             NUMERIC (7, 4)   NULL,
    [effective_age]                 NUMERIC (5)      NULL,
    [built_as_sf]                   NUMERIC (15)     NULL,
    [sprinkler_coverage_sf]         NUMERIC (15)     NULL,
    [bathroom_count]                NUMERIC (7, 2)   NULL,
    [heat_type]                     VARCHAR (50)     NULL,
    [create_datetime]               DATETIME2 (7)    NOT NULL,
    [create_user_id]                VARCHAR (60)     NOT NULL,
    [update_datetime]               DATETIME2 (7)    NULL,
    [update_user_id]                VARCHAR (60)     NULL,
    [rowhash]                       VARBINARY (8000) NULL,
    [primary_flag]                  BIT              NULL,
    [built_as_length]               NUMERIC (15)     NULL,
    [built_as_width]                NUMERIC (15)     NULL,
    [built_as_height]               NUMERIC (15)     NULL,
    [mobile_home_make]              VARCHAR (50)     NULL,
    [mobile_home_model_type]        VARCHAR (30)     NULL,
    [mobile_home_skirt]             VARCHAR (30)     NULL,
    [mobile_home_skirt_linear_feet] NUMERIC (15)     NULL,
    [mobile_home_wall_type]         VARCHAR (32)     NULL,
    CONSTRAINT [pk_improvement_built_as] PRIMARY KEY CLUSTERED ([account_no] ASC, [improvement_no] ASC, [built_as_detail_id] ASC),
    CONSTRAINT [fk_iba_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]),
    CONSTRAINT [fk_iba_improvement] FOREIGN KEY ([account_no], [improvement_no]) REFERENCES [asr_app].[improvement] ([account_no], [improvement_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[improvement_built_as] NOCHECK CONSTRAINT [fk_iba_account];


GO
ALTER TABLE [asr_app].[improvement_built_as] NOCHECK CONSTRAINT [fk_iba_improvement];

