
-- =============================================
-- Author:		Tony Golden
-- Create date: 8/18/2016
-- Description:	This procedure is used to associate an account number with a valid tax authority. Default will be Douglas County.
-- =============================================

CREATE PROCEDURE asr_app.sp_associate_acct_to_tax_authority
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	
	select null;

	/*
	USE THIS AS THE SHELL TO BUILD THE DATA.

	SELECT distinct a.[account_no]
      ,a.[state_parcel_no]
      ,a.[tax_district_no]
      ,a.[sub_filing_recording_no]
      ,a.[account_type]
      ,a.[appraisal_type]
      ,a.[account_status]
      ,a.[account_status_description]
      ,a.[legal_description]
      ,a.[longitude_x]
      ,a.[latitude_y]
      ,a.[location]
      ,a.[create_datetime]
      ,a.[create_user_id]
      ,a.[update_datetime]
      ,a.[update_user_id]
      ,a.[rowhash]
      ,a.[elevation_z]
  FROM [assessor_datastore].[asr_datastore].[account] a
  --,[assessor_datastore].[asr_datastore].[tax_district_authority] tda
  

SELECT distinct [tax_district_no],  [tax_authority_no] 
  FROM [assessor_datastore].[asr_datastore].[tax_district_authority]
  where tax_authority_no in
  (
	3005
	,3002
	,3007
	--,0001  DOUGLAS COUNTY WILL BE THE DEFAULT. DO NOT INCLUDE IN THIS ANALYSIS.
	,3006
	,3004
  )
  group by tax_district_no
  having count(*) > 1
	*/

END
