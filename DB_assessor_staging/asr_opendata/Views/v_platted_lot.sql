


create view [asr_opendata].[v_platted_lot]
as

SELECT
  SUBQUERY.STATE_PARCEL_NO STATE_PARCEL_NO,
  SUBQUERY.LOT LOT,
  SUBQUERY.BLOCK BLOCK,
  SUBQUERY.TRACT TRACT
FROM
  (SELECT
              DISTINCT  
                [account].STATE_PARCEL_NO STATE_PARCEL_NO,
                isnull( LOT ,' ') LOT,
                isnull( TRACT ,' ') TRACT,
                isnull( BLOCK ,' ') BLOCK
              FROM	assessor_datastore.[asr_datastore].[account]  ACCOUNT   
				JOIN   assessor_datastore.[asr_datastore].LAND  LAND 
				-- ON ( (( ACCOUNT.STATE_PARCEL_NO = LAND.STATE_PARCEL_NO )) AND (( ACCOUNT.ASSESSMENT_YEAR = LAND.ASSESSMENT_YEAR )) )
				ON ACCOUNT.STATE_PARCEL_NO = LAND.STATE_PARCEL_NO 
				JOIN   [assessor_staging].dqm.Q_TBLSUBACCOUNT  Q_TBLSUBACCOUNT ON ( ( ACCOUNT.ACCOUNT_NO = Q_TBLSUBACCOUNT.ACCOUNTNO ) )
  WHERE 
  ( ACCOUNT.STATE_PARCEL_NO IS NOT NULL ) ) SUBQUERY
;



