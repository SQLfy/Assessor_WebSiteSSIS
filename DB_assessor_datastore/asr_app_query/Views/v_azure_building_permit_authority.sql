






CREATE VIEW [asr_app_query].[v_azure_building_permit_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      9/1/2016
Developer:     Tony Golden
Comments:      Initial creation
               Provide a view to access azure_building_permit_authority for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT CAST(associated_tax_authority_no as INT) bldg_permit_auth_id, authority_name, phone, street, city, zip, associated_tax_authority_no, email, URL, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.azure_building_permit_authority;









