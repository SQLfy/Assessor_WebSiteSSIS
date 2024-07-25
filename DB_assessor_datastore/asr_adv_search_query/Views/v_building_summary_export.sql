


CREATE view [asr_adv_search_query].[v_building_summary_export] as
SELECT DISTINCT
       fa.[account_no]
      ,fa.[state_parcel_no]
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
      ,vbs.[built_as_sf]
      ,vb.[building_number]
      ,vb.[property_type]
      ,vb.[build_quality]
      ,vb.[fireplaces]
      ,vb.[basement_walkout]
      ,vb.[basement_finished_square_feet]
      ,vb.[basement_total_square_feet] - [basement_finished_square_feet] as basement_unfinished_square_feet
      ,vb.[completed_percent]
      ,vb.[building_unit_type]
	  ,fa.primary_property_address_number + ' ' + ISNULL(fa.primary_property_address_number_suffix, '') + ' ' + ISNULL(fa.primary_property_pre_direction_code, '')  + ' ' +   fa.primary_property_street_name  + ' ' +  ISNULL(fa.primary_property_street_type_code, '')  + ' ' + ISNULL(fa.primary_property_post_direction_code, '')  + ' ' +  ISNULL(fa.primary_property_unit_no, '') as situs_street_address
      ,vfa.[owner_address_line_1] + ' ' + ISNULL(vfa.[owner_address_line_2], '')  as owner_street_address
      ,vfa.[owner_city_name]
      ,vfa.[owner_state]
      ,vfa.[owner_zip_code] 
   ,ids.[garage_sf]
   ,ids.[finished_basement_sf]
   ,ids.[unfinished_basement_sf]
   ,ids.[finished_basement_sf] + ids.[unfinished_basement_sf] as basement_sf
   ,ids.[total_porch_sf]
   ,ids.[finished_basement_pct]
   ,ids.[unfinished_basement_pct]
	  ,i.[improvement_sf]
  FROM [assessor_datastore].[asr_adv_search_query].[flat_account] fa
  JOIN [asr_adv_search_query].[v_building] vb
  ON fa.account_no = vb.account_no
  JOIN [asr_adv_search_query].[v_building_style] vbs
  ON fa.account_no = vbs.account_number
   JOIN [asr_adv_search_query].[v_flat_account] vfa
  ON fa.account_no = vfa.account_no
 LEFT OUTER JOIN [asr_datastore].[improvement_detail_stage] ids
  ON fa.account_no = ids.account_no
  JOIN [asr_datastore].[improvement] i
  on fa.account_no = i.account_no




