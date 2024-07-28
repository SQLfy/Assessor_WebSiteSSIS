﻿



CREATE VIEW [asr_ods2_query].[v_sub_filing]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/01/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access subfiling info for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT 
sub_filing_recording_no, subdivision_no, subdivision_name, filing_no, filing_description, 
dedicated_sub_filing_name, create_datetime, create_user_id,
update_datetime, update_user_id, rowhash
FROM [asr_datastore].[sub_filing]





