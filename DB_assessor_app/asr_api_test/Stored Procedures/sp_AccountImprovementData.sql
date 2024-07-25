
-- =============================================
-- Author:		Richard Edwards
-- Create date: 2017-06-15
-- Description:	Account Improvement Data
--
-- Modification:  7/25/2017  AJG    added join to improvement_fact for basement sf and %complete data

-- =============================================


CREATE PROCEDURE [asr_api_test].[sp_AccountImprovementData]

AS
	
BEGIN

	TRUNCATE TABLE asr_api_test.AccountImprovementData
    INSERT INTO asr_api_test.AccountImprovementData(accountNo, buildingNumber, propertyType, completedPercent, quality, perimeter, netSquareFeet, improvementIsPrimary, unitType, approachType, condition_type, type, subtype, unitCount, detailBuiltYear, addonCode, addonCodeDescription, useCode, useCodeDescription, usePercentage, occupancyAbstractCode, occupancyAbstractCodeDescription, abstractValue, occupancyIsPrimary, styleCode, styleCodeDescription, builtAsBuiltYear, squareFeet, builtASAbstractCode, builtAsAbstractCodeDescription, bedroomCount, bathroomCount, effectiveAge, exterior_construction_type, floorMaterialType, heatType, hvacPercent, interiorFinishType, numberOfStories, remodeledPercent, remodeledYear, roofConstructionType, roofMaterialType, numberOfRooms, sprinklerCoverageSquareFeet, totalUnitCount, typicalStoryHeight, builtAsIsPrimary, length, width, height, mobileHomeMake, mobileHomeModelType, mobileHomeSkirt, mobileHomeSkirtLinearFeet, mobileHomeWallType,BasementUnfinishedSQFT,BasementUnfinishedPct,BasementFinishedSQFT,BasementFinishedPct,BasementFinishedFlag)
    SELECT DISTINCT i.account_no as accountNo,
    -- Improvement data
       i.improvement_no as buildingNumber,
	   i.property_type as propertyType,
	   i.completed_percent as completedPercent,
	   i.improvement_quality as quality,
	   i.improvement_perimeter as perimeter,
	   i.improvement_net_sf as netSquareFeet,
	   i.primary_flag as improvementIsPrimary,
	   i.improvement_unit_type as unitType,
	   i.approach_type as approachType,
	   i.condition_type as conditionType,
	-- Improvement Detail data
	   id.improvement_detail_type as type,
	   id.improvement_detail_type_description as subtype,
	   id.detail_unit_count as unitCount,
	   id.detail_built_year as detailBuiltYear,
	   id.addon_code as addonCode,
	   id.addon_code_description as addonCodeDescription,
	-- Improvement Occupancy data
	   io.occupancy_code as useCode,
	   io.occupancy_code_description as useCodeDescription,
	   io.occupancy_percent as usePercentage,
	   io.abstract_code as occupancyAbstractCode,
	   io.abstract_code_description as occupancyAbstractCodeDescription,
	   io.abstract_value as abstractValue,
	   io.primary_flag as occupancyIsPrimary,
	-- Improvement Built As data
	   iba.built_as_code as styleCode,
	   iba.built_as_code_description as styleCodeDescription,
	   iba.built_year as builtAsBuiltYear,
	   iba.built_as_sf as squareFeet,
	   iba.class_code as builtASAbstractCode,
	   iba.class_code_description as builtAsAbstractCodeDescription,
	   iba.bedroom_count as bedroomCount,
	   iba.bathroom_count as bathroomCount,
	   iba.effective_age as effectiveAge,
	   iba.exterior_construction_type as exteriorConstructionType,
	   iba.floor_material_type as floorMaterialType,
	   iba.heat_type as heatType,
	   iba.hvac_percent as hvacPercent,
	   iba.interior_finish_type as interiorFinishType,
       iba.no_of_story as numberOfStories,
       iba.remodeled_percent as remodeledPercent,
	   iba.remodeled_year as remodeledYear,
	   iba.roof_construction_type as roofConstructionType,
	   iba.roof_material_type as roofMaterialType,
	   iba.room_count as numberOfRooms,
	   iba.sprinkler_coverage_sf as sprinklerCoverageSquareFeet,
	   iba.total_unit_count as totalUnitCount,
	   iba.typical_story_height as typicalStoryHeight,
	   iba.primary_flag as builtAsIsPrimary,
	   iba.built_as_length as length,
	   iba.built_as_width as width,
	   iba.built_as_height as height,
	   iba.mobile_home_make as mobileHomeMake,
	   iba.mobile_home_model_type as mobileHomeModelType,
	   iba.mobile_home_skirt as mobileHomeSkirt,
	   iba.mobile_home_skirt_linear_feet as mobileHomeSkirtLinearFeet,
       iba.mobile_home_wall_type as mobileHomeWallType,
	 -- Improvement_fact data
	   ifact.total_unfinished_basement_sf,
	   (ifact.total_unfinished_basement_sf/(ifact.total_unfinished_basement_sf+ifact.total_finished_basement_sf)) unfinished_basement_pct,
	   ifact.total_finished_basement_sf,
	   (ifact.total_finished_basement_sf/(ifact.total_unfinished_basement_sf+ifact.total_finished_basement_sf)) finished_basement_pct,
	   CASE WHEN isnull(ifact.total_finished_basement_sf,0) = 0 then 'N' ELSE 'Y' END  finished_basement_flag
    FROM asr_app.improvement i
    LEFT JOIN asr_app.improvement_detail id ON i.account_no = id.account_no AND i.improvement_no = id.improvement_no
    LEFT JOIN asr_app.improvement_occupancy io ON i.account_no = io.account_no AND i.improvement_no = io.improvement_no
    LEFT JOIN asr_app.improvement_built_as iba ON i.account_no = iba.account_no AND i.improvement_no = iba.improvement_no
	LEFT JOIN asr_app.improvement_fact ifact ON i.account_no = ifact.account_no AND i.improvement_no = ifact.improvement_no
END

