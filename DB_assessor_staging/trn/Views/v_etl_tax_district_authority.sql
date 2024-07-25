


/*
-- 
*/

CREATE VIEW [trn].[v_etl_tax_district_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all details for the tax_district_authority table
*************************************************************************************/
AS
SELECT
  tda.taxdistrict AS tax_district_no,
  tda.taxauthority AS tax_authority_no,
  GETDATE() AS create_datetime,
  SUSER_NAME() AS create_user_id
FROM
    dqm.q_tmaptaxdistrictauthority tda




