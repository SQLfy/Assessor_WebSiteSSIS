



/******************************************************************************
NAME:     publish_account
PURPOSE:  Used to publish all of those account now in the account table after
all of the complex and unique transformations required in the etl process.

REVISIONS:
Date        Author           Description
----------- ---------------- --------------------
09/22/2014  T. Golden        New
This table will be inserted following TRN_ACCOUNT mapping

******************************************************************************/
/*
tables with accountno field:

S_TBLACCTPPDETAIL_ERR
S_TBLACCTPP_ERR
S_TBLACCTPROPERTYADDRESS_ERR
S_TBLACCTREAL_ERR
S_TBLACCTSAAUTHORITYDETAIL_ERR
S_TBLACCTSA_ERR
S_TBLAPPLICATIONACCT_ERR
S_TBLIMPSBLTASVALUE_ERR
S_TBLIMPSBLTAS_ERR
S_TBLIMPSDETAIL_ERR
S_TBLIMPSOCC_ERR
S_TBLIMPS_ERR
S_TBLLANDATTRIBUTE_ERR
S_TBLSALEACCT_ERR
S_TBLSUBACCOUNT_ERR
S_TBLACCTLEGALLOCATION_ERR
S_TBLACCTNBHD_ERR
S_TBLACCTOWNERADDRESS_ERR
S_TBLACCT_ERR
S_TBLADDRESSSECURE_ERR
S_TBLPERSONSECURE_ERR

*/

CREATE PROCEDURE [dbo].[publish_accounts]
AS 
	BEGIN
		SET NOCOUNT ON
		
		
		
		TRUNCATE TABLE   w_published_account    
		
		
		-- IMPLICIT_TRANSACTIONS is set to OFF
		
		INSERT INTO  w_published_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 account_no,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  assessor_datastore.asr_datastore.account 
		WHERE	 account_no  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		-- IMPLICIT_TRANSACTIONS is set to OFF

		SET NOCOUNT OFF

	END




