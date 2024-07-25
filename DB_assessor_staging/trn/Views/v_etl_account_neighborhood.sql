


CREATE VIEW [trn].[v_etl_account_neighborhood]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/1/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for account_neighborhood
*************************************************************************************/
AS
SELECT 
   n.ACCOUNTNO AS account_no
  ,n.NBHDCODE AS neighborhood_code
  ,n.PROPERTYTYPE AS property_type
  ,n.NBHDEXTENSION AS neighborhood_extension
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
FROM [dqm].[q_tblacctnbhd] n
INNER JOIN [dqm].[valid_account] a
ON n.ACCOUNTNO = a.account_no;





