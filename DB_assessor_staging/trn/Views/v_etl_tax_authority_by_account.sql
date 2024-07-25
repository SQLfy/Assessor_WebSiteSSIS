CREATE VIEW [trn].[v_etl_tax_authority_by_account]
--WITH SCHEMABINDING 
AS
SELECT distinct a.account_no
      ,a.tax_district_no
      ,isnull((SELECT tax_authority_no
                     FROM [trn].[v_etl_tax_district_authority] tda
                     WHERE tda.tax_authority_no in
							(select distinct associated_tax_authority_no from asr_staging.azure_building_permit_authority)
                      AND  a.tax_district_no = tda.tax_district_no), '0001')  tax_authority
FROM assessor_datastore.asr_datastore.account a





