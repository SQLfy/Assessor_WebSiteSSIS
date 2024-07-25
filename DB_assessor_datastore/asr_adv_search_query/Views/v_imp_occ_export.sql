


CREATE view [asr_adv_search_query].[v_imp_occ_export] as
SELECT DISTINCT
       fa.[account_no]
      ,fa.[state_parcel_no]
      ,fa.[account_type]
      ,fa.[primary_property_unit_no]
      ,fa.[primary_property_address_number]
      ,fa.[primary_property_address_number_suffix]
      ,fa.[primary_property_pre_direction_code]
      ,fa.[primary_property_street_name]
      ,fa.[primary_property_street_type_code]
      ,fa.[primary_property_post_direction_code]
      ,fa.[primary_property_city]
      ,fa.[primary_property_zip_code]
      ,vb.[condition_type]
      ,vb.[build_quality]
      ,vb.[completed_percent]
      ,vbu.[use_code]
      ,vbu.[use_code_description]
	  ,fa.primary_property_address_number + ' ' + ISNULL(fa.primary_property_address_number_suffix, '') + ' ' + ISNULL(fa.primary_property_pre_direction_code, '')  + ' ' +   fa.primary_property_street_name  + ' ' +  ISNULL(fa.primary_property_street_type_code, '')  + ' ' + ISNULL(fa.primary_property_post_direction_code, '')  + ' ' +  ISNULL(fa.primary_property_unit_no, '') as situs_street_address
      ,vfa.[owner_address_line_1] + ' ' + ISNULL(vfa.[owner_address_line_2], '')  as owner_street_address
      ,vfa.[owner_city_name]
      ,vfa.[owner_state]
      ,vfa.[owner_zip_code] 
	  ,vfa.[primary_owner_name]
      ,vb.[property_type]
      ,vbu.[use_percentage]
FROM [assessor_datastore].[asr_adv_search_query].[flat_account] fa
JOIN [asr_adv_search_query].[v_building] vb
ON fa.account_no = vb.account_no
JOIN [asr_adv_search_query].[v_building_use] vbu
ON fa.account_no = vbu.account_number
 JOIN [asr_adv_search_query].[v_flat_account] vfa
  ON fa.account_no = vfa.account_no



