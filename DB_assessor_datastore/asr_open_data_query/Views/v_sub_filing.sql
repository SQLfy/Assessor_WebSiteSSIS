




CREATE VIEW [asr_open_data_query].[v_sub_filing]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      5/10/2017
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access subfiling info for loading data into
			   asssessor open data in socrata
*************************************************************************************/
AS
SELECT 
sub_filing_recording_no, 
subdivision_no, 
filing_no, 
filing_description, 
dedicated_sub_filing_name, 
create_datetime, 
create_user_id,
update_datetime, 
update_user_id
FROM [asr_datastore].[sub_filing]







