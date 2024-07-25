


/******************************************************************************
NAME:     verify_accounts
PURPOSE:  Used to evaluate all lookup code values in various tables by accountno to ensure
that the lookup codes assigned are valid lookup code values in the various code
tables. If a table with accountno field in them have an invalid lookup code, the
account will be added to the w_defective_account table and will affect the contents
of the w_verified_account table.

REVISIONS:
Date        Author           Description
----------- ---------------- --------------------
09/22/2014  T. Golden        New
This table will be inserted by TRN_ACCOUNT mapping
06/16/2016  R. Edwards       Update
Commented out some edits for datasets not currently used in ODS2
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
S_TBLACCTNEWCONSTRUCTION_ERR

*/

CREATE PROCEDURE [dbo].[verify_accounts]
AS 
	BEGIN
		SET NOCOUNT ON
		
		
		
		TRUNCATE TABLE   w_defective_account    
		
		
		-- IMPLICIT_TRANSACTIONS is set to OFF
		
		--INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLACCTLEGALLOCATION_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLACCTNBHD_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLACCTOWNERADDRESS_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLACCT_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 aoa.accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLADDRESSSECURE_ERR S,
			 asr_staging.S_TBLACCTOWNERADDRESS AOA 
		WHERE	 s.addresscode  = aoa.addresscode
		 AND	aoa.accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 aoa.accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLPERSONSECURE_ERR S,
			 asr_staging.S_TBLACCTOWNERADDRESS AOA 
		WHERE	 s.personcode  = aoa.personcode
		 AND	aoa.accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		--INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLACCTPPDETAIL_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
		
		
		--INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLACCTPP_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLACCTPROPERTYADDRESS_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLACCTREAL_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		--INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLACCTSAAUTHORITYDETAIL_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
		
		
		--INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLACCTSA_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
		
		
		--INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLAPPLICATIONACCT_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
		
		
		--INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLIMPSBLTASVALUE_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLIMPSBLTAS_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLIMPSDETAIL_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLIMPSOCC_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLIMPS_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLLANDATTRIBUTE_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLSALEACCT_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		INSERT INTO  w_defective_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT DISTINCT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  dqm.S_TBLSUBACCOUNT_ERR 
		WHERE	 accountno  NOT IN
			(
		 	SELECT DISTINCT (account_no)
			FROM  w_defective_account 
			)
		
		
		DELETE FROM   w_verified_account    
		
		
		-- IMPLICIT_TRANSACTIONS is set to OFF
		INSERT INTO  w_verified_account   
				( account_no , 
				create_dtm , 
				create_user_id )  
		SELECT
				 accountno,
				 GETDATE(),
				 'ASR_SSIS_DQM'
		FROM  asr_staging.s_tblacct 
		WHERE	 accountno  NOT IN
			(
		 	SELECT account_no
			FROM  w_defective_account 
			)
			AND ACCTSTATUSCODE = 'A' 


	 --INSERT INTO  w_defective_account   
		--		( account_no , 
		--		create_dtm , 
		--		create_user_id )  
		--SELECT DISTINCT
		--		 accountno,
		--		 GETDATE(),
		--		 'ASR_SSIS_DQM'
		--FROM  S_TBLACCTNEWCONSTRUCTION_ERR 
		--WHERE	 accountno  NOT IN
		--	(
		-- 	SELECT DISTINCT (account_no)
		--	FROM  w_defective_account 
		--	)
	
		-- IMPLICIT_TRANSACTIONS is set to OFF

		SET NOCOUNT OFF

	END

--END **






