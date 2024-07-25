
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      7/1/2016
Developer:     TONY GOLDEN
Comments:      Initial creation
               Provide a view to access tax_authority data 
			   for loading data into the asssessor_app database for POSSE STREAM
*************************************************************************************/

CREATE VIEW [asr_posse_query].[v_tax_authority]
AS
SELECT        tax_authority_no, tax_authority_name, authority_type, create_datetime, create_user_id, update_datetime, update_user_id, contact_person, contact_address_line_1, contact_address_line_2, contact_city_name, 
                         contact_state, contact_zip_code, active_flag, rowhash, contact_phone
FROM            asr_datastore.tax_authority


