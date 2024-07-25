




/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_sale_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/25/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all details for sale_account
*************************************************************************************/
AS
SELECT sa.RECEPTIONNO AS recording_no
      ,sa.ACCOUNTNO AS account_no
      ,GETDATE() AS create_datetime
      ,SUSER_NAME () AS create_user_id
      ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(sa.RECEPTIONNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sa.ACCOUNTNO), 'DBNULL_TEXT') 
				) AS rowhash	
FROM dqm.q_tblsaleacct sa  
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON sa.ACCOUNTNO = v.account_no
LEFT OUTER JOIN [dqm].[s_tblsale_err] s  --exclude bad tblsale related rows
ON sa.RECEPTIONNO = s.RECEPTIONNO
WHERE s.RECEPTIONNO IS NULL;





