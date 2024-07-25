CREATE TABLE [asr_datastore].[account_property_address] (
    [account_no]            VARCHAR (30)     NOT NULL,
    [order_no]              INT              NOT NULL,
    [primary_address_flag]  BIT              NULL,
    [building_no]           VARCHAR (30)     NULL,
    [unit_no]               VARCHAR (30)     NULL,
    [unit_designator]       VARCHAR (30)     NULL,
    [address_number]        VARCHAR (15)     NULL,
    [address_number_suffix] VARCHAR (30)     NULL,
    [pre_direction_code]    VARCHAR (50)     NULL,
    [street_name]           VARCHAR (80)     NULL,
    [street_type_code]      VARCHAR (30)     NULL,
    [post_direction_code]   VARCHAR (50)     NULL,
    [city_name]             VARCHAR (50)     NULL,
    [location_zip_code]     VARCHAR (10)     NULL,
    [create_datetime]       DATETIME2 (7)    NOT NULL,
    [create_user_id]        VARCHAR (60)     NOT NULL,
    [update_datetime]       DATETIME2 (7)    NULL,
    [update_user_id]        VARCHAR (60)     NULL,
    [rowhash]               VARBINARY (8000) NULL,
    CONSTRAINT [pk_account_property_address] PRIMARY KEY CLUSTERED ([account_no] ASC, [order_no] ASC),
    CONSTRAINT [fk_apa_account] FOREIGN KEY ([account_no]) REFERENCES [asr_datastore].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_datastore].[account_property_address] NOCHECK CONSTRAINT [fk_apa_account];


GO
CREATE NONCLUSTERED INDEX [fk_apa_account]
    ON [asr_datastore].[account_property_address]([account_no] ASC);


GO
CREATE NONCLUSTERED INDEX [_dta_index_account_property_address_16_341576255__K3_1_5_7_8_9_10_11_12_13_14]
    ON [asr_datastore].[account_property_address]([primary_address_flag] ASC)
    INCLUDE([account_no], [unit_no], [address_number], [address_number_suffix], [pre_direction_code], [street_name], [street_type_code], [post_direction_code], [city_name], [location_zip_code]);


GO
CREATE STATISTICS [_dta_stat_341576255_1_3]
    ON [asr_datastore].[account_property_address]([account_no], [primary_address_flag]);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Property address is also known as situs address. A situs address is a physical address that provides the textual description of a location for a structure or an improvement.In real estate, situs is the physical location of a property; in personal property, situs is the taxable location because personal property may be moved from one place to another.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The orderno describes the order in which property addresses are created. ', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'order_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'One account could have multiple property addresses. 1 indicates primary address while 0 indicates non-primary address. The first address (lowest orderno) on the account is designated as the primary address.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'primary_address_flag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Each building on a property is given a unique number, and all data pertaining to that improvement is associated with the number.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'building_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to identify the unit within a multiunit building. This would apply to both mulitunit residential and commercial buildings.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'unit_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit designator describes a unit. For example, APT, UNIT, and STE (suite).', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'unit_designator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The address number portion of an address. For example. 100 THIRD ST. 100 is the address number.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'address_number';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The suffix to an address number.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'address_number_suffix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The predirectional to a street name. For example, S UNIVERSITY BLVD. S is the predirection.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'pre_direction_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of a street.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'street_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of a street. For example 100 THIRD ST. ST is the street type.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'street_type_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The postdirectional to a street name. For example, INVERNESS DR WEST. WEST is the postdirection', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'post_direction_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the city where the situs address belongs.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'city_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Zip code.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'location_zip_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'rowhash';

