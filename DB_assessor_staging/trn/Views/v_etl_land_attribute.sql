

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_land_attribute]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      4/22/2016
Developer:     Richard Edwards
Comments:      Initial creation
               List details for updating the land_attribute table
*************************************************************************************/
AS
SELECT 
   la.ACCOUNTNO AS account_no
  ,la.DETAILID AS detail_id
  ,la.ATTRIBUTETYPE AS attribute_type
  ,la.ATTRIBUTESUBTYPE AS attribute_subtype
  ,la.ATTRIBUTEADJUSTMENT AS attribute_adjustment
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(la.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(la.DETAILID), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(la.ATTRIBUTETYPE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(la.ATTRIBUTESUBTYPE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(la.ATTRIBUTEADJUSTMENT), 'DBNULL_TEXT') 
			) AS rowhash 
FROM asr_staging.s_tbllandattribute la
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON la.ACCOUNTNO = v.account_no;


