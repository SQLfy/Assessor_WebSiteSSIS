









CREATE VIEW [asr_spatialest_query].[v_land_abstract]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access land abstract for loading data into
			   the asssessor_app database for Spatialist
*************************************************************************************/
AS
select la.account_no
, la.abstract_code
, la.land_abstract_detail_id
, la.land_type
, la.land_acres
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, rowhash
from asr_datastore.land_abstract la
inner join (select account_no from asr_datastore.account where appraisal_type = 'Real' and account_status = 'A') a
on la.account_no = a.account_no










