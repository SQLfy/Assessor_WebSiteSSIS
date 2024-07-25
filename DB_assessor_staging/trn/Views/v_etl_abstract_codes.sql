









CREATE VIEW [trn].[v_etl_abstract_codes]
--WITH SCHEMABINDING
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      08/28/2017
Developer:     AGOLDEN
Comments:      Initial creation
               View contains relevant abstract code data


*************************************************************************************/
AS

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ac.ABSTRACTCODE
      ,ac.ABSTRACTDESCRIPTION
      ,ac.EQUIVALENCEABSTRACTCODE
      ,ac.CLASSIFICATIONID
      ,act.ABSTRACTTYPE
	  ,CASE act.ABSTRACTTYPE WHEN  'L' THEN 'LAND' WHEN 'P' THEN 'PERSONAL' WHEN 'I' THEN 'IMPROVEMENT' END  ABSTRACTTYPE_DESC
      ,act.ACTIVEFLAG
      ,act.JURISDICTIONID
      ,act.LASTUPDATED
      ,act.SORTORDER
  FROM assessor_staging.asr_staging.s_tlkpabstractcodetype act
     ,assessor_staging.asr_staging.s_tlkpabstractcode ac
  WHERE act.abstractcode = ac.abstractcode








