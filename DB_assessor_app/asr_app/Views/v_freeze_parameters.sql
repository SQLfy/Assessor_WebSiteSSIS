
CREATE VIEW [asr_app].[v_freeze_parameters]
AS
SELECT        parameter_name, parameter_value
FROM            asr_app.etl_parameter
WHERE        (parameter_name LIKE '%FREEZE%')

