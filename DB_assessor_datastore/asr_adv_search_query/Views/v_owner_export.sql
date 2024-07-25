




CREATE view [asr_adv_search_query].[v_owner_export] as
 /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     6/24/2020
Developer:    David Guillen
Comments:     Add default_lea, neighborhood_code, neighborhood_extension

*************************************************************************************/
SELECT 
       fa.[account_no]
      ,fa.[state_parcel_no]
      ,fa.[account_type]
      ,SUM(v.[actual_value]) as actual_value
      ,SUM(v.[raw_assessed_value]) as raw_assessed_value
      ,fa.[legal_description]
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
	  ,ra.default_lea
	  ,an.neighborhood_code ,an.neighborhood_extension
  FROM [assessor_datastore].[asr_adv_search_query].[flat_account] fa
  JOIN [asr_datastore].[value_from_tsgvacctabstvalue] v
  ON fa.account_no = v.account_no
  JOIN [asr_adv_search_query].[v_flat_account] vfa
  ON fa.account_no = vfa.account_no
  LEFT OUTER JOIN [assessor_datastore].[asr_datastore].[real_account] ra
  ON fa.account_no = ra.account_no
  LEFT OUTER JOIN [assessor_datastore].[asr_datastore].[account_neighborhood] an
  ON fa.account_no = an.account_no
  where v.tax_year = (SELECT YEAR(GETDATE()))
  group by
  fa.[account_no]
      ,fa.[state_parcel_no]
      ,fa.[account_type]
	   ,fa.[legal_description]
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
	   ,vfa.[owner_city_name]
      ,vfa.[owner_state]
      ,vfa.[owner_zip_code]  
	  ,vfa.[owner_address_line_1]
	  ,vfa.[owner_address_line_2]
	  ,ra.default_lea
	  ,an.neighborhood_code ,an.neighborhood_extension
	







