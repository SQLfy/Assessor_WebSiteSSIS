



CREATE view [asr_adv_search_query].[v_valuation_history_export] as
SELECT 
   av.[account_no]
  ,av.[state_parcel_no]
  ,av.[tax_year]
  ,av.[actual_value]
  ,av.[raw_assessed_value]
  ,ISNULL(tv.[taxable_actual_value], 0) as taxable_value
  ,ISNULL(tv.[taxable_raw_assessed_value], 0) as taxable_assessed_value
   FROM [asr_adv_search_query].[v_actual_value] av
  LEFT OUTER JOIN [asr_adv_search_query].[v_taxable_value] tv
  ON av.account_no = tv.account_no
  AND av.tax_year = tv.tax_year
  WHERE CAST(av.tax_year as int) >= (DATEPART(Year,getdate())-9)
