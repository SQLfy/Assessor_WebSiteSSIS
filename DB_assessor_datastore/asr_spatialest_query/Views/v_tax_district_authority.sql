








CREATE VIEW [asr_spatialest_query].[v_tax_district_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/25/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access tax district authority for loading data into
			   the asssessor_app database for Spatialist
*************************************************************************************/
AS
select tax_district_no
, tax_authority_no
, create_datetime
, create_user_id
, update_datetime
, update_user_id
--, rowhash
from asr_datastore.tax_district_authority



