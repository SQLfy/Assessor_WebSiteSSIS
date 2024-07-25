


CREATE PROCEDURE [trn].[sp_tsgn_value_from_tsgvacctabstvalue_sa_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     01/12/2018
Developer:    Tony Golden
Comments:	  Initial creation
              Load value_from_tsgvacctabstvalue_state_assessed value table



*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE assessor_datastore.asr_datastore.value_from_tsgvacctabstvalue_state_assessed

INSERT INTO assessor_datastore.asr_datastore.value_from_tsgvacctabstvalue_state_assessed
	      (
             account_no
			, tax_year
			, valuation_class_code
			, tax_district_no
			, raw_assessed_value
			, raw_tax_dollars
			, actual_value
			, mill_levy
			, create_datetime
			, create_user_id
			, update_datetime
			, update_user_id
			, rowhash
			, account_type
			, net_acres 
            )
     SELECT 
	   account_no
      ,tax_year
      ,valuation_class_code
      ,tax_district_no
      ,raw_assessed_value
      ,raw_tax_dollars
      ,actual_value
      ,mill_levy
      ,create_datetime
      ,create_user_id
	  ,null
	  ,null
	  ,rowhash
	  ,account_type
      ,net_acres
  FROM assessor_staging.trn.v_etl_tsgn_value_from_tsgvacctabstvalue_sa;

