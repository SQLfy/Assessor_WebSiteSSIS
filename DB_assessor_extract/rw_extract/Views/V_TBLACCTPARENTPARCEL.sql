


CREATE VIEW [rw_extract].[V_TBLACCTPARENTPARCEL]
AS
SELECT T1.[VERSTART]
      ,T1.[VEREND]
      ,[ACCOUNTNO]
      ,[PARENTACCOUNT]
      ,[PARENTACCOUNTON0]
      ,[PARENTACCOUNTON1]
      ,[PARENTACCOUNTON2]
      ,[ACCTPARENTPARCELOD0]
      ,[ACCTPARENTPARCELOD1]
      ,[ACCTPARENTPARCELOM0]
      ,[ACCTPARENTPARCELOM1]
      ,[ACCTPARENTPARCELOT0]
      ,[ACCTPARENTPARCELOT1]
      ,[JURISDICTIONID]
      ,[WRITEDATE]
      ,[SEQID]
  FROM [PRRW].[ENCOMPASS].[TBLACCTPARENTPARCEL] T1
   ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;





