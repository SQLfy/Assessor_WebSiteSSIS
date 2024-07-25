



CREATE VIEW [trn].[v_etl_improvement_detail]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement_detail table

Mod #:  2
Mod Date:      3/15/2022
Developer:     Rick Greenfield
Comments:      SVRQ0038910 - Missing Features in Assessor Property Page
               Modified where clause
			   Old: WHERE EXISTS (SELECT 'x' from [asr_staging].[azure_improvement_detail_whitelist] idw where i.IMPDETAILDESCRIPTION = idw.detail_type_description);
			   New: WHERE EXISTS (SELECT 'x' from [asr_staging].[azure_improvement_detail_whitelist] idw where i.IMPDETAILTYPE = idw.detail_type and i.IMPDETAILDESCRIPTION = idw.detail_type_description);

*************************************************************************************/
AS
SELECT
   i.ACCOUNTNO AS account_no
  ,i.IMPNO AS improvement_no
  ,i.DETAILID AS improvement_detail_id
  ,i.IMPDETAILTYPE AS improvement_detail_type
  ,i.IMPDETAILDESCRIPTION AS improvement_detail_type_description
  ,i.DETAILUNITCOUNT AS detail_unit_count
  ,i.ADDONCODE AS addon_code
  ,c.ADDONDESCRIPTION AS addon_code_description
  ,i.DETAILYEARBUILT AS detail_built_year
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
             ISNULL(RTRIM(i.ACCOUNTNO), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.IMPNO), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.DETAILID), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.IMPDETAILTYPE), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.IMPDETAILDESCRIPTION), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.DETAILUNITCOUNT), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.ADDONCODE), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(c.ADDONDESCRIPTION), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.DETAILYEARBUILT), 'DBNULL_TEXT') 
			) AS rowhash
FROM  [dqm].[q_tblimpsdetail] i
--LEFT OUTER JOIN [dqm].[q_tlkpimpsaddons] c
LEFT OUTER JOIN (SELECT c1.ADDONCODE, c1.ADDONDESCRIPTION FROM [asr_staging].[s_tlkpimpsaddons] c1
                 INNER JOIN [asr_staging].[etl_parameter] p
                 ON c1.TAXYEAR = p.PARAMETER_VALUE AND p.PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) c
ON i.ADDONCODE = c.ADDONCODE 
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON i.ACCOUNTNO = v.account_no
WHERE EXISTS (SELECT 'x' from [asr_staging].[azure_improvement_detail_whitelist] idw where i.IMPDETAILTYPE = idw.detail_type and i.IMPDETAILDESCRIPTION = idw.detail_type_description);











