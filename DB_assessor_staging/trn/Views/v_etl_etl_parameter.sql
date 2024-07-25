

/*
-- 
*/

CREATE VIEW [trn].[v_etl_etl_parameter]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/17/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all ETL parameters
*************************************************************************************/
AS
SELECT
   PARAMETER_NAME AS parameter_name
  ,PARAMETER_VALUE AS parameter_value
  ,PARAMETER_DESCR AS parameter_description
  ,CREATE_DTM AS create_datetime
  ,CREATE_USER_ID AS create_user_id
  ,UPDATE_DTM AS update_datetime
  ,UPDATE_USER_ID AS update_user_id
FROM
    asr_staging.etl_parameter;




