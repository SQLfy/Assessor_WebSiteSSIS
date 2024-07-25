
create view [asr_adv_search_query].[v_valuation_history_export_old_2] as
SELECT 
   fa.[account_no]
  ,fa.[state_parcel_no]
  ,v.[tax_year]
  ,v.[actual_value]
  ,v.[raw_assessed_value]
  FROM [assessor_datastore].[asr_adv_search_query].[flat_account] fa
  JOIN [asr_datastore].[value_from_tsgvacctabstvalue] v
  ON fa.account_no = v.account_no
