







CREATE VIEW [asr_adv_search_query].[v_sale]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/21/2018
Developer:     Christine Lin
Comments:      Initial creation
               Intended to be used by Assessor advanced search JSON file generation
               Provide a view to access the sale inforamtion 
			   for active accounts 

Mod #:  2
Mod Date:      6/24/2020
Developer:     David Guillen
Comments:      Add exclude_code_2, exclude_code_2_description, and multi_parcel_flag

*************************************************************************************/
AS
SELECT s.[recording_no]
      ,s.[grantor]
      ,s.[grantee]
      ,s.[sale_date]
      ,s.[deed_code]
      ,s.[deed_code_description]
      ,s.[sale_price]
      ,s.[valid1_flag]
      ,s.[confirmed_flag]
      ,s.[exclude_code_1]
      ,s.[improved_flag]
      ,s.[non_sale_flag]
      ,s.[create_datetime]
      ,s.[create_user_id]
      ,s.[update_datetime]
      ,s.[update_user_id]
      ,s.[exclude_code_1_description]
      ,s.[rowhash]
      ,s.[valid2_flag]
      ,s.[book]
      ,s.[page]
	  ,s.[exclude_code_2]
      ,s.[exclude_code_2_description]
	  ,CAST(CASE WHEN s.[exclude_code_1] IN (64,80) THEN 1
	        WHEN s.[exclude_code_2] IN (64,80) THEN 1
		    ELSE 0 
			END AS bit) as multi_parcel_flag
  FROM [assessor_datastore].[asr_datastore].[sale] as s
  inner join (select distinct sa.recording_no
              from [asr_datastore].[sale_account] as sa 
              inner join [asr_datastore].account as a  on a.account_no = sa.account_no and a.account_status = 'A') as l
			  on l.recording_no = s.recording_no;
