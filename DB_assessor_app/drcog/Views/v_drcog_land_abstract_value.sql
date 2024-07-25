



CREATE VIEW [drcog].[v_drcog_land_abstract_value]
AS
SELECT account_no, sum(land_value) total_land_value
FROM assessor_app.asr_app.land_abstract la
--WHERE account_no = 'R0000799'
GROUP BY account_no





