
CREATE PROCEDURE [trn].[sp_tsgn_value_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/22/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the tsgn value table
Mod #:  2
Mod Date:     4/22/2016
Developer:    Richard Edwards
Comments:	  Add account_type to account value table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.value AS myTarget
USING trn.v_etl_tsgn_value AS mySource
ON myTarget.account_no = mySource.account_no
 AND myTarget.tax_year = mySource.tax_year
 AND myTarget.value_group_code = mySource.value_group_code
 AND myTarget.tax_district_no = mySource.tax_district_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.raw_assessed_value = mySource.raw_assessed_value
				  ,myTarget.raw_tax_dollars = mySource.raw_tax_dollars
                  ,myTarget.actual_value = mySource.actual_value
                  ,myTarget.mill_levy = mySource.mill_levy
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.account_type = mySource.account_type


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             account_no
            ,tax_year
            ,value_group_code
            ,tax_district_no
            ,raw_assessed_value
			,raw_tax_dollars
            ,actual_value
            ,mill_levy
			,create_datetime
			,create_user_id
			,rowhash
			,account_type
            )
     VALUES (mySource.account_no
            ,mySource.tax_year
            ,mySource.value_group_code
            ,mySource.tax_district_no
            ,mySource.raw_assessed_value
			,mySource.raw_tax_dollars
            ,mySource.actual_value
            ,mySource.mill_levy
			,mySource.create_datetime
			,mySource.create_user_id
			,mySource.rowhash
			,mySource.account_type
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

