







CREATE VIEW [trn].[v_etl_appeal_account]
--WITH SCHEMABINDING
/**************************************Comments***************************************
**************************************************************************************


Mod #:  1
Mod Date:      3/20/2017
Developer:     Tony Golden
Comments:      INITIAL CREATION

Mod #:  2
Mod Date:      3/20/2017
Developer:     Tony Golden
Comments:      CBOE application changes 2018 - VALUE GROUP DESCRIPTION added.
               
*************************************************************************************/
AS

SELECT aa.TAXYEAR TAX_YEAR
      ,aa.APPEALNO APPEAL_NO
      ,aa.ACCOUNTNO ACCOUNT_NO
      ,aa.APPEALADJUSTDENYREASONID APPEAL_ADJUST_DENY_REASON_ID
      ,aa.APPEALCOMMENT APPEAL_COMMENT
      ,aa.APPEALACCOUNTENDVALUE  APPEAL_ACCOUNT_END_VALUE
	  ,isnull(aa.VALUEGROUPDESCRIPTION,'N/A')  VALUE_GROUP_DESCRIPTION
      ,aa.APPEALACCTON0
      ,aa.APPEALACCTON1
      ,aa.APPEALACCTON2
      ,aa.APPEALACCTOD0
      ,aa.APPEALACCTOD1
      ,aa.APPEALACCTOM0
      ,aa.APPEALACCTOM1
      ,aa.APPEALACCTOT0
      ,aa.APPEALACCTOT1
      ,aa.JURISDICTIONID JURISDICTION_ID
      ,aa.WRITEDATE WRITE_DATE
      ,aa.BEGINNINGACCOUNTVALUE BEGINNING_ACCOUNT_VALUE
      ,aa.APPEALDECISION APPEAL_DECISION
      ,aa.APPEALACCTREASONDESC APPEAL_ACCT_REASON_DESC
      ,aa.ADDBOARDAPPEALENDVALUE ADD_BOARD_APPEAL_END_VALUE
      ,aa.SEQID SEQ_ID
      ,GETDATE() AS create_datetime
      ,SUSER_NAME () AS create_user_id
      ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(aa.TAXYEAR), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.APPEALNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.ACCOUNTNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.APPEALADJUSTDENYREASONID), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.APPEALCOMMENT), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.APPEALACCOUNTENDVALUE), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(aa.VALUEGROUPDESCRIPTION), 'DBNULL_TEXT')  
				+ ISNULL(RTRIM(aa.APPEALACCTON0), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.APPEALACCTON1), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.APPEALACCTON2), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(aa.APPEALACCTOD0), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(aa.APPEALACCTOD1), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(aa.APPEALACCTOM0), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(aa.APPEALACCTOM1), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(aa.APPEALACCTOT0), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(aa.APPEALACCTOT1), 'DBNULL_TEXT')
				) AS rowhash					
FROM assessor_staging.asr_staging.s_tblappealacct aa
--WHERE exists (SELECT 'x' FROM assessor_staging.trn.v_etl_account a WHERE a.account_no = aa.accountno)




