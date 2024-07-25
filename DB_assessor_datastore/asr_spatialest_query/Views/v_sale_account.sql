








CREATE VIEW [asr_spatialest_query].[v_sale_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access sale account for loading data into
			   the asssessor_app database for Spatialist
*************************************************************************************/
AS
select sa.account_no
, sa.recording_no 
, create_datetime
, create_user_id
, update_datetime
, update_user_id
, rowhash
from asr_datastore.sale_account sa
inner join (select recording_no from asr_datastore.sale where sale_price > 10 and sale_date > dateadd(yyyy, -10, getdate())) s
on sa.recording_no = s.recording_no






