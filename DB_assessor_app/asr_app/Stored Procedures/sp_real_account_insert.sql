




CREATE PROCEDURE [asr_app].[sp_real_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the asr_app real_account table

Mod #:  2
Mod Date:     6/23/2016
Developer:    Richard Edwards
Comments:	  Add Building count
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_app.real_account AS myTarget
USING assessor_datastore.asr_app_query.v_real_account AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET
		 myTarget.no_of_buildings = mySource.no_of_buildings
		,myTarget.vacant_flag = mySource.vacant_flag
		,myTarget.improvement_only_flag = mySource.improvement_only_flag
		,myTarget.tif_flag = mySource.tif_flag
		,myTarget.zoning_code = mySource.zoning_code
		,myTarget.zoning_code_description = mySource.zoning_code_description
		,myTarget.platted_flag = mySource.platted_flag
		,myTarget.default_lea = mySource.default_lea
		,myTarget.default_lea_description = mySource.default_lea_description
		,myTarget.total_improvement_interest_percent = mySource.total_improvement_interest_percent
		,myTarget.total_land_interest_percent = mySource.total_land_interest_percent
		,myTarget.update_datetime = GETDATE()
		,myTarget.update_user_id = SUSER_NAME()
		,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,no_of_buildings
            ,vacant_flag
            ,improvement_only_flag
            ,tif_flag
            ,zoning_code
            ,zoning_code_description
            ,platted_flag
            ,default_lea
            ,default_lea_description
			,total_improvement_interest_percent
			,total_land_interest_percent
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.account_no
	        ,mySource.no_of_buildings 
            ,mySource.vacant_flag
            ,mySource.improvement_only_flag
            ,mySource.tif_flag
            ,mySource.zoning_code
            ,mySource.zoning_code_description
            ,mySource.platted_flag
            ,mySource.default_lea
            ,mySource.default_lea_description
			,mySource.total_improvement_interest_percent
			,mySource.total_land_interest_percent
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







