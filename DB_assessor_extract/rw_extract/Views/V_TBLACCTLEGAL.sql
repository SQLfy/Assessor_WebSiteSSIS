



CREATE VIEW [rw_extract].[V_TBLACCTLEGAL]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,ACCOUNTNO
      ,CAST(LEGAL AS VARCHAR(4000) ) LEGAL
      ,ACCTLEGALON0
      ,ACCTLEGALON1
      ,ACCTLEGALON2
      ,CAST(ACCTLEGALOD0 AS VARCHAR(22) ) ACCTLEGALOD0
      ,CAST(ACCTLEGALOD1 AS VARCHAR(22) ) ACCTLEGALOD1
      ,ACCTLEGALOM0
      ,ACCTLEGALOM1
      ,ACCTLEGALOT0
      ,ACCTLEGALOT1
      ,JURISDICTIONID
      ,CAST(WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,SEQID
      ,SHORTDESCRIPTION
  FROM PRRW.ENCOMPASS.TBLACCTLEGAL T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend
  and  ACCOUNTNO not like 'P%';










