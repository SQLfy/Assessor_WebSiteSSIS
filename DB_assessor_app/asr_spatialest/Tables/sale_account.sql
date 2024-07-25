CREATE TABLE [asr_spatialest].[sale_account] (
    [recording_no]    VARCHAR (30)     NOT NULL,
    [account_no]      VARCHAR (30)     NOT NULL,
    [create_datetime] DATETIME2 (7)    NOT NULL,
    [create_user_id]  VARCHAR (60)     NOT NULL,
    [update_datetime] DATETIME2 (7)    NULL,
    [update_user_id]  VARCHAR (60)     NULL,
    [rowhash]         VARBINARY (8000) NULL,
    CONSTRAINT [pk_sale_account] PRIMARY KEY CLUSTERED ([recording_no] ASC, [account_no] ASC),
    CONSTRAINT [fk_sa_sale] FOREIGN KEY ([recording_no]) REFERENCES [asr_spatialest].[sale] ([recording_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_spatialest].[sale_account] NOCHECK CONSTRAINT [fk_sa_sale];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Accounts involved in real estate transactions.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale_account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the recording/reception no assigned to a recorded document in the Clerk and Recorder''s recording
system for the sale.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale_account', @level2type = N'COLUMN', @level2name = N'recording_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.

Accounts involved in a real estate transaction.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale_account', @level2type = N'COLUMN', @level2name = N'account_no';

