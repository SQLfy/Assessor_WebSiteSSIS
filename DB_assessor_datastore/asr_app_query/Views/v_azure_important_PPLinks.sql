







CREATE VIEW [asr_app_query].[v_azure_important_PPLinks]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/23/2017
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access azure_important_PPLinks for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT ID, LinkName, LinkURL, LinkOrder, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.azure_important_PPLinks;










