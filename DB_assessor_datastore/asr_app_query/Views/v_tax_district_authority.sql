﻿

CREATE VIEW [asr_app_query].[v_tax_district_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access the tax_district_authority table for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT tax_district_no, tax_authority_no, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.tax_district_authority;



