CREATE TABLE [asr_ods2].[account_neighborhood] (
    [account_no]             VARCHAR (30)  NOT NULL,
    [neighborhood_code]      VARCHAR (50)  NOT NULL,
    [property_type]          VARCHAR (50)  NOT NULL,
    [neighborhood_extension] VARCHAR (50)  NOT NULL,
    [create_datetime]        DATETIME2 (7) NOT NULL,
    [create_user_id]         VARCHAR (60)  NOT NULL,
    [update_datetime]        DATETIME2 (7) NULL,
    [update_user_id]         VARCHAR (60)  NULL,
    CONSTRAINT [pk_account_neighborhood] PRIMARY KEY CLUSTERED ([account_no] ASC, [neighborhood_code] ASC, [property_type] ASC, [neighborhood_extension] ASC),
    CONSTRAINT [fk_an_account] FOREIGN KEY ([account_no]) REFERENCES [asr_ods2].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_ods2].[account_neighborhood] NOCHECK CONSTRAINT [fk_an_account];


GO
CREATE NONCLUSTERED INDEX [fk_an_account]
    ON [asr_ods2].[account_neighborhood]([account_no] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account_neighborhood', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Neighborhood is a group of complementary land uses; a congruous grouping of inhabitants, buildings, or business enterprises. Also, a code used to stratify accounts by similar use, location and quality.  A record is required for each different improvement property type on an account.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account_neighborhood', @level2type = N'COLUMN', @level2name = N'neighborhood_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Property type describes the intended use of an improvement, such as Outbuilding, Condominium, or Residential.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account_neighborhood', @level2type = N'COLUMN', @level2name = N'property_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Extension is used to further specify the comparability of properties beyod neighborhood_code.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'account_neighborhood', @level2type = N'COLUMN', @level2name = N'neighborhood_extension';

