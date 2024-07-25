
CREATE VIEW [trn].[v_etl_account_tax_authority] 
AS
SELECT distinct a.accountno account_no
      ,a.defaulttaxdistrict tax_district_no
      ,isnull((SELECT top(1) tax_authority_no
                     FROM [trn].[v_etl_tax_district_authority] tda
                     WHERE tda.tax_authority_no in
							(select distinct associated_tax_authority_no from asr_staging.azure_building_permit_authority where associated_tax_authority_no <> '0001')
                      AND  a.defaulttaxdistrict = tda.tax_district_no), '0001')  tax_authority
FROM [dqm].[q_tblacct] a  --AJG fix on 9/21










