

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_land_abstract]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/29/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the land_abstract table
*************************************************************************************/
AS
SELECT 
   s.ACCOUNTNO AS account_no
  ,s.ABSTRACTCODE AS abstract_code
  ,s.DETAILID AS land_abstract_detail_id
  ,s.LANDTYPE AS land_type
  ,s.LANDACRES AS land_acres
  ,s.LANDSF AS land_sf
  ,s.LANDUNITCOUNT AS land_unit_count
  ,s.LANDVALUEPER AS land_value_per
  ,s.LANDVALUE AS land_value
  ,s.LANDOVERRIDEFLAG AS land_override_flag
  ,s.LANDOVERRIDETOTAL AS land_override_total
  ,s.LANDACTUALTOTAL AS land_actual_value
  ,s.LANDCLASS AS land_class
  ,s.LANDSUBCLASS AS land_subclass
  ,s.LANDVALUEBY AS land_valued_by
  ,s.LANDVALUEMEASURE AS land_value_measure
  ,c.ABSTRACTDESCRIPTION AS abstract_code_description
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(s.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.ABSTRACTCODE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.DETAILID), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDTYPE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDACRES), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDSF), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDUNITCOUNT), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDVALUEPER), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDVALUE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDOVERRIDEFLAG), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDOVERRIDETOTAL), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDACTUALTOTAL), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDCLASS), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDSUBCLASS), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDVALUEBY), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDVALUEMEASURE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(c.ABSTRACTDESCRIPTION), 'DBNULL_TEXT') 
			) AS rowhash 
FROM asr_staging.s_tbllandabstract s
LEFT OUTER JOIN [asr_staging].[s_tlkpabstractcode] c
ON s.ABSTRACTCODE = c.ABSTRACTCODE
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON s.ACCOUNTNO = v.account_no;


