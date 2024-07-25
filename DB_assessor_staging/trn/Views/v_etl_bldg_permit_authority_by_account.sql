







/*
-- 
*/

CREATE VIEW [trn].[v_etl_bldg_permit_authority_by_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      8/30/2016
Developer:     Tony Golden
Comments:      Initial creation
               Azure building permit authority data by account_no
*************************************************************************************/
AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ata.[account_no]
      ,ata.[tax_district_no]
      ,ata.[tax_authority]
	  --,bpa.bldg_permit_auth_id bldg_permit_auth_id
	  ,CAST(bpa.associated_tax_authority_no as INT) bldg_permit_auth_id
      ,isnull(bpa.[authority_name],'Douglas County Government') authority_name
      ,isnull(bpa.[phone], '303-660-7340') phone
	  ,isnull(bpa.[street], '100 Third Street')  street
      ,isnull(bpa.[city], 'Castle Rock') city
      ,isnull(bpa.[zip],'80104') zip
      ,bpa.[email]
      ,isnull(bpa.[URL],'http://www.douglas.co.us/land/building/apply-for-permits/') URL
  FROM [assessor_staging].[trn].[v_etl_account_tax_authority] ata
  LEFT OUTER JOIN [assessor_staging].[trn].[v_etl_azure_building_permit_authority] bpa
		ON ata.tax_authority = bpa.associated_tax_authority_no





