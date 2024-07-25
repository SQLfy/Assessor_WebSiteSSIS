






-- ======================================================================
-- Author:		David Guillen
-- Create date: 09/08/2017
-- Description:	transformation for account for Assessor Open Data
-- ======================================================================

CREATE PROCEDURE [trn].[sp_OD_account]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	truncate table assessor_datastore.[asr_datastore].[OD_account];

   insert into assessor_datastore.[asr_datastore].[OD_account]
(account_no, state_parcel_no, tax_district_no, sub_filing_recording_no, account_type, appraisal_type, account_status, account_status_description, 
 legal_description, longitude_x, latitude_y, location, create_datetime, create_user_id, update_datetime, update_user_id, rowhash, elevation_z, 
 bldg_permit_auth_id, qtr, section, township, range, assessment_year
)
select account_no, state_parcel_no, tax_district_no, sub_filing_recording_no, account_type, appraisal_type, account_status, account_status_description, 
legal_description, longitude_x, latitude_y, location, create_datetime, create_user_id, update_datetime, update_user_id, rowhash, elevation_z, 
bldg_permit_auth_id, qtr, section, township, range, (SELECT convert(varchar(4),parameter_value) FROM assessor_staging.asr_staging.etl_parameter WHERE parameter_name = 'ASSESSMENT_TAX_YEAR') assessment_year
from assessor_datastore.[asr_datastore].[account]
where account_status = 'A';


END




