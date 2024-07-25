



CREATE view [asr_adv_search_query].[v_sales_export] as
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      6/24/2020
Developer:     David Guillen
Comments:      Add exclude_code_2, exclude_code_2_description, and multi_parcel_flag

*************************************************************************************/
SELECT
       fa.account_no
	  ,s.[recording_no]
	  ,fa.[state_parcel_no]
      ,fa.[account_type]
      ,fa.[primary_owner_name]
      ,fa.[primary_owner_address]
      ,s.[grantor]
      ,s.[grantee]
      ,s.[sale_date]
	  ,s.[sale_price]
      ,s.[deed_code_description]
      ,s.[book]
      ,s.[page]
      ,s.[improved_flag]
      ,s.[valid1_flag]
	  ,s.[exclude_code_1]
      ,s.[exclude_code_1_description]
	  ,s.[exclude_code_2]
      ,s.[exclude_code_2_description]
	  ,CAST(CASE WHEN s.[exclude_code_1] IN (64,80) THEN 1
	        WHEN s.[exclude_code_2] IN (64,80) THEN 1
		    ELSE 0 
			END AS bit) as multi_parcel_flag
	  ,fa.[net_acres_sum]
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
  FROM [assessor_datastore].[asr_adv_search_query].[flat_account] as fa
  JOIN [assessor_datastore].[asr_datastore].[sale_account] as sa
	ON fa.account_no = sa.account_no
  JOIN [assessor_datastore].[asr_datastore].[sale] s
   ON sa.recording_no = s.recording_no
    JOIN [asr_adv_search_query].[v_flat_account] vfa
  ON fa.account_no = vfa.account_no
