








CREATE VIEW [asr_spatialest_query].[v_improvement]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access improvements for loading data into
			   the asssessor_app database for Spatialist
*************************************************************************************/
AS
select i.account_no
, i.improvement_no
, i.completed_percent
, i.improvement_quality
, i.improvement_sf
, i.property_type
, i.condition_type
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, rowhash
from asr_datastore.improvement i
inner join (select account_no from asr_datastore.account where appraisal_type = 'Real' and account_status = 'A') a
on i.account_no = a.account_no










