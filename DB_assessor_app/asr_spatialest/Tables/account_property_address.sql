CREATE TABLE [asr_spatialest].[account_property_address] (
    [account_no]         VARCHAR (30)     NOT NULL,
    [address_number]     VARCHAR (15)     NULL,
    [pre_direction_code] VARCHAR (50)     NULL,
    [street_name]        VARCHAR (80)     NULL,
    [street_type_code]   VARCHAR (30)     NULL,
    [unit_no]            VARCHAR (30)     NULL,
    [city_name]          VARCHAR (50)     NULL,
    [location_zip_code]  VARCHAR (10)     NULL,
    [create_datetime]    DATETIME2 (7)    NOT NULL,
    [create_user_id]     VARCHAR (60)     NOT NULL,
    [update_datetime]    DATETIME2 (7)    NULL,
    [update_user_id]     VARCHAR (60)     NULL,
    [rowhash]            VARBINARY (8000) NULL,
    CONSTRAINT [pk_account_property_address] PRIMARY KEY CLUSTERED ([account_no] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Property address is also known as situs address. A situs address is a physical address that provides the textual description of a location for a structure or an improvement.In real estate, situs is the physical location of a property; in personal property, situs is the taxable location because personal property may be moved from one place to another.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The address number portion of an address. For example. 100 THIRD ST. 100 is the address number.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'address_number';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The predirectional to a street name. For example, S UNIVERSITY BLVD. S is the predirection.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'pre_direction_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of a street.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'street_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of a street. For example 100 THIRD ST. ST is the street type.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'street_type_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to identify the unit within a multiunit building. This would apply to both mulitunit residential and commercial buildings.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'unit_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the city where the situs address belongs.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'city_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Zip code.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'location_zip_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'account_property_address', @level2type = N'COLUMN', @level2name = N'rowhash';

