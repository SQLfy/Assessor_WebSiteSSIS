CREATE TABLE [asr_datastore].[improvement_detail] (
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
    CONSTRAINT [fk_id_account] FOREIGN KEY ([account_no]) REFERENCES [asr_datastore].[account] ([account_no]),
    CONSTRAINT [fk_id_improvement] FOREIGN KEY ([account_no], [improvement_no]) REFERENCES [asr_datastore].[improvement] ([account_no], [improvement_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_datastore].[improvement_detail] NOCHECK CONSTRAINT [fk_id_account];


GO
ALTER TABLE [asr_datastore].[improvement_detail] NOCHECK CONSTRAINT [fk_id_improvement];


GO
CREATE NONCLUSTERED INDEX [ix_acctno_impno_detailunitcnt]
    ON [asr_datastore].[improvement_detail]([improvement_detail_type] ASC, [improvement_detail_type_description] ASC)
    INCLUDE([account_no], [improvement_no], [detail_unit_count]);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Improvement details are finishings built on the improvements. Things like AddOn, Plumbing, Garage, Carport, Porch/Deck, Appliance.


There are as many records in this table, per account and building, as there are detail items in Realware for that building.  Examples of detail items include decks, basements and garages.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for each improvement on a given account.  Once assigned to a building, this does not change.  Acts a key field for joining other improvement tables.
', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'improvement_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An unique identifier for each improvement detail.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'improvement_detail_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the type of improvement details. Examples are:
AddOn, Plumbing, Garage, Carport, Porch/Deck, Appliance', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'improvement_detail_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A description to describe the characteristics about the detail item of a given detail type. For example, with a detail type of basement, a detail description could be all of the following: walkout, finished, partial, Bsmnt Conc 8 ft, and so on. ', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'improvement_detail_type_description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of unit for the detail item. For example, for the detail type of Garage and detail description of Attached, a number of unit of 672 means the attached garage is 672 SF. For the detail type of Applicance and a detail description of dishwasher, a number of unit of 1 means there is one dishwasher.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'detail_unit_count';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Addon codes are used to describe addons. Example of addons are:
hot tub
retaining wall
parking lot lighting
and so on', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'addon_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the addon code.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'addon_code_description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The year the detail was put in place.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'improvement_detail', @level2type = N'COLUMN', @level2name = N'detail_built_year';

