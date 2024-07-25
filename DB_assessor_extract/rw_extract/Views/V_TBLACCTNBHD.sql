
/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLACCTNBHD]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLACCTNBHD]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,ACCOUNTNO
      ,NBHDCODE
      ,NBHDEXTENSION
      ,PROPERTYTYPE
      ,NBHDADJUSTMENTVALUE
      ,ACCTNBHDON0
      ,ACCTNBHDON1
      ,ACCTNBHDON2
      ,CAST(ACCTNBHDOD0 AS VARCHAR(22) ) ACCTNBHDOD0
      ,CAST(ACCTNBHDOD1 AS VARCHAR(22) ) ACCTNBHDOD1
      ,ACCTNBHDOM0
      ,ACCTNBHDOM1
      ,ACCTNBHDOT0
      ,ACCTNBHDOT1
      ,JURISDICTIONID
      ,CAST(WRITEDATE AS VARCHAR(22) )  WRITEDATE
      ,SEQID
  FROM PRRW.ENCOMPASS.TBLACCTNBHD T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;









