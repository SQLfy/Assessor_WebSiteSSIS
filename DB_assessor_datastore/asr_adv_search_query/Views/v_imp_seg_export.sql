



CREATE view [asr_adv_search_query].[v_imp_seg_export] as
SELECT DISTINCT
       fa.[account_no]
      ,fa.[state_parcel_no]
      ,fa.[account_type]
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
      ,vb.[build_quality]
      ,vb.[completed_percent]
      ,vbs.[building_number]
      ,vbs.[style_code_description]
      ,vbs.[built_as_sf]
      ,vbs.[built_year]
      ,vbs.[roof_construction_type]
      ,vbs.[heat_type]
      ,vbs.[exterior_construction_type]
      ,vbs.[interior_finish_type]
      ,vbs.[number_of_stories]
      ,vbs.[roof_material_type]
      ,vbs.[floor_material_type]
      ,vbs.[bedroom_count]
      ,vbs.[bathroom_count]
	  ,fa.primary_property_address_number + ' ' + ISNULL(fa.primary_property_address_number_suffix, '') + ' ' + ISNULL(fa.primary_property_pre_direction_code, '')  + ' ' +   fa.primary_property_street_name  + ' ' +  ISNULL(fa.primary_property_street_type_code, '')  + ' ' + ISNULL(fa.primary_property_post_direction_code, '')  + ' ' +  ISNULL(fa.primary_property_unit_no, '') as situs_street_address
      ,vfa.[owner_address_line_1] + ' ' + ISNULL(vfa.[owner_address_line_2], '')  as owner_street_address
      ,vfa.[owner_city_name]
      ,vfa.[owner_state]
      ,vfa.[owner_zip_code]
	     ,vb.[property_type]
,i.[improvement_sf]
  FROM [assessor_datastore].[asr_adv_search_query].[flat_account] fa
  JOIN [asr_adv_search_query].[v_building] vb
  ON fa.account_no = vb.account_no
  JOIN [asr_adv_search_query].[v_building_style] vbs
  ON fa.account_no = vbs.account_number
   JOIN [asr_adv_search_query].[v_flat_account] vfa
  ON fa.account_no = vfa.account_no
  		 JOIN [asr_datastore].[improvement] i
  ON fa.account_no = i.account_no
    WHERE vb.building_number = i.improvement_no
  AND vb.building_number = vbs.building_number



