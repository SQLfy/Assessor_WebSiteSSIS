




CREATE VIEW [drcog].[v_drcog_value]
AS
SELECT account_no, tax_year, sum(actual_value) imp_value
FROM [assessor_app].[asr_app].[value] v
WHERE 1 = 1
--AND account_no = 'R0000799'
AND tax_year = 2018
GROUP BY account_no, tax_year





