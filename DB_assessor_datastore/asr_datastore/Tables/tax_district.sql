CREATE TABLE [asr_datastore].[tax_district] (
    [tax_district_no]   VARCHAR (30)  NOT NULL,
    [tax_district_name] VARCHAR (256) NULL,
    [create_datetime]   DATETIME      NOT NULL,
    [create_user_id]    VARCHAR (30)  NOT NULL,
    [update_datetime]   DATETIME      NULL,
    [update_user_id]    VARCHAR (30)  NULL,
    CONSTRAINT [pk_tax_district] PRIMARY KEY CLUSTERED ([tax_district_no] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tax districts are a political subdivision of one or more assessment districts where a governmental unit has the authority to levy taxes. This term is used synonymously with “Tax Area”.


in other words, Tax district means a geographical area made up of a unique mix of one or more taxing authorities, which is established for the purpose of properly calculating, collecting, and distributing taxes. Only one tax district will have the same combination
of taxing authoritys.
', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'tax_district';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'tax_district', @level2type = N'COLUMN', @level2name = N'tax_district_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of a tax district', @level0type = N'SCHEMA', @level0name = N'asr_datastore', @level1type = N'TABLE', @level1name = N'tax_district', @level2type = N'COLUMN', @level2name = N'tax_district_name';

