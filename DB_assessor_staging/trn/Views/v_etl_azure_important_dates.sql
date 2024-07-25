








/*
-- 
*/

CREATE VIEW [trn].[v_etl_azure_important_dates]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/23/2017
Developer:     Richard Edwards
Comments:      Initial creation
               Azure important dates data as entered via Access web app by assessor
*************************************************************************************/
AS
SELECT
     ID
   , Description
   , Reappraisal
   , Event_Name
   , Intervening
   , Category
   , create_datetime
   , create_user_id 
   , update_datetime
   , update_user_id
   , Title
from [asr_staging].[azure_important_dates]







