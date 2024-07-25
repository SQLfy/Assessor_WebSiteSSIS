

/*
-- 
*/

CREATE VIEW [trn].[v_etl_land_parent]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      6/29/2016
Developer:     Tony Golden
Comments:      Initial creation
               Create view for land_parent for POSSE consumption
*************************************************************************************/
AS
SELECT
       DISTINCT  
         Q_TBLACCT.PARCELNO STATE_PARCEL_NO,
         Q_TBLACCT_PARENT.PARCELNO PARENT_PARCEL_NO
FROM
         asr_staging.s_tblacctparentparcel S_TBLACCTPARENTPARCEL   
   JOIN   dqm.Q_TBLACCT  Q_TBLACCT ON   S_TBLACCTPARENTPARCEL.ACCOUNTNO = Q_TBLACCT.ACCOUNTNO  
   JOIN   dqm.Q_TBLACCT  Q_TBLACCT_PARENT ON   S_TBLACCTPARENTPARCEL.PARENTACCOUNT = Q_TBLACCT_PARENT.ACCOUNTNO  
  WHERE 
   Q_TBLACCT.PARCELNO IS NOT NULL   AND
   Q_TBLACCT_PARENT.PARCELNO IS NOT NULL 



