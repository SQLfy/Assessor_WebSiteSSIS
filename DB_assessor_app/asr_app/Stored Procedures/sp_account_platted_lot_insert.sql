
CREATE PROCEDURE [asr_app].[sp_account_platted_lot_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     6/06/2017
Developer:    tony golden
Comments:	  Initial creation 
              Merge changes into the platted lot table


*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE asr_app.platted_lot;

INSERT INTO asr_app.account_platted_lot
(
STATE_PARCEL_NO
, LOT_NO
, BLOCK_NO
, TRACT_NO
, CREATE_DTM
, CREATE_USER_ID
, UPDATE_DTM
, UPDATE_USER_ID
)
SELECT PARCEL_NO
, LOT
, BLOCK
, TRACT
, GETDATE()
, 'ASR_ODS2 ETL'
, GETDATE()
, 'ASR_ODS2 ETL'
FROM assessor_datastore.asr_app_query.v_account_platted_lot
;

