CREATE TABLE [asr_spatialest].[account_owner_address] (
    [account_no]         VARCHAR (30)     NOT NULL,
    [person_code]        CHAR (18)        NOT NULL,
    [primary_owner_flag] BIT              NOT NULL,
    [owner_name]         VARCHAR (256)    NOT NULL,
    [owner_name_1]       VARCHAR (256)    NOT NULL,
    [owner_name_2]       VARCHAR (256)    NULL,
    [ownership_percent]  NUMERIC (9, 8)   NULL,
    [federal_id_no]      VARCHAR (30)     NULL,
    [address_line_1]     VARCHAR (80)     NULL,
    [address_line_2]     VARCHAR (80)     NULL,
    [city_name]          VARCHAR (80)     NULL,
    [state]              VARCHAR (80)     NULL,
    [zip_code]           VARCHAR (30)     NULL,
    [country]            VARCHAR (80)     NULL,
    [create_datetime]    DATETIME2 (7)    NOT NULL,
    [create_user_id]     VARCHAR (60)     NOT NULL,
    [update_datetime]    DATETIME2 (7)    NULL,
    [update_user_id]     VARCHAR (60)     NULL,
    [rowhash]            VARBINARY (8000) NULL,
    [private_flag]       BIT              NULL,
    CONSTRAINT [pk_account_owner_address] PRIMARY KEY CLUSTERED ([account_no] ASC, [person_code] ASC),
    CONSTRAINT [fk_aoa_account] FOREIGN KEY ([account_no]) REFERENCES [asr_spatialest].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_spatialest].[account_owner_address] NOCHECK CONSTRAINT [fk_aoa_account];

