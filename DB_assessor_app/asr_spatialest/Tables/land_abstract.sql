CREATE TABLE [asr_spatialest].[land_abstract] (
    [account_no]              VARCHAR (30)     NOT NULL,
    [abstract_code]           VARCHAR (50)     NOT NULL,
    [land_abstract_detail_id] NUMERIC (15)     NOT NULL,
    [land_type]               VARCHAR (50)     NULL,
    [land_acres]              NUMERIC (20, 6)  NULL,
    [create_datetime]         DATETIME2 (7)    NOT NULL,
    [create_user_id]          VARCHAR (60)     NOT NULL,
    [update_datetime]         DATETIME2 (7)    NULL,
    [update_user_id]          VARCHAR (60)     NULL,
    [rowhash]                 VARBINARY (8000) NULL,
    CONSTRAINT [pk_land_abstract] PRIMARY KEY CLUSTERED ([account_no] ASC, [abstract_code] ASC, [land_abstract_detail_id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_spatialest', @level1type = N'TABLE', @level1name = N'land_abstract', @level2type = N'COLUMN', @level2name = N'account_no';

