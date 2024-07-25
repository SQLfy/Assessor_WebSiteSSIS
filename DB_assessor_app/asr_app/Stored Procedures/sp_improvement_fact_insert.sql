


CREATE PROCEDURE [asr_app].[sp_improvement_fact_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/5/2016
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Merge changes into the improvement_fact table

*************************************************************************************/
SET NOCOUNT ON;

--TRUNCATE TABLE ASR_APP.IMPROVEMENT_FACT

/****** Script for SelectTopNRows command from SSMS  ******/
INSERT INTO  ASR_APP.IMPROVEMENT_FACT
(ACCOUNT_NO
, IMPROVEMENT_SF
, NO_OF_FIREPLACE
, TOTAL_GARAGE_SF
, WALKOUT_BASEMENT_FLAG
, TOTAL_PORCH_SF
, TOTAL_FINISHED_BASEMENT_SF
, TOTAL_UNFINISHED_BASEMENT_SF
, IMPROVEMENT_NO
, IMPROVEMENT_DETAIL_ID
, PROPERTY_TYPE, CONDITION_TYPE
, IMPROVEMENT_QUALITY
, COMPLETED_PERCENT
, IMPROVEMENT_UNIT_TYPE)
SELECT ACCOUNT_NO
	, IMPROVEMENT_SF
	, NO_OF_FIREPLACE
	, TOTAL_GARAGE_SF
	, WALKOUT_BASEMENT_FLAG
	, TOTAL_PORCH_SF
	, TOTAL_FINISHED_BASEMENT_SF
	, TOTAL_UNFINISHED_BASEMENT_SF
	, IMPROVEMENT_NO
	, IMPROVEMENT_DETAIL_ID
	, PROPERTY_TYPE, CONDITION_TYPE
	, IMPROVEMENT_QUALITY
	, COMPLETED_PERCENT
	, IMPROVEMENT_UNIT_TYPE
  FROM [assessor_datastore].[asr_app_query].[v_improvement_fact]

