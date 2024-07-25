

CREATE VIEW drcog.[v_drcog_improvement_built_as]
AS
SELECT account_no, sum(total_unit_count) units
FROM assessor_app.asr_app.improvement_built_as ib
--WHERE ACCOUNT_NO = 'R0000799'
GROUP BY account_no





