
CREATE VIEW [asr_app_query].[v_account_platted_lot]
AS
SELECT [ACCOUNT_NO]
      ,[PARCEL_NO]
      ,[LOT]
      ,[TRACT]
      ,[BLOCK]
      ,[CREATE_DTM]
      ,[CREATE_USER_ID]
      ,[UPDATE_DTM]
      ,[UPDATE_USER_ID]
  FROM [assessor_datastore].[asr_datastore].[account_platted_lot]


/*

CREATE VIEW [asr_app_query].[v_account_platted_lot]
AS
SELECT        STATE_PARCEL_NO, LOT, BLOCK, TRACT
FROM            (SELECT DISTINCT 
                                                    ACCOUNT.state_parcel_no AS STATE_PARCEL_NO, ISNULL(Q_TBLSUBACCOUNT.LOT, ' ') AS LOT, ISNULL(Q_TBLSUBACCOUNT.TRACT, ' ') AS TRACT, ISNULL(Q_TBLSUBACCOUNT.BLOCK, ' ') 
                                                    AS BLOCK
                          FROM            asr_datastore.account AS ACCOUNT INNER JOIN
                                                    assessor_staging.dqm.q_tblsubaccount AS Q_TBLSUBACCOUNT ON ACCOUNT.account_no = Q_TBLSUBACCOUNT.ACCOUNTNO
                          WHERE        (ACCOUNT.state_parcel_no IS NOT NULL)) AS DEDUP_PLATTED_LOT


GO

*/
