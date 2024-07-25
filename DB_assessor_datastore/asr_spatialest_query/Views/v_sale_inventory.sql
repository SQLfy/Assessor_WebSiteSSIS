











CREATE VIEW [asr_spatialest_query].[v_sale_inventory]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access sale inventory for loading data into
			   the asssessor_app database for Spatialist
Mod #:  2
Mod Date:      8/23/2016
Developer:     Richard Edwards
Comments:      Add CSVClean function to remove problem characters for Spatialest CSV format
*************************************************************************************/
AS
select si.recording_no
, si.account_no
, si.property_type
, si.improvement_quality
, dbo.fn_CSVClean(si.built_as_description) AS built_as_description
, dbo.fn_CSVClean(si.improvement_abstract_code_description) AS improvement_abstract_code_description
, si.built_as_year_built
, si.built_as_total_unit_count
, si.bath_count
, si.bedroom_count
, si.total_finished_square_footage
, si.land_net_acre_count
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, HASHBYTES('SHA2_256', ISNULL(RTRIM(si.recording_no), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(si.account_no),'DBNULL_TEXT') 
  + ISNULL(RTRIM(si.property_type), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(si.improvement_quality), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(si.built_as_description)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(si.improvement_abstract_code_description)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(si.built_as_year_built), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(si.built_as_total_unit_count),'DBNULL_TEXT') 
  + ISNULL(RTRIM(si.bath_count), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(si.bedroom_count), 'DBNULL_TEXT')
  + ISNULL(RTRIM(si.total_finished_square_footage), 'DBNULL_TEXT')
  + ISNULL(RTRIM(si.land_net_acre_count), 'DBNULL_TEXT')
  ) AS rowhash
from asr_datastore.sale_inventory si
inner join (select recording_no from asr_datastore.sale where sale_price > 10 and sale_date > dateadd(yyyy, -10, getdate())) s
on si.recording_no = s.recording_no







