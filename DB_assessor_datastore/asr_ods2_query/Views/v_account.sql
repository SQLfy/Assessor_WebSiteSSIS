


CREATE VIEW [asr_ods2_query].[v_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access active accounts for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, state_parcel_no, tax_district_no, sub_filing_recording_no, account_type, appraisal_type
     , account_status, account_status_description, legal_description, longitude_x, latitude_y, elevation_z, location
	 , create_datetime, create_user_id
	 , update_datetime, update_user_id, rowhash
FROM asr_datastore.account
WHERE account_status = 'A';





