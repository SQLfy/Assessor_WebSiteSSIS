
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account Level Data
-- =============================================
CREATE PROCEDURE [asr_api_test].[sp_AccountLevelData]

AS
	
BEGIN
	TRUNCATE TABLE asr_api_test.AccountLevelData

    INSERT INTO asr_api_test.AccountLevelData 
    SELECT DISTINCT
   --  Account data
   --
       a.account_no as accountNumber,
	   a.state_parcel_no as stateParcelNumber,
	   a.tax_district_no as taxDistrictNo,
	   a.sub_filing_recording_no as subFilingRecordingNo, 
       a.account_type as accountType, 
	   a.appraisal_type as appraisalType, 
	   a.account_status as accountStatus,
	   a.account_status_description as accountStatusDescription,
	   a.legal_description as legalDescription, 
	   a.longitude_x as longitude, 
	   a.latitude_y as latitude,
	   a.location as location,  
	   a.elevation_z as elevation,
	   a.bldg_permit_auth_id as bldgPermitAuthId, 
	   a.qtr as quartersection, 
	   a.section as section, 
	   a.township as township, 
	   a.range as range,
    --   	    
	-- Real account data
    --
	   ra.zoning_code as zoningCode, 
	   ra.zoning_code_description as zoningCodeDescription, 
	   ra.default_lea as defaultLea, 
	   ra.default_lea_description as defaultLeaDescription, 
	   ra.total_improvement_interest_percent as totalImprovementInterestPercent, 
	   ra.total_land_interest_percent as totalLandInterestPercent, 
	   CAST(ra.vacant_flag as bit) as isVacant, 
	   CAST(ra.improvement_only_flag as bit) as isImprovementOnly, 
	   CAST(ra.tif_flag as bit) as isTif, 
	   CAST(ra.platted_flag as bit) as isPlatted, 
	   ra.no_of_buildings as numberOfBuildings,
    --
    -- Sub Divison data
	--
	   sf.subdivision_no as subdivisionNo,
	   sf.subdivision_name as subdivisionName, 
	   sf.filing_no as filingNumber, 
	   sf.sub_filing_recording_no as recordingNumber,
	   --
	-- Owner Mailing Address data
	--
	   aoa.private_flag as isPrivate,
	   aoa.primary_owner_flag as mailingAddressIsPrimary,
	   aoa.owner_name as ownerName,
	   aoa.address_line_1 as mailingAddressStreet,
	   aoa.address_line_2 as mailingAddressStreet2,
	   aoa.city_name as mailingAddressCity,
	   aoa.state as mailingAddressState,
	   aoa.zip_code as mailingAddressZipCode,
    --
	-- Property Address data
	--
	   apa.primary_address_flag as propertyAddressIsPrimary,
	   apa.concatenated_property_address as propertyAddressStreet,
	   apa.city_name as propertyAddressCity,
	   apa.location_zip_code as propertyAddressZipCode,
    --
	-- Azure Building Permit Authority data
	--
	   abpa.authority_name as buildingPermitAuthorityName,
	   abpa.phone as buildingPermitAuthorityPhone,
	   abpa.email as buildingPermitAuthorityEmail,
	   abpa.URL as buildingPermitAuthorityURL,
	   abpa.street as buildingPermitAuthorityStreet,
	   abpa.city as buildingPermitAuthorityCity,
	   abpa.zip as buildingPermitAuthorityZipCode
    FROM asr_app.account a
    LEFT JOIN asr_app.real_account ra ON a.account_no = ra.account_no
    LEFT JOIN asr_app.sub_filing sf ON a.sub_filing_recording_no = sf.sub_filing_recording_no
    LEFT JOIN asr_app.account_owner_address aoa ON a.account_no = aoa.account_no and aoa.primary_owner_flag = '1'
    LEFT JOIN asr_app.account_property_address apa ON a.account_no = apa.account_no and apa.primary_address_flag = '1'
    LEFT JOIN asr_app.azure_building_permit_authority abpa ON a.bldg_permit_auth_id = abpa.bldg_permit_auth_id
END

