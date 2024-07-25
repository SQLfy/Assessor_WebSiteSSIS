create view [asr_adv_search_query].[v_taxable_value] as
  SELECT 
   fa.[account_no]
  ,fa.[state_parcel_no]
  ,v.[tax_year]
  ,sum(v.[actual_value])as taxable_actual_value
  ,sum(v.[raw_assessed_value]) as taxable_raw_assessed_value
  FROM [assessor_datastore].[asr_adv_search_query].[flat_account] fa
  JOIN [asr_datastore].[value_from_tsgvacctabstvalue] v
  ON fa.account_no = v.account_no
  and v.valuation_class_code NOT LIKE '9%'
  group by fa.account_no, state_parcel_no, tax_year