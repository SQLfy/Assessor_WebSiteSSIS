








CREATE PROCEDURE [asr_spatialest].[sp_land_abstract_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/29/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the land abstract table in spatialist

	
	[account_no] [varchar](30) NOT NULL,
	[abstract_code] [varchar](50) NOT NULL,
	[land_abstract_detail_id] [numeric](15, 0) NOT NULL,
	[land_type] [varchar](50) NULL,
	[land_acres] [numeric](20, 6) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,

*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_spatialest.land_abstract AS myTarget
USING assessor_datastore.asr_spatialest_query.v_land_abstract AS mySource
ON   myTarget.account_no = mySource.account_no
AND  myTarget.abstract_code = mySource.abstract_code
AND  myTarget.land_abstract_detail_id = mySource.land_abstract_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	
	 THEN
        UPDATE SET myTarget.land_type = mySource.land_type
				  ,myTarget.land_acres = mySource.land_acres
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
			,abstract_code
			,land_abstract_detail_id
	        ,land_type
			,land_acres
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES (mySource.account_no 
	        ,mySource.abstract_code
			,mySource.land_abstract_detail_id
            ,mySource.land_type
			,mySource.land_acres
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;






