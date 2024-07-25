

CREATE PROCEDURE [trn].[sp_account_number_insert]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      5/31/2018
Developer:     Tony Golden
Comments:      Load the asr_adv_search_query.account_number with identity and account number daily.  
               There is an ssis task in transformations package that calls this procedure 
               
*************************************************************************************/
AS
BEGIN

TRUNCATE TABLE assessor_datastore.asr_adv_search_query.account_number


INSERT INTO assessor_datastore.asr_adv_search_query.account_number(account_no)
   SELECT account_no 
   FROM trn.v_etl_account
	WHERE account_status = 'A'
	ORDER BY account_no

END