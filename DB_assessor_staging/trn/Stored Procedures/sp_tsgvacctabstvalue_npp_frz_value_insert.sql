

CREATE PROCEDURE [trn].[sp_tsgvacctabstvalue_npp_frz_value_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/13/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the tsgvacctabstvalue_npp_frz table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.tsgvacctabstvalue_npp_frz AS myTarget
USING trn.v_etl_tsgvacctabstvalue_npp_frz AS mySource
ON myTarget.seq_id = mySource.seq_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.version_start_date = mySource.version_start_date
		          ,myTarget.version_end_date = mySource.version_end_date
				  ,myTarget.account_no = mySource.account_no
				  ,myTarget.abstract_code = mySource.abstract_code
				  ,myTarget.tax_year = mySource.tax_year
				  ,myTarget.actual_value = mySource.actual_value
		          ,myTarget.raw_assessed_value = mySource.raw_assessed_value
				  ,myTarget.new_construction_value_change = mySource.new_construction_value_change
                  ,myTarget.new_construction_value_change_assessed = mySource.new_construction_value_change_assessed
                  ,myTarget.jurisdiction_id = mySource.jurisdiction_id
				  ,myTarget.write_date = mySource.write_date
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.abstract_code_description = mySource.abstract_code_description


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
	         seq_id
			,version_start_date
			,version_end_date
            ,account_no
			,abstract_code
            ,tax_year
			,actual_value
            ,raw_assessed_value
			,new_construction_value_change
            ,new_construction_value_change_assessed
            ,jurisdiction_id
			,write_date
			,create_datetime
			,create_user_id
			,rowhash
			,abstract_code_description
            )
     VALUES (mySource.seq_id
			,mySource.version_start_date
			,mySource.version_end_date
            ,mySource.account_no
			,mySource.abstract_code
            ,mySource.tax_year
			,mySource.actual_value
            ,mySource.raw_assessed_value
			,mySource.new_construction_value_change
            ,mySource.new_construction_value_change_assessed
            ,mySource.jurisdiction_id
			,mySource.write_date
			,mySource.create_datetime
			,mySource.create_user_id
			,mySource.rowhash
			,mySource.abstract_code_description
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;


