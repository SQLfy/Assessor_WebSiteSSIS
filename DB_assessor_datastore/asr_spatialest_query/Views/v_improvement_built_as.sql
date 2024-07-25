










CREATE VIEW [asr_spatialest_query].[v_improvement_built_as]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access improvement built as for loading data into
			   the asssessor_app database for Spatialist
*************************************************************************************/
AS
select iba.account_no
, iba.improvement_no
, iba.built_as_detail_id
, iba.built_as_code_description
, iba.exterior_construction_type
, iba.no_of_story
, iba.room_count
, iba.bedroom_count
, iba.total_unit_count
, iba.built_year
, iba.built_as_sf
, iba.bathroom_count
, iba.heat_type
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, rowhash
from asr_datastore.improvement_built_as iba
inner join (select account_no from asr_datastore.account where appraisal_type = 'Real' and account_status = 'A') a
on iba.account_no = a.account_no












