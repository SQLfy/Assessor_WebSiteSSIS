﻿CREATE TABLE [asr_app].[value_from_tsgvacctabstvalue] (
    [account_no]                       VARCHAR (30)    NOT NULL,
    [tax_year]                         NUMERIC (4)     NOT NULL,
    [valuation_class_code]             VARCHAR (50)    NOT NULL,
    [tax_district_no]                  VARCHAR (30)    NOT NULL,
    [raw_assessed_value]               NUMERIC (15, 2) NULL,
    [raw_tax_dollars]                  NUMERIC (15, 2) NULL,
    [actual_value]                     NUMERIC (15, 2) NULL,
    [mill_levy]                        NUMERIC (11, 6) NULL,
    [create_datetime]                  DATETIME2 (7)   NOT NULL,
    [create_user_id]                   VARCHAR (60)    NOT NULL,
    [account_type]                     VARCHAR (30)    NULL,
    [net_acres]                        NUMERIC (15, 4) NULL,
    [valuation_class_code_description] VARCHAR (100)   NULL,
    [assessment_rate]                  NUMERIC (15, 6) NULL,
    CONSTRAINT [pk_value_from_tsgvacctabstvalue] PRIMARY KEY CLUSTERED ([account_no] ASC, [tax_year] ASC, [valuation_class_code] ASC, [tax_district_no] ASC),
    CONSTRAINT [fk_tsgv_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE,
    CONSTRAINT [fk_tsgv_tax_district] FOREIGN KEY ([tax_district_no]) REFERENCES [asr_app].[tax_district] ([tax_district_no])
);


GO
ALTER TABLE [asr_app].[value_from_tsgvacctabstvalue] NOCHECK CONSTRAINT [fk_tsgv_account];


GO
ALTER TABLE [asr_app].[value_from_tsgvacctabstvalue] NOCHECK CONSTRAINT [fk_tsgv_tax_district];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'value_from_tsgvacctabstvalue', @level2type = N'COLUMN', @level2name = N'account_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.', @level0type = N'SCHEMA', @level0name = N'asr_app', @level1type = N'TABLE', @level1name = N'value_from_tsgvacctabstvalue', @level2type = N'COLUMN', @level2name = N'tax_district_no';
