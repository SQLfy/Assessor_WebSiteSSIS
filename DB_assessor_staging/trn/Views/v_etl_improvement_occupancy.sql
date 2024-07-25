





CREATE VIEW [trn].[v_etl_improvement_occupancy]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/3/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement_occupancy table
*************************************************************************************/
/**************************************************************************************
Mod #:  1
Mod Date:      7/25/2016
Developer:     Richard Edwards
Comments:      Add primary flag column
*************************************************************************************/
AS
SELECT
      i.ACCOUNTNO AS account_no
     ,i.IMPNO AS improvement_no
     ,i.DETAILID AS occupancy_detail_id
     ,i.OCCCODE AS occupancy_code
     ,o.OCCCODEDESCRIPTION AS occupancy_code_description
     ,i.OCCPERCENT AS occupancy_percent
     ,i.ABSTRACTCODE AS abstract_code
     ,c.ABSTRACTDESCRIPTION AS abstract_code_description
     ,i.IMPABSTRACTVALUE AS abstract_value
	 ,CAST(i.IMPSOCCON2 AS bit) AS primary_flag
     ,GETDATE() AS create_datetime
     ,SUSER_NAME() AS create_user_id
     ,HASHBYTES('SHA2_256', 
                 ISNULL(RTRIM( i.ACCOUNTNO), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.IMPNO), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.DETAILID), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.OCCCODE), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(o.OCCCODEDESCRIPTION), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.OCCPERCENT), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.ABSTRACTCODE), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(c.ABSTRACTDESCRIPTION), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.IMPABSTRACTVALUE), 'DBNULL_TEXT')
			   + ISNULL(RTRIM(i.IMPSOCCON2), 'DBNULL_TEXT') 
		) AS rowhash
FROM  [dqm].[q_tblimpsocc] i
LEFT OUTER JOIN [asr_staging].[s_tlkpabstractcode] c
ON i.ABSTRACTCODE = c.ABSTRACTCODE  
LEFT OUTER JOIN [asr_staging].[s_tlkpimpsocctype] o
ON i.OCCCODE = o.OCCCODE
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON i.ACCOUNTNO = v.account_no;











