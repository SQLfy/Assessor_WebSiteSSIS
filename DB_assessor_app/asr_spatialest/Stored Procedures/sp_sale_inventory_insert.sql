
CREATE PROCEDURE [asr_spatialest].[sp_sale_inventory_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the sale inventory table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_spatialest.sale_inventory AS myTarget
USING assessor_datastore.asr_spatialest_query.v_sale_inventory AS mySource
ON myTarget.recording_no = mySource.recording_no
 AND myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET 
                 
				   myTarget.property_type = mySource.property_type
                  ,myTarget.improvement_quality = mySource.improvement_quality 
				  ,myTarget.built_as_description = mySource.built_as_description
                  ,myTarget.improvement_abstract_code_description = mySource.improvement_abstract_code_description
				  ,myTarget.built_as_year_built = mySource.built_as_year_built
				  ,myTarget.built_as_total_unit_count = mySource.built_as_total_unit_count
                  ,myTarget.bath_count = mySource.bath_count
				  ,myTarget.bedroom_count = mySource.bedroom_count
				  ,myTarget.total_finished_square_footage = mySource.total_finished_square_footage
				  ,myTarget.land_net_acre_count = mySource.land_net_acre_count
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             recording_no
            ,account_no
            ,property_type
            ,improvement_quality
			,built_as_description
            ,improvement_abstract_code_description
            ,built_as_year_built
			,built_as_total_unit_count
			,bath_count
			,bedroom_count
			,total_finished_square_footage
			,land_net_acre_count          
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.recording_no
            ,mySource.account_no
            ,mySource.property_type
            ,mySource.improvement_quality
			,mySource.built_as_description
            ,mySource.improvement_abstract_code_description
            ,mySource.built_as_year_built
            ,mySource.built_as_total_unit_count
		    ,mySource.bath_count
            ,mySource.bedroom_count
            ,mySource.total_finished_square_footage      
            ,mySource.land_net_acre_count
	        ,mySource.create_datetime
			,mySource.create_user_id
	        ,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

