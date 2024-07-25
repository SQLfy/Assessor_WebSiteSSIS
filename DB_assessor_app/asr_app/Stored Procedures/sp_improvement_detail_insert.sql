



CREATE PROCEDURE [asr_app].[sp_improvement_detail_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the improvement_detail table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_app.improvement_detail AS myTarget
USING assessor_datastore.asr_app_query.v_improvement_detail AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
AND myTarget.improvement_detail_id = mySource.improvement_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.improvement_detail_id = mySource.improvement_detail_id
                  ,myTarget.improvement_detail_type = mySource.improvement_detail_type
                  ,myTarget.improvement_detail_type_description = mySource.improvement_detail_type_description
                  ,myTarget.detail_unit_count = mySource.detail_unit_count
                  ,myTarget.addon_code = mySource.addon_code
                  ,myTarget.addon_code_description = mySource.addon_code_description
                  ,myTarget.detail_built_year = mySource.detail_built_year
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
            ,improvement_no
            ,improvement_detail_id
            ,improvement_detail_type
            ,improvement_detail_type_description
            ,detail_unit_count
            ,addon_code
            ,addon_code_description
            ,detail_built_year
	        ,create_datetime 
			,create_user_id 
	        ,rowhash 
            )
     VALUES (mySource.account_no
            ,mySource.improvement_no
            ,mySource.improvement_detail_id
            ,mySource.improvement_detail_type
            ,mySource.improvement_detail_type_description
            ,mySource.detail_unit_count
            ,mySource.addon_code
            ,mySource.addon_code_description
            ,mySource.detail_built_year
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE
OPTION (MERGE JOIN);






