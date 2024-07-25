




CREATE PROCEDURE [trn].[sp_account_valuation_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/20/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the account_valuation table
Mod #:  2
Mod Date:     8/30/2016
Developer:    Richard Edwards
Comments:	  Add account_type to account valuation table

Mod #:  3
Mod Date:     3/6/2018
Developer:    Richard Edwards
Comments:	  Add valuation_type_code to account valuation table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.account_valuation AS myTarget
USING trn.v_etl_account_valuation AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.valuation_class_code = mySource.valuation_class_code
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.actual_value = mySource.actual_value
		          ,myTarget.assessed_value = mySource.assessed_value
				  ,myTarget.net_acres = mySource.net_acres
				  ,myTarget.new_growth_flag = mySource.new_growth_flag
				  ,myTarget.valuation_class_code_description = mySource.valuation_class_code_description
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.account_type = mySource.account_type
				  ,myTarget.valuation_type_code = mySource.valuation_type_code


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,valuation_class_code
			,valuation_type_code
	        ,actual_value
	        ,assessed_value
			,net_acres
			,new_growth_flag
	        ,valuation_class_code_description
	        ,create_datetime
			,create_user_id
	        ,rowhash
			,account_type
            )
     VALUES (mySource.account_no 
	        ,mySource.valuation_class_code
			,mySource.valuation_type_code
	        ,mySource.actual_value
	        ,mySource.assessed_value
			,mySource.net_acres
			,mySource.new_growth_flag
	        ,mySource.valuation_class_code_description
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,account_type
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





