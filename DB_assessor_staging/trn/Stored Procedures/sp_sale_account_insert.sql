

CREATE PROCEDURE [trn].[sp_sale_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/25/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the sale_account table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.sale_account AS myTarget
USING trn.v_etl_sale_account AS mySource
ON myTarget.recording_no = mySource.recording_no
AND myTarget.account_no = mySource.account_no

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             recording_no
            ,account_no
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.recording_no
            ,mySource.account_no
	        ,mySource.create_datetime
			,mySource.create_user_id
	        ,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





