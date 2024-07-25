

CREATE VIEW [asr_spatialest_query].[v_account_property_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access active account property address for loading data into
			   the asssessor_app database for Spatialist
Mod #:  2
Mod Date:      8/23/2016
Developer:     Richard Edwards
Comments:      Add CSVClean function to remove problem characters for Spatialest CSV format
*************************************************************************************/
AS
select apa.account_no
, apa.address_number
, apa.pre_direction_code
, dbo.fn_CSVClean(apa.street_name) AS street_name
, apa.street_type_code
, apa.unit_no
, dbo.fn_CSVClean(apa.city_name) AS city_name
, apa.location_zip_code
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, HASHBYTES('SHA2_256', ISNULL(RTRIM(apa.account_no), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(apa.address_number),'DBNULL_TEXT') 
  + ISNULL(RTRIM(apa.pre_direction_code), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(apa.street_name)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(apa.street_type_code), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(apa.unit_no), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(dbo.fn_CSVClean(apa.city_name)), 'DBNULL_TEXT') 
  + ISNULL(RTRIM(apa.location_zip_code),'DBNULL_TEXT') 
  ) AS rowhash 
from asr_datastore.account_property_address apa
inner join (select account_no from asr_datastore.account where appraisal_type = 'Real' and account_status = 'A' and account_no not like 'C%') a
on apa.account_no = a.account_no
where primary_address_flag = 1













