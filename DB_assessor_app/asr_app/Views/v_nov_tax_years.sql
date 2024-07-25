



CREATE VIEW [asr_app].[v_nov_tax_years]
AS
SELECT        DISTINCT ISNULL(CAST(TAXYEAR AS varchar),'2099') AS TaxYear
FROM            asr_app.realnov





