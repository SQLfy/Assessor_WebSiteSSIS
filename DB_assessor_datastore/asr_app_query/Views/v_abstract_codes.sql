



CREATE VIEW [asr_app_query].[v_abstract_codes]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      8/29/2017
Developer:     AGOLDEN
Comments:      Initial creation
               Provide abstract code data for ETL in the asr_datasore db.

*************************************************************************************/
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
  FROM [assessor_staging].[trn].[v_etl_abstract_codes]

