
/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLPERSONSECURE]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLPERSONSECURE]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,PERSONCODE
      ,NAME1
      ,NAME2
      ,PHONE
      ,FAX
      ,MOBILE
      ,PAGER
      ,EMAILADDRESS
      ,FEDERALIDNO
      ,PRIVATEFLAG
      ,PERSONON0
      ,PERSONON1
      ,PERSONON2
      ,ALTNAME1
      ,PERSONTYPEID
      ,JURISDICTIONID
      ,CAST(PERSONOD0 AS VARCHAR(22) ) PERSONOD0
      ,CAST(PERSONOD1 AS VARCHAR(22) ) PERSONOD1 
      ,PERSONOM0
      ,PERSONOM1
      ,PERSONOT0
      ,PERSONOT1
      ,CAST(WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,SEQID
  FROM PRRW.ENCOMPASS.TBLPERSONSECURE T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;









