







CREATE VIEW [trn].[v_etl_account_property_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/29/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the account_property_address table
*************************************************************************************/
AS
SELECT
   apa.ACCOUNTNO AS account_no
  ,apa.ORDERNO AS order_no
  ,apa.BUILDINGID AS building_no
  ,CASE WHEN pa.min_orderno IS NULL THEN 0 ELSE 1 END AS primary_address_flag
  ,apa.UNITNAME AS unit_no
  ,NULL AS unit_designator
  ,apa.STREETNO AS address_number
  ,NULL AS address_number_suffix
  ,apa.PREDIRECTION AS pre_direction_code
  ,apa.STREETNAME AS street_name
  ,apa.STREETTYPE AS street_type_code
  ,apa.POSTDIRECTION AS post_direction_code
  ,apa.PROPERTYCITY AS city_name
  ,apa.PROPERTYZIPCODE AS location_zip_code
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(apa.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.ORDERNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.BUILDINGID), 'DBNULL_TEXT') 
			+ CAST(CASE WHEN pa.min_orderno IS NULL THEN 0 ELSE 1 END AS VARCHAR(1) )
			+ ISNULL(RTRIM(apa.UNITNAME), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(unit_designator), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.STREETNO), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(address_number_suffix), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.PREDIRECTION), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.STREETNAME), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.STREETTYPE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.POSTDIRECTION), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.PROPERTYCITY), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.PROPERTYZIPCODE), 'DBNULL_TEXT')
			) AS rowhash
FROM  [dqm].[q_tblacctpropertyaddress] apa
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON apa.ACCOUNTNO = v.account_no
LEFT OUTER JOIN (SELECT ACCOUNTNO, MIN(ORDERNO) AS min_orderno
				 FROM [asr_staging].[s_tblacctpropertyaddress]
				 GROUP BY ACCOUNTNO ) pa
ON apa.ACCOUNTNO = pa.ACCOUNTNO
AND apa.ORDERNO = pa.min_orderno;






