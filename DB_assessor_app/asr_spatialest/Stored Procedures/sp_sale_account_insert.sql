


CREATE PROCEDURE [asr_spatialest].[sp_sale_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the sale_account table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_spatialest.sale_account AS myTarget
USING assessor_datastore.asr_spatialest_query.v_sale_account AS mySource
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






