

/*
-- 
*/

CREATE VIEW [trn].[v_etl_tax_district]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all tax districts
*************************************************************************************/
AS
SELECT
  td.taxdistrict AS tax_district_no,
  td.taxdistrictname AS tax_district_name,
  GETDATE() AS create_datetime,
  SUSER_NAME() AS create_user_id
FROM
    asr_staging.s_tlkptaxdistrict td 



