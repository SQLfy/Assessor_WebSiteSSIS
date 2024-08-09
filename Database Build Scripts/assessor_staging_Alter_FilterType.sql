USE [assessor_staging]
GO

ALTER TABLE [asr_staging].[s_tbllandattribute]
ALTER COLUMN [FILTERTYPE] [varchar](50) NULL

GO

ALTER TABLE  [asr_staging].[s_tlkplandattributetype]
ALTER COLUMN [FILTERTYPE] [varchar](50) NULL

GO



