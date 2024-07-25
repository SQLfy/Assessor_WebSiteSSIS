
CREATE view [asr_adv_search_query].[v_parcel_values_export] as
SELECT distinct
       fa.[account_no]
      ,fa.[state_parcel_no]
	  ,v.[valuation_class_code]
	  ,vcc.[code_descr]
      ,vcc.[valuation_type_code]
      ,fa.[actual_value_sum]
      ,fa.[assessed_value_sum]
      ,fa.[net_acres_sum]
      ,fa.[primary_owner_name]
      ,fa.[primary_owner_address]
      ,fa.[primary_property_unit_no]
      ,fa.[primary_property_address_number]
      ,fa.[primary_property_address_number_suffix]
      ,fa.[primary_property_pre_direction_code]
      ,fa.[primary_property_street_name]
      ,fa.[primary_property_street_type_code]
      ,fa.[primary_property_post_direction_code]
      ,fa.[primary_property_city]
      ,fa.[primary_property_zip_code]
	  ,fa.primary_property_address_number + ' ' + ISNULL(fa.primary_property_address_number_suffix, '') + ' ' + ISNULL(fa.primary_property_pre_direction_code, '')  + ' ' +   fa.primary_property_street_name  + ' ' +  ISNULL(fa.primary_property_street_type_code, '')  + ' ' + ISNULL(fa.primary_property_post_direction_code, '')  + ' ' +  ISNULL(fa.primary_property_unit_no, '') as situs_street_address
      ,vfa.[owner_address_line_1] + ' ' + ISNULL(vfa.[owner_address_line_2], '')  as owner_street_address
      ,vfa.[owner_city_name]
      ,vfa.[owner_state]
      ,vfa.[owner_zip_code]  
  FROM [assessor_datastore].[asr_adv_search_query].[flat_account] fa
  JOIN [assessor_datastore].[asr_datastore].[value_from_tsgvacctabstvalue] v
  ON fa.account_no = v.account_no
  JOIN [dbo].[valuation_class_code] vcc
  ON v.valuation_class_code = vcc.valuation_class_code
   JOIN [asr_adv_search_query].[v_flat_account] vfa
  ON fa.account_no = vfa.account_no

