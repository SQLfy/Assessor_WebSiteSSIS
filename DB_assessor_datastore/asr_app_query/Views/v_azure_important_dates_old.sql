

CREATE VIEW [asr_app_query].[v_azure_important_dates_old]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/2/2017
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access azure_important_dates for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT ID, Description, Reappraisal, Event_Name, Intervening, Category, create_datetime, create_user_id, update_datetime, update_user_id,Title
FROM asr_datastore.azure_important_dates;




