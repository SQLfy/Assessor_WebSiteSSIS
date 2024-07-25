












CREATE VIEW [asr_app_query].[v_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/26/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access active accounts for loading data into
			   the asssessor_app database

Mod #:  2
Mod Date:      10/31/2016
Developer:     Richard Edwards
Comments:      Add columns qtr, section, township, range
*************************************************************************************/
AS
SELECT account_no, state_parcel_no, tax_district_no, sub_filing_recording_no, account_type, appraisal_type
     , account_status, account_status_description, legal_description, longitude_x, latitude_y, elevation_z, location, bldg_permit_auth_id 
	 , create_datetime, create_user_id
	 , update_datetime, update_user_id, rowhash, qtr, section, township, range
FROM asr_datastore.account
WHERE account_status = 'A';















