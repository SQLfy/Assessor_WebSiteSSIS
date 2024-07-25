CREATE TABLE [asr_spatialest].[account_neighborhood] (
    [account_no]             VARCHAR (30)  NOT NULL,
    [neighborhood_code]      VARCHAR (50)  NOT NULL,
    [property_type]          VARCHAR (50)  NOT NULL,
    [neighborhood_extension] VARCHAR (50)  NOT NULL,
    [create_datetime]        DATETIME2 (7) NOT NULL,
    [create_user_id]         VARCHAR (60)  NOT NULL,
    [update_datetime]        DATETIME2 (7) NULL,
    [update_user_id]         VARCHAR (60)  NULL,
    CONSTRAINT [pk_account_neighborhood] PRIMARY KEY CLUSTERED ([account_no] ASC, [neighborhood_code] ASC, [property_type] ASC, [neighborhood_extension] ASC),
    CONSTRAINT [fk_an_account] FOREIGN KEY ([account_no]) REFERENCES [asr_spatialest].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_spatialest].[account_neighborhood] NOCHECK CONSTRAINT [fk_an_account];

