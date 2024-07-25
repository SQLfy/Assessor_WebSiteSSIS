










CREATE VIEW [asr_posse_query].[v_land_parent]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      7/01/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access land_parent records for consumption by POSSE

*************************************************************************************/
AS
SELECT state_parcel_no , parent_parcel_no, create_dtm, create_user_id, update_dtm, update_user_id
FROM asr_datastore.land_parent; 














