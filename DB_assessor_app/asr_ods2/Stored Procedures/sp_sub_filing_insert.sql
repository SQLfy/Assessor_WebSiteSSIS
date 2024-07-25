


CREATE PROCEDURE [asr_ods2].[sp_sub_filing_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/1/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the sub_filing table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.sub_filing AS myTarget
USING [assessor_datastore].[asr_ods2_query].[v_sub_filing] AS mySource
ON myTarget.sub_filing_recording_no = mySource.sub_filing_recording_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.subdivision_no = mySource.subdivision_no
		          ,myTarget.subdivision_name = mySource.subdivision_name
				  ,myTarget.filing_no = mySource.filing_no
				  ,myTarget.filing_description = mySource.filing_description
				  ,myTarget.dedicated_sub_filing_name = mySource.dedicated_sub_filing_name
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (sub_filing_recording_no
	        ,subdivision_no
			,subdivision_name
			,filing_no
			,filing_description
			,dedicated_sub_filing_name
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES (mySource.sub_filing_recording_no
	        ,mySource.subdivision_no
			,mySource.subdivision_name
			,mySource.filing_no
			,mySource.filing_description
			,mySource.dedicated_sub_filing_name
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

