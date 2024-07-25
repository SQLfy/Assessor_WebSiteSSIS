



CREATE PROCEDURE [asr_spatialest].[sp_improvement_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the improvement table for spatialist

	[account_no] [varchar](30) NOT NULL,
	[improvement_no] [numeric](5, 0) NOT NULL,
	[completed_percent] [numeric](7, 4) NULL,
	[improvement_quality] [varchar](50) NULL,
	[improvement_sf] [numeric](15, 0) NULL,
	[property_type] [varchar](50) NULL,
	[condition_type] [varchar](50) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_spatialest.improvement AS myTarget
USING assessor_datastore.asr_spatialest_query.v_improvement AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.completed_percent = mySource.completed_percent
                  ,myTarget.improvement_quality = mySource.improvement_quality
				  ,myTarget.improvement_sf = mySource.improvement_sf
                  ,myTarget.property_type = mySource.property_type
                  ,myTarget.condition_type = mySource.condition_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


			


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
              account_no
			 ,improvement_no
			 ,completed_percent
			 ,improvement_quality
			 ,improvement_sf
			 ,property_type
			 ,condition_type
			 ,create_datetime 
			 ,create_user_id
			 ,rowhash
            )
     VALUES ( mySource.account_no
			 ,mySource.improvement_no
			 ,mySource.completed_percent
			 ,mySource.improvement_quality
			 ,mySource.improvement_sf
			 ,mySource.property_type
			 ,mySource.condition_type
			 ,mySource.create_datetime 
			 ,mySource.create_user_id
			 ,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




