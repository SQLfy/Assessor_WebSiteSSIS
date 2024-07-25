


CREATE VIEW [asr_adv_search_query].[v_land_abstract]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/21/2018
Developer:     Christine Lin
Comments:      Initial creation
               Intended to be used by Assessor advanced search JSON file generation
               Provide a view to access the land_abstract inforamtion 
			   for active accounts 

*************************************************************************************/
AS
SELECT la.[account_no]
      ,la.[abstract_code]
      ,la.[land_abstract_detail_id]
      ,la.[land_type]
      ,la.[land_acres]
      ,la.[land_sf]
      ,la.[land_unit_count]
      ,la.[land_value_per]
      ,la.[land_value]
      ,la.[land_override_flag]
      ,la.[land_override_total]
      ,la.[land_actual_value]
      ,la.[land_class]
      ,la.[land_subclass]
      ,la.[land_valued_by]
      ,la.[land_value_measure]
      ,la.[create_datetime]
      ,la.[create_user_id]
      ,la.[update_datetime]
      ,la.[update_user_id]
      ,la.[rowhash]
      ,la.[abstract_code_description]
  FROM [asr_datastore].[land_abstract] as la
  inner join [asr_datastore].account as a  on a.account_no = la.account_no and a.account_status = 'A';