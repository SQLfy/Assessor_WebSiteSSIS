





/*
-- 
*/

CREATE VIEW [trn].[v_etl_azure_building_permit_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      8/30/2016
Developer:     Tony Golden
Comments:      Initial creation
               Azure building permit authority data as entered via Access web app by assessor
*************************************************************************************/
AS
SELECT
     bldg_permit_auth_id
   , authority_name
   , phone
   , street
   , city
   , zip
   , associated_tax_authority_no
   , email
   , URL
   , create_datetime
   , create_user_id 
   , update_datetime
   , update_user_id
from [asr_staging].[azure_building_permit_authority]




