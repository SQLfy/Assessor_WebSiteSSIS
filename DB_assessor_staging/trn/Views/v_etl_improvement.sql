









CREATE VIEW [trn].[v_etl_improvement]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement table
*************************************************************************************/
/**************************************************************************************
Mod #:  2
Mod Date:      7/25/2016
Developer:     Richard Edwards
Comments:      Add primary_flag column
*************************************************************************************/
/**************************************************************************************
Mod #:  3
Mod Date:      8/22/2016
Developer:     Richard Edwards
Comments:      Add improvement_unit_type column
*************************************************************************************/
AS
SELECT
   i.ACCOUNTNO AS account_no
  ,i.IMPNO AS improvement_no
  ,i.IMPCOMPLETEDPCT AS completed_percent
  ,i.IMPQUALITY AS improvement_quality
  ,i.IMPPERIMETER AS improvement_perimeter
  ,i.IMPSF AS improvement_sf
  ,i.IMPNETSF AS improvement_net_sf
  ,i.PROPERTYTYPE AS property_type
  ,i.IMPCONDITIONTYPE AS condition_type
  ,i.APPROACHTYPE AS approach_type
  ,CAST(i.IMPSON2 AS BIT) AS primary_flag
  ,i.IMPUNITTYPE AS improvement_unit_type
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(i.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPCOMPLETEDPCT), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPQUALITY), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPPERIMETER), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPSF), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPNETSF), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(i.PROPERTYTYPE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(i.IMPCONDITIONTYPE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(i.APPROACHTYPE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(i.IMPSON2), 'DBNULL_TEXT')
			) AS rowhash
FROM  [dqm].[q_tblimps] i
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON i.ACCOUNTNO = v.account_no;











