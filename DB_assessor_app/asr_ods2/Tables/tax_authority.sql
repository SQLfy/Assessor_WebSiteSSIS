﻿CREATE TABLE [asr_ods2].[tax_authority] (
    [tax_authority_no]   VARCHAR (30)  NOT NULL,
    [tax_authority_name] VARCHAR (256) NULL,
    [authority_type]     VARCHAR (100) NULL,
    [create_datetime]    DATETIME2 (7) NOT NULL,
    [create_user_id]     VARCHAR (60)  NOT NULL,
    [update_datetime]    DATETIME2 (7) NULL,
    [update_user_id]     VARCHAR (60)  NULL,
    CONSTRAINT [pk_tax_authority] PRIMARY KEY CLUSTERED ([tax_authority_no] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A Taxing Authority is a unit of government that levies taxes for operational expense. Each Tax Authority must hold public hearings on their proposed budget. The most common authorities are: Board of County Commissioners, School Districts, Municipalities, Water Management Districts, and Basin Boards.

There are over 200 different taxing authorities in Douglas County which affect various tax districts. They include the county commission, municipalities, school board, transit, water management, and fire districts. These different entities all have public hearings on budget requests for the forthcoming year.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'tax_authority';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A four digits number that identifies a taxing authority.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'tax_authority', @level2type = N'COLUMN', @level2name = N'tax_authority_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The name of a tax authority.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'tax_authority', @level2type = N'COLUMN', @level2name = N'tax_authority_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The type of tax authority. Some examples are County, School, Law Enforcement, City, and Metro District.', @level0type = N'SCHEMA', @level0name = N'asr_ods2', @level1type = N'TABLE', @level1name = N'tax_authority', @level2type = N'COLUMN', @level2name = N'authority_type';

