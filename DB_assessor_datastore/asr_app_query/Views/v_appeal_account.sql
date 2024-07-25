






CREATE VIEW [asr_app_query].[v_appeal_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     03/21/2017
Developer:    TONY GOLDEN
Comments:     Initial creation
              the datastore db view of the data in the appeal_account table in the datastore db.
			  derived from the table in staging and used to publish data in the same format to
			  assessor_app.

			  7/3/2018
			  DG
              added join to appeal table along with where clause to filter out appeal_type = 'ABAT' 

			  5/21/2020
			  DG
			  changed where clause to only allow appeal_type = 'ASSR'
*************************************************************************************/
AS
SELECT aa.TAX_YEAR
      ,aa.APPEAL_NO
      ,aa.ACCOUNT_NO
      ,aa.APPEAL_ADJUST_DENY_REASON_ID
      ,aa.APPEAL_COMMENT
      ,aa.APPEAL_ACCOUNT_END_VALUE
	  ,aa.VALUE_GROUP_DESCRIPTION
      ,aa.APPEALACCTON0
      ,aa.APPEALACCTON1
      ,aa.APPEALACCTON2
      ,aa.APPEALACCTOD0
      ,aa.APPEALACCTOD1
      ,aa.APPEALACCTOM0
      ,aa.APPEALACCTOM1
      ,aa.APPEALACCTOT0
      ,aa.APPEALACCTOT1
      ,aa.JURISDICTION_ID
      ,aa.WRITE_DATE
      ,aa.BEGINNING_ACCOUNT_VALUE
      ,aa.APPEAL_DECISION
      ,aa.APPEAL_ACCT_REASON_DESC
      ,aa.ADD_BOARD_APPEAL_END_VALUE
      ,aa.SEQ_ID
      ,aa.CREATE_DATEIME
      ,aa.CREATE_USER_ID
      ,aa.UPDATE_DATETIME
      ,aa.UPDATE_USER_ID
      ,aa.ROWHASH
  FROM assessor_datastore.asr_datastore.appeal_account aa
  JOIN [asr_datastore].[appeal] a
  on aa.appeal_no = a.appeal_no
  and a.appeal_type = 'ASSR';




