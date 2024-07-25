
/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLADDRESSSECURE]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLADDRESSSECURE]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,ADDRESSCODE
      ,ADDRESS1
      ,ADDRESS2
      ,CITY
      ,STATECODE
      ,ZIPCODE
      ,PERSONCODE
      ,PROVINCE
      ,ADDRESSON0
      ,ADDRESSON1
      ,ADDRESSON2
      ,JURISDICTIONID
      ,COUNTRY
      ,POSTALCODE
      ,CAST(ADDRESSOD0 AS VARCHAR(22) ) ADDRESSOD0
      ,CAST(ADDRESSOD1 AS VARCHAR(22) ) ADDRESSOD1
      ,ADDRESSOM0
      ,ADDRESSOM1
      ,ADDRESSOT0
      ,ADDRESSOT1
      ,ADDRESSVALIDFLAG
      ,CAST(WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,SEQID
  FROM PRRW.ENCOMPASS.TBLADDRESSSECURE T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;









