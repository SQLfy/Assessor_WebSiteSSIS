

CREATE VIEW [asr_open_data_query].[v_property_values]
AS
SELECT     ValueKey, ACCOUNT_NO, ACTUAL_VALUE, ASSESSED_VALUE, VALUATION_CLASS_CODE, VALUATION_DESCRIPTION, EXEMPT_FLAG, SUBTYPE, VALUATION_TYPE_CODE, ACCOUNT_TYPE, Location
FROM        (SELECT     ValueKey, ACCOUNT_NO, ACTUAL_VALUE, ASSESSED_VALUE, VALUATION_CLASS_CODE, VALUATION_DESCRIPTION, EXEMPT_FLAG, SUBTYPE, VALUATION_TYPE_CODE, ACCOUNT_TYPE, Location, ROW_NUMBER() OVER (PARTITION BY 
                                     ValueKey
                   ORDER BY SUBTYPE DESC) AS DedupKey
FROM        (SELECT DISTINCT 
                                     av.account_no AS ACCOUNT_NO, av.actual_value, av.assessed_value, av.valuation_class_code, av.valuation_class_code_description AS VALUATION_DESCRIPTION, vcc.exempt_flag, st.account_subtype_code AS SUBTYPE, ac.account_type, 
                                     vcc.valuation_type_code, isnull(cast(av.account_no AS varchar(max)), '') + isnull(cast(av.valuation_class_code AS varchar(max)), '') AS ValueKey
                   FROM        [assessor_datastore].[asr_datastore].[account] ac  LEFT JOIN
                                     [assessor_datastore].[asr_datastore].[account_valuation] av ON ac.account_no = av.account_no LEFT JOIN
                                     [assessor_datastore].[asr_datastore].[account_subtype_lkup] st ON ac.account_type = st.account_type_code LEFT JOIN
                                     [assessor_datastore].[dbo].[valuation_class_code] vcc ON av.valuation_class_code = vcc.valuation_class_code
                   WHERE     ac.account_status = 'A') a LEFT OUTER JOIN
                      (SELECT     *
                       FROM        (SELECT     Account_Number, location, row_number() OVER (partition BY Account_Number
                                          ORDER BY location) AS orderval
                       FROM        location.location_data) ld
WHERE     orderval = 1) b ON a.ACCOUNT_NO = b.Account_Number) x
WHERE     x.DedupKey = 1
AND	      ACCOUNT_NO IS NOT NULL
