CREATE PROCEDURE [trn].[sp_tsgn_value_from_tsgvacctabstvalue_insert]
AS /**************************************Comments***************************************
Mod #:	Mod Date:	Developer:			Comments:
1		9/30/2016	Richard Edwards		Initial creation
										Merge changes into the value_from_tsgvacctabstvalue value table
2		10/7/2016	Richard Edwards		Add net_acres column
3		05/25/2017	Richard Edwards		Removed delete from merge
4		09/01/2017	Tony Golden			ADDED the delete code lines below so that current tax year values are deleted then fully reloaded.  
										This will resolve issues that occur when abstract codes are changed on a valuation. 
5		05/30/2018	Tony Golden			ADDED valuation class code description.  This is needed in advanced search reporting.
6		02/02/2023	Paul Mathews		Added Column ASSESSMENTRATIO as assessment_rate
*************************************************************************************/
SET NOCOUNT ON;

-- AJG 9/1/2017 - ADDED the delete code lines below so that current tax year values are deleted then fully reloaded.  This will
-- resolve issues that occur when abstract codes are changed on a valuation. 
DELETE FROM assessor_datastore.asr_datastore.value_from_tsgvacctabstvalue
  WHERE tax_year = (SELECT PARAMETER_VALUE FROM  [assessor_staging].[asr_staging].[etl_parameter] WHERE PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR')

-------

MERGE assessor_datastore.asr_datastore.value_from_tsgvacctabstvalue AS myTarget
USING [assessor_staging].[trn].[v_etl_tsgn_value_from_tsgvacctabstvalue] AS mySource
ON myTarget.account_no = mySource.account_no
 AND myTarget.tax_year = mySource.tax_year
 AND myTarget.valuation_class_code = mySource.valuation_class_code
 AND myTarget.tax_district_no = mySource.tax_district_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.raw_assessed_value = mySource.raw_assessed_value
				  ,myTarget.raw_tax_dollars = mySource.raw_tax_dollars
                  ,myTarget.actual_value = mySource.actual_value
                  ,myTarget.mill_levy = mySource.mill_levy
				  ,myTarget.net_acres = mySource.net_acres
				  ,myTarget.valuation_class_code_description = mySource.valuation_class_code_description
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.account_type = mySource.account_type
				  ,myTarget.assessment_rate = mySource.assessment_rate

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             account_no
            ,tax_year
            ,valuation_class_code
            ,tax_district_no
            ,raw_assessed_value
			,raw_tax_dollars
            ,actual_value
            ,mill_levy
			,net_acres
			,valuation_class_code_description
			,create_datetime
			,create_user_id
			,rowhash
			,account_type
			,assessment_rate 
            )
     VALUES (mySource.account_no
            ,mySource.tax_year
            ,mySource.valuation_class_code
            ,mySource.tax_district_no
            ,mySource.raw_assessed_value
			,mySource.raw_tax_dollars
            ,mySource.actual_value
            ,mySource.mill_levy
			,mySource.net_acres
			,mySource.valuation_class_code_description
			,mySource.create_datetime
			,mySource.create_user_id
			,mySource.rowhash
			,mySource.account_type
			,mySource.assessment_rate
            );

--WHEN NOT MATCHED BY SOURCE 
--     THEN
--	 DELETE;


