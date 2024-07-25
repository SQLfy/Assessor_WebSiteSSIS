CREATE TABLE [asr_app].[sale_inventory_detail] (
    [inventorydetailid]            NUMERIC (15)     NOT NULL,
    [recording_no]                 VARCHAR (30)     NOT NULL,
    [account_no]                   VARCHAR (30)     NOT NULL,
    [detail_type]                  VARCHAR (50)     NULL,
    [inventory_detail_type]        VARCHAR (100)    NULL,
    [inventory_detail_description] VARCHAR (100)    NULL,
    [inventory_unit_count]         NUMERIC (15, 4)  NULL,
    [create_datetime]              DATETIME2 (7)    NOT NULL,
    [create_user_id]               VARCHAR (60)     NOT NULL,
    [update_datetime]              DATETIME2 (7)    NULL,
    [update_user_id]               VARCHAR (60)     NULL,
    [rowhash]                      VARBINARY (8000) NULL,
    CONSTRAINT [pk_sale_inventory_detail] PRIMARY KEY CLUSTERED ([inventorydetailid] ASC),
    CONSTRAINT [fk_sid_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[sale_inventory_detail] NOCHECK CONSTRAINT [fk_sid_account];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'sale_inventory_detail', @level2type = N'COLUMN', @level2name = N'account_no';

