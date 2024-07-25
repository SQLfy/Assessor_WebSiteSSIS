




CREATE VIEW [drcog].[v_drcog_sale_data_by_account]
AS
SELECT sa.account_no, MAX(sa.recording_no) max_recording_no, MAX(sale_date) max_sale_date, SUM(s.sale_price) total_sale_price
FROM assessor_app.asr_app.sale_account sa, assessor_app.asr_app.sale s 
WHERE 1=1 
--AND account_no = 'R0000799'
AND sa.recording_no = s.recording_no
GROUP BY sa.account_no






