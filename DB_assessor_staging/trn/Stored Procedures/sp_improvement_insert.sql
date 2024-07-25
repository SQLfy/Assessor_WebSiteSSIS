


CREATE PROCEDURE [trn].[sp_improvement_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/2/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the improvement table
*************************************************************************************/
/**************************************************************************************
Mod #:  2
Mod Date:      7/25/2016
Developer:     Richard Edwards
Comments:      Add primary_flag column
*************************************************************************************/
/**************************************************************************************
Mod #:  3
Mod Date:      8/22/2016
Developer:     Richard Edwards
Comments:      Add improvement_unit_type column
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.improvement AS myTarget
USING trn.v_etl_improvement AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.completed_percent = mySource.completed_percent
                  ,myTarget.improvement_quality = mySource.improvement_quality
                  ,myTarget.improvement_perimeter = mySource.improvement_perimeter
                  ,myTarget.improvement_sf = mySource.improvement_sf
                  ,myTarget.improvement_net_sf = mySource.improvement_net_sf
                  ,myTarget.property_type = mySource.property_type
                  ,myTarget.condition_type = mySource.condition_type
                  ,myTarget.approach_type = mySource.approach_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.primary_flag = mySource.primary_flag
				  ,myTarget.improvement_unit_type = mySource.improvement_unit_type
WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
            ,improvement_no
            ,completed_percent
            ,improvement_quality
            ,improvement_perimeter
            ,improvement_sf
            ,improvement_net_sf
            ,property_type
            ,condition_type
            ,approach_type
	        ,create_datetime 
			,create_user_id 
	        ,rowhash
			,primary_flag 
			,improvement_unit_type
            )
     VALUES (mySource.account_no
            ,mySource.improvement_no
            ,mySource.completed_percent
            ,mySource.improvement_quality
            ,mySource.improvement_perimeter
            ,mySource.improvement_sf
            ,mySource.improvement_net_sf
            ,mySource.property_type
            ,mySource.condition_type
            ,mySource.approach_type
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,mySource.primary_flag
			,mySource.improvement_unit_type
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




