

/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLSUBACCOUNT]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLSUBACCOUNT]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,SUBNO
      ,FILINGNO
      ,T1.ACCOUNTNO
      ,BLOCK
      ,LOT
      ,TRACT
      ,SUBACCOUNTON0
      ,SUBACCOUNTON1
      ,SUBACCOUNTON2
      ,CAST(SUBACCOUNTOD0 AS VARCHAR(22) ) SUBACCOUNTOD0
      ,CAST(SUBACCOUNTOD1 AS VARCHAR(22) ) SUBACCOUNTOD1
      ,SUBACCOUNTOM0
      ,SUBACCOUNTOM1
      ,SUBACCOUNTOT0
      ,SUBACCOUNTOT1
      ,T1.JURISDICTIONID
      ,CAST(T1.WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,T1.SEQID
      ,PRIORSUBNO
      ,PRIORFILINGNO
  FROM PRRW.ENCOMPASS.TBLSUBACCOUNT T1
    , PRRW.ENCOMPASS.TBLACCT A
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend
  and A.accountno = T1.accountno
  and A.VERSTART <= p1.verstart
  and A.VEREND > p2.verend;









