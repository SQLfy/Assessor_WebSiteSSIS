








CREATE VIEW [asr_app_query].[v_appeal]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     5/2/2017
Developer:    TONY GOLDEN
Comments:     Initial creation
              the datastore db view of the data in the appeal table in the datastore db.
			  derived from the table in staging and used to publish data in the same format to
			  assessor_app.

			  3/9/2018
			  AJG
			  added new agent fields for CBOE application agent email, phone, address

			  7/3/2018
			  DG
			  added where clause to filter out appeal_type = 'ABAT' for abatements

			  5/21/2020
			  DG
			  changed where clause to only allow appeal_type = 'ASSR'
*************************************************************************************/
AS
SELECT TAX_YEAR
      ,APPEAL_NO
      ,APPEAL_TYPE
      ,APPEAL_METHOD
      ,ASSIGNED_TO
      ,INITIATED_BY
      ,AGENT_CODE
	  ,AGENT_NAME
	  ,AGENT_EMAILADDRESS
	  ,AGENT_PHONE
	  ,AGENT_ADDRESS
	  ,FILER_EMAIL
	  ,FILER_PHONE
	  ,FILER
	  ,FILER_ADDRESS
	  ,FILER_CITY
	  ,FILER_STATECODE
	  ,FILER_ZIPCODE
      ,MAIL_TO
      ,DECISION_BY
      ,CASE_NO
      ,REREVIEW_STATUS
      ,REREVIEW_INITIALS
      ,REREVIEW_DECISION
      ,APPEAL_REASON
      ,APPEAL_BASIS
      ,APPEAL_RECOMMENDATION
      ,APPEAL_ADJUST_DENY_REASON_ID
      ,APPEAL_END_VALUE
      ,DATE_OF_APPEAL
      ,DATE_RECEIVED
      ,TAX_PAYER_MEETING_REQUEST_FLAG
      ,TAX_PAYER_MEETING_DATE
      ,TAX_PAYER_MEETING_TIME
      ,BEGINNING_APPEAL_VALUE
      ,APPEAL_ON1
      ,APPEAL_ON2
      ,APPEAL_OD0
      ,APPEAL_OD1
      ,APPEAL_OM0
      ,APPEAL_OM1
      ,APPEAL_ON0
      ,APPEAL_OT0
      ,APPEAL_OT1
      ,APPRAISAL_TYPE
      ,PRIMARY_ACCOUNT
      ,JURISDICTION_ID
      ,SCHEDULE_DATE_AS
      ,SCHEDULE_START_TIME
      ,SCHEDULE_END_TIME
      ,SCHEDULE_COMMENT
      ,SCHEDULE_BOARD_FILE_NO
      ,SCHEDULE_APPRAISER_INITIALS
      ,APPOINTMENT_COLOR
      ,WRITE_DATE
      ,APPEAL_STATUS_ID
      ,APPEAL_REASON_DESCRIPTION
      ,BOARD_NO
      ,APPEAL_DECISION
      ,SEQ_ID
      ,create_datetime
      ,create_user_id
      ,rowhash
      ,update_datetime
      ,update_user_id
  FROM assessor_datastore.asr_datastore.appeal
  where APPEAL_TYPE = 'ASSR';


