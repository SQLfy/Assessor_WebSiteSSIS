






CREATE VIEW [asr_ods2_query].[v_sale]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/11/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access sale data for loading data into
			   the asssessor_app database

Mod #:  2
Mod Date:      6/29/2016
Developer:     Richard Edwards
Comments:      Add Book and Page columns to sale view
*************************************************************************************/
AS
SELECT recording_no, grantor, grantee, sale_date, deed_code, deed_code_description, sale_price, 
valid1_flag, confirmed_flag, exclude_code_1, improved_flag, non_sale_flag, 
create_datetime, create_user_id, update_datetime, update_user_id, exclude_code_1_description, rowhash, book, page
FROM asr_datastore.sale;









