

CREATE VIEW drcog.[v_drcog_improvement_detail]
AS
SELECT * FROM assessor_app.asr_app.improvement_detail idet
WHERE 1=1
--AND account_no = 'R0000799'
AND improvement_detail_type like '%Basement%' 
AND improvement_detail_type_description like '%Bsmnt%'





