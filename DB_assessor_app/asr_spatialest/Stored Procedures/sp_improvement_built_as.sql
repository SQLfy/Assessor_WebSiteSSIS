



CREATE PROCEDURE [asr_spatialest].[sp_improvement_built_as]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the improvement built as table for spatialist

	[account_no] [varchar](30) NOT NULL,
	[improvement_no] [numeric](5, 0) NOT NULL,
	[built_as_detail_id] [numeric](15,0) NULL,
	[built_as_code_description] [varchar](100) NULL,
	[exterior_construction_type] [varchar](50) NULL,
	[no_of_story] [numeric](5, 2) NULL,
	[room_count] [numeric](7, 0) NULL,
	[bedroom_count] [numeric](7, 2) NULL,
	[total_unit_count] [numeric](7, 0) NULL,
	[built_year] [varchar](4) NULL,
	[built_as_sf] [numeric](15, 0) NULL,
	[bathroom_count] [numeric](7, 2) NULL,
	[heat_type] [varchar](50) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000)
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_spatialest.improvement_built_as AS myTarget
USING assessor_datastore.asr_spatialest_query.v_improvement_built_as AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
AND myTarget.built_as_detail_id = mySource.built_as_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.built_as_code_description = mySource.built_as_code_description
                  ,myTarget.exterior_construction_type = mySource.exterior_construction_type
				  ,myTarget.no_of_story = mySource.no_of_story
                  ,myTarget.room_count = mySource.room_count
                  ,myTarget.bedroom_count = mySource.bedroom_count
				  ,myTarget.total_unit_count = mySource.total_unit_count
				  ,myTarget.built_year = mySource.built_year
				  ,myTarget.built_as_sf = mySource.built_as_sf
				  ,myTarget.bathroom_count = mySource.bathroom_count
				  ,myTarget.heat_type = mySource.heat_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


			


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
               account_no
			  ,improvement_no
			  ,built_as_detail_id
			  ,built_as_code_description
			  ,exterior_construction_type
			  ,no_of_story
			  ,room_count
			  ,bedroom_count
			  ,total_unit_count
			  ,built_year
			  ,built_as_sf
			  ,bathroom_count
			  ,heat_type
			  ,create_datetime 
			  ,create_user_id
			  ,rowhash
            )
     VALUES (  mySource.account_no
			  ,mySource.improvement_no
			  ,mySource.built_as_detail_id
			  ,mySource.built_as_code_description
			  ,mySource.exterior_construction_type
			  ,mySource.no_of_story
			  ,mySource.room_count
			  ,mySource.bedroom_count
			  ,mySource.total_unit_count
			  ,mySource.built_year
			  ,mySource.built_as_sf
			  ,mySource.bathroom_count
			  ,mySource.heat_type
			  ,mySource.create_datetime 
			  ,mySource.create_user_id
			  ,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




