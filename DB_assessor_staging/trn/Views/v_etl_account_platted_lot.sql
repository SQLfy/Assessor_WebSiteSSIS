
CREATE VIEW [trn].[v_etl_account_platted_lot]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      7/06/2016
Developer:     Tony Golden
Comments:      Initial creation
               Create view for platted_lot for POSSE consumption
*************************************************************************************/
AS
SELECT
              DISTINCT
			    A.ACCOUNTNO ACCOUNT_NO,  
                PARCELNO PARCEL_NO,
                isnull( Q_TBLSUBACCOUNT.LOT ,' ') LOT,
                isnull( Q_TBLSUBACCOUNT.TRACT ,' ') TRACT,
                isnull( Q_TBLSUBACCOUNT.BLOCK ,' ') BLOCK
              FROM
					dqm.Q_TBLACCT A
			  JOIN  dqm.Q_TBLSUBACCOUNT  Q_TBLSUBACCOUNT ON ( (A.ACCOUNTNO = Q_TBLSUBACCOUNT.ACCOUNTNO ) )
  WHERE 
  ( A.PARCELNO IS NOT NULL )







