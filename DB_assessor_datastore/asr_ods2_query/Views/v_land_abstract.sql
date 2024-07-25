





CREATE VIEW [asr_ods2_query].[v_land_abstract]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access land_abstract data 
			   for loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, abstract_code, land_abstract_detail_id, land_type, land_acres, land_sf, 
land_unit_count, land_value_per, land_value, land_override_flag, land_override_total, 
land_actual_value, land_class, land_subclass, land_valued_by, land_value_measure, 
create_datetime, create_user_id, update_datetime, update_user_id, rowhash, abstract_code_description
FROM asr_datastore.land_abstract;








