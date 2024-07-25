





CREATE PROCEDURE [asr_ods2].[sp_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/29/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the tax_district table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.account AS myTarget
USING assessor_datastore.asr_ods2_query.v_account AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	
	 THEN
        UPDATE SET myTarget.state_parcel_no = mySource.state_parcel_no
				  ,myTarget.tax_district_no = mySource.tax_district_no
				  ,myTarget.sub_filing_recording_no = mySource.sub_filing_recording_no
				  ,myTarget.account_type = mySource.account_type
				  ,myTarget.appraisal_type = mySource.appraisal_type
				  ,myTarget.account_status = mySource.account_status
				  ,myTarget.account_status_description = mySource.account_status_description
				  ,myTarget.legal_description = mySource.legal_description
				  ,myTarget.longitude_x = mySource.longitude_x
				  ,myTarget.latitude_y = mySource.latitude_y
				  ,myTarget.elevation_z = mySource.elevation_z
				  ,myTarget.location = mySource.location
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,state_parcel_no
			,tax_district_no
			,sub_filing_recording_no
			,account_type
			,appraisal_type
			,account_status
			,account_status_description
			,legal_description
			,longitude_x
			,latitude_y
			,elevation_z
			,location
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES (mySource.account_no 
            ,mySource.state_parcel_no
			,mySource.tax_district_no
			,mySource.sub_filing_recording_no
			,mySource.account_type
			,mySource.appraisal_type
			,mySource.account_status
			,mySource.account_status_description
			,mySource.legal_description
			,mySource.longitude_x
			,mySource.latitude_y
			,mySource.elevation_z
			,mySource.location
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;



