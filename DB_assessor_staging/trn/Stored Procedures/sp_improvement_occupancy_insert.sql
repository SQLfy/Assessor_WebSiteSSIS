


CREATE PROCEDURE [trn].[sp_improvement_occupancy_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/3/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the improvement_occupancy table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.improvement_occupancy AS myTarget
USING trn.v_etl_improvement_occupancy AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
AND myTarget.occupancy_detail_id =  mySource.occupancy_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.occupancy_detail_id = mySource.occupancy_detail_id
                  ,myTarget.occupancy_code = mySource.occupancy_code
                  ,myTarget.occupancy_code_description = mySource.occupancy_code_description
                  ,myTarget.occupancy_percent = mySource.occupancy_percent
                  ,myTarget.abstract_code = mySource.abstract_code
                  ,myTarget.abstract_code_description = mySource.abstract_code_description
                  ,myTarget.abstract_value = mySource.abstract_value
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.primary_flag = mySource.primary_flag

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (   
             account_no
            ,improvement_no
            ,occupancy_detail_id
            ,occupancy_code
            ,occupancy_code_description
            ,occupancy_percent
            ,abstract_code
            ,abstract_code_description
            ,abstract_value
	        ,create_datetime 
			,create_user_id 
	        ,rowhash
			,primary_flag 
            )
     VALUES ( 
             mySource. account_no
            ,mySource.improvement_no
            ,mySource.occupancy_detail_id
            ,mySource.occupancy_code
            ,mySource.occupancy_code_description
            ,mySource.occupancy_percent
            ,mySource.abstract_code
            ,mySource.abstract_code_description
            ,mySource.abstract_value
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,mySource.primary_flag
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;






