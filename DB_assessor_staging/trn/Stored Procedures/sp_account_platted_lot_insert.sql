





CREATE PROCEDURE [trn].[sp_account_platted_lot_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/1/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the platted_lot for POSSE consumption


			  PARCEL_NO,
              LOT,
              TRACT,
              BLOCK
	  
*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE assessor_datastore.asr_datastore.account_platted_lot

MERGE assessor_datastore.asr_datastore.account_platted_lot AS myTarget
USING trn.v_etl_account_platted_lot AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.parcel_no = mySource.parcel_no
AND myTarget.lot = mySource.lot
AND myTarget.tract = mySource.tract
AND myTarget.block = mySource.block


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
			,parcel_no
			,lot
			,tract
			,block
			,create_dtm
			,create_user_id
			,update_dtm
			,update_user_id
            )
     VALUES (mySource.account_no
	        ,mySource.parcel_no
			,mySource.lot
			,mySource.tract
			,mySource.block
			,getdate()
			,'SSIS_ETL'
			,getdate()
			,'SSIS_ETL'			      
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;



