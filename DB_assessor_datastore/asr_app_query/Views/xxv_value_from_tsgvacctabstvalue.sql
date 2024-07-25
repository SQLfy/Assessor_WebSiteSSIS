

CREATE VIEW [asr_app_query].[xxv_value_from_tsgvacctabstvalue]
AS

SELECT v.account_no, a.account_type, v.tax_year, v.valuation_class_code, v.tax_district_no, v.raw_assessed_value, 
       v.raw_tax_dollars, v.actual_value, v.mill_levy, v.create_datetime, v.create_user_id, v.update_datetime, 
       v.update_user_id, v.rowhash
FROM   asr_datastore.value_from_tsgvacctabstvalue AS v INNER JOIN
       asr_datastore.account AS a ON v.account_no = a.account_no
WHERE  (a.account_status = 'A') 

