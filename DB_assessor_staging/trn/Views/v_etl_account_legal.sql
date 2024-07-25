



/*
-- 
*/

CREATE VIEW [trn].[v_etl_account_legal]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/12/17
Developer:     TG
Comments:      Initial creation
               ACCOUNT_LEGAL DATA
*************************************************************************************/
AS
SELECT
     ACCOUNTNO
   , LEGAL, ACCTLEGALON0
FROM
    asr_staging.s_tblacctlegal






