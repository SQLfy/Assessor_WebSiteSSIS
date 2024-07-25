





-- ======================================================================
-- Author:		David Guillen
-- Create date: 09/08/2017
-- Description:	transformation for platted lot for Assessor Open Data
-- ======================================================================

CREATE PROCEDURE [trn].[sp_OD_platted_lot]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	truncate table [assessor_datastore].[asr_datastore].[OD_platted_lot]

   INSERT INTO [assessor_datastore].[asr_datastore].[OD_platted_lot]
   (
   STATE_PARCEL_NO, LOT_NO, BLOCK_NO, TRACT_NO
   )
  
  SELECT
/* platted_lot 142387*/
  --PLATTED_LOT_EID IDENTITY ,
  DEDUP_INPUT_SUBQUERY2.STATE_PARCEL_NO STATE_PARCEL_NO,
  DEDUP_INPUT_SUBQUERY2.LOT LOT,
  DEDUP_INPUT_SUBQUERY2.BLOCK BLOCK,
  DEDUP_INPUT_SUBQUERY2.TRACT TRACT
FROM
  (SELECT
              DISTINCT  
                ACCOUNT.STATE_PARCEL_NO STATE_PARCEL_NO,
                isnull( Q_TBLSUBACCOUNT.LOT ,' ') LOT,
                isnull( Q_TBLSUBACCOUNT.TRACT ,' ') TRACT,
                isnull(Q_TBLSUBACCOUNT.BLOCK ,' ') BLOCK
              FROM
    assessor_datastore.asr_datastore.OD_ACCOUNT  ACCOUNT   
 JOIN   assessor_datastore.asr_datastore.LAND  LAND 
ON ( (( ACCOUNT.STATE_PARCEL_NO = LAND.STATE_PARCEL_NO )) AND (( ACCOUNT.ASSESSMENT_YEAR = LAND.ASSESSMENT_YEAR )) )
JOIN   assessor_staging.dqm.Q_TBLSUBACCOUNT  Q_TBLSUBACCOUNT ON ( ( ACCOUNT.ACCOUNT_NO = Q_TBLSUBACCOUNT.ACCOUNTNO ) )
  WHERE 
  ( ACCOUNT.STATE_PARCEL_NO IS NOT NULL ) ) DEDUP_INPUT_SUBQUERY2


END




