CREATE TABLE [asr_spatialest].[sale] (
    [recording_no]          VARCHAR (30)     NOT NULL,
    [grantor]               VARCHAR (100)    NULL,
    [grantee]               VARCHAR (100)    NULL,
    [sale_date]             DATETIME2 (7)    NOT NULL,
    [deed_code_description] VARCHAR (100)    NULL,
    [sale_price]            NUMERIC (15, 2)  NOT NULL,
    [valid1_flag]           BIT              NOT NULL,
    [improved_flag]         BIT              NOT NULL,
    [create_datetime]       DATETIME2 (7)    NOT NULL,
    [create_user_id]        VARCHAR (60)     NOT NULL,
    [update_datetime]       DATETIME2 (7)    NULL,
    [update_user_id]        VARCHAR (60)     NULL,
    [rowhash]               VARBINARY (8000) NULL,
    CONSTRAINT [pk_sale] PRIMARY KEY CLUSTERED ([recording_no] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contain information related to legal documents recorded in the Clerk and Recorder''s office pertaining to a sale.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the recording/reception no assigned to a recorded document in the Clerk and Recorder''s recording
system for the sale.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale', @level2type = N'COLUMN', @level2name = N'recording_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A person who transfers property by deed or grants property rights through a trust instrument or other document.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale', @level2type = N'COLUMN', @level2name = N'grantor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A person to whom property is transferred by deed or to whom property rights are granted by a trust instrument or other document.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale', @level2type = N'COLUMN', @level2name = N'grantee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the sale.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale', @level2type = N'COLUMN', @level2name = N'sale_date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of deed code.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale', @level2type = N'COLUMN', @level2name = N'deed_code_description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The price of the sale.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'sale', @level2type = N'COLUMN', @level2name = N'sale_price';

