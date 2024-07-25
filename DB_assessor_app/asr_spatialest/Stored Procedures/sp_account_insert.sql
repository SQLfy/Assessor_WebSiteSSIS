









CREATE PROCEDURE [asr_spatialest].[sp_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/29/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the account table

	
	[account_no] [varchar](30) NOT NULL,
	[state_parcel_no] [varchar](30) NULL,
	[tax_district_no] [varchar](30) NOT NULL,
	[sub_filing_recording_no] [varchar](30) NULL,
	[account_type] [varchar](30) NOT NULL,
	[legal_description] [varchar](max) NULL,
	--[create_datetime] [datetime2](7) NOT NULL,
	--[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,
	[longitude_x]     [numeric](30,8)
	[latitude_y]      [numeric](30,8)
	[elevation_z]     [numeric](30,8)

*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_spatialest.account AS myTarget
USING assessor_datastore.asr_spatialest_query.v_account AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	
	 THEN
        UPDATE SET myTarget.state_parcel_no = mySource.state_parcel_no
				  ,myTarget.tax_district_no = mySource.tax_district_no
				  ,myTarget.sub_filing_recording_no = mySource.sub_filing_recording_no
				  ,myTarget.account_type = mySource.account_type
				  ,myTarget.legal_description = mySource.legal_description
				  ,myTarget.longitude_x = mySource.longitude_x
				  ,myTarget.latitude_y	= mySource.latitude_y
				  ,myTarget.elevation_z	= mySource.elevation_z
				  -- create_datetime
				  -- create_user_id
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
			,legal_description
			,create_datetime
			,create_user_id
			,update_datetime
			,update_user_id
			,rowhash
			,longitude_x
			,latitude_y 
			,elevation_z
            )
     VALUES (mySource.account_no 
            ,mySource.state_parcel_no
			,mySource.tax_district_no
			,mySource.sub_filing_recording_no
			,mySource.account_type
			,mySource.legal_description
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.update_datetime
            ,mySource.update_user_id
			,mySource.rowhash
			,mySource.longitude_x
			,mySource.latitude_y 
			,mySource.elevation_z
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

	 







