

CREATE PROCEDURE [trn].[sp_land_abstract_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the land_abstract table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.land_abstract AS myTarget
USING trn.v_etl_land_abstract AS mySource
ON   myTarget.account_no = mySource.account_no
AND  myTarget.abstract_code = mySource.abstract_code
AND  myTarget.land_abstract_detail_id = mySource.land_abstract_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET
         myTarget.abstract_code = mySource.abstract_code
        ,myTarget.land_abstract_detail_id = mySource.land_abstract_detail_id
        ,myTarget.land_type = mySource.land_type
        ,myTarget.land_acres = mySource.land_acres
        ,myTarget.land_sf = mySource.land_sf
        ,myTarget.land_unit_count = mySource.land_unit_count
        ,myTarget.land_value_per = mySource.land_value_per
        ,myTarget.land_value = mySource.land_value
        ,myTarget.land_override_flag = mySource.land_override_flag
        ,myTarget.land_override_total = mySource.land_override_total
        ,myTarget.land_actual_value = mySource.land_actual_value
        ,myTarget.land_class = mySource.land_class
        ,myTarget.land_subclass = mySource.land_subclass
        ,myTarget.land_valued_by = mySource.land_valued_by
        ,myTarget.land_value_measure = mySource.land_value_measure
		,myTarget.update_datetime = GETDATE()
		,myTarget.update_user_id = SUSER_NAME()
		,myTarget.rowhash = mySource.rowhash
        ,myTarget.abstract_code_description = mySource.abstract_code_description

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
            ,abstract_code
            ,land_abstract_detail_id
            ,land_type
            ,land_acres
            ,land_sf
            ,land_unit_count
            ,land_value_per
            ,land_value
            ,land_override_flag
            ,land_override_total
            ,land_actual_value
            ,land_class
            ,land_subclass
            ,land_valued_by
            ,land_value_measure
	        ,create_datetime
			,create_user_id
	        ,rowhash
			,abstract_code_description
            )
     VALUES ( 
             mySource.account_no
            ,mySource.abstract_code
            ,mySource.land_abstract_detail_id
            ,mySource.land_type
            ,mySource.land_acres
            ,mySource.land_sf
            ,mySource.land_unit_count
            ,mySource.land_value_per
            ,mySource.land_value
            ,mySource.land_override_flag
            ,mySource.land_override_total
            ,mySource.land_actual_value
            ,mySource.land_class
            ,mySource.land_subclass
            ,mySource.land_valued_by
            ,mySource.land_value_measure
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,mySource.abstract_code_description
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;


