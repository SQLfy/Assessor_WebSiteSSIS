﻿







CREATE PROCEDURE [asr_app].[sp_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Richard Edwards
Comments:	  Initial creation 
              Merge changes into the account table

Mod #:  2
Mod Date:     10/31/2016
Developer:    Richard Edwards
Comments:	  Add columns qtr, section, township and range 
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_app.account AS myTarget
USING assessor_datastore.asr_app_query.v_account AS mySource
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
				  ,myTarget.bldg_permit_auth_id = mySource.bldg_permit_auth_id
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.qtr = mySource.qtr
				  ,myTarget.section = mySource.section
				  ,myTarget.township = mySource.township
				  ,myTarget.range = mySource.range


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
		    ,bldg_permit_auth_id
			,create_datetime
			,create_user_id
			,rowhash
			,qtr
			,section
			,township
			,range
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
			,mySource.bldg_permit_auth_id
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,mySource.qtr
			,mySource.section
			,mySource.township
			,mySource.range
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





