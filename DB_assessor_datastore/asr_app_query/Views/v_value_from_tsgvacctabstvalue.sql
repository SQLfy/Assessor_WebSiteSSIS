CREATE VIEW [asr_app_query].[v_value_from_tsgvacctabstvalue]
AS

SELECT v.account_no
        , a.account_type
        , v.tax_year
        , v.valuation_class_code
        , v.tax_district_no
        , v.raw_assessed_value
        , v.raw_tax_dollars
        , v.actual_value
        , v.mill_levy
        , v.net_acres
        , v.create_datetime
        , v.create_user_id
        , v.update_datetime
        , v.update_user_id
        , v.rowhash
        , ab.ABSTRACTDESCRIPTION AS valuation_class_code_description
		, v.assessment_rate
FROM   asr_datastore.value_from_tsgvacctabstvalue AS v 
	LEFT OUTER JOIN [assessor_staging].[asr_staging].[s_tlkpabstractcode] ab ON v.valuation_class_code = ab.ABSTRACTCODE 
	INNER JOIN asr_datastore.account AS a ON v.account_no = a.account_no
WHERE  (a.account_status = 'A') 



