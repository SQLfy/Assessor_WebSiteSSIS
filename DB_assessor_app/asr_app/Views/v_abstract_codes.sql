
CREATE VIEW [asr_app].[v_abstract_codes]
AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ABSTRACTCODE]
      ,[ABSTRACTDESCRIPTION]
      ,[EQUIVALENCEABSTRACTCODE]
      ,[CLASSIFICATIONID]
      ,[ABSTRACTTYPE]
      ,[ABSTRACTTYPE_DESC]
      ,[ACTIVEFLAG]
      ,[JURISDICTIONID]
      ,[LASTUPDATED]
      ,[SORTORDER]
  FROM [assessor_datastore].[asr_app_query].[v_abstract_codes]

