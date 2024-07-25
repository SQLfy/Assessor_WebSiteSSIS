﻿


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_pers_prop_acct]
AS
SELECT
  INGRP1.ACCOUNTNO_1 ACCOUNT_NO,
case when INGRP1.LATEDECLARATION = 1 then 'Y' else 'N' end LATE_DECLARATION,
case when INGRP1.NEWCONSTRUCTIONFLAG is NOT NULL then 'Y' else 'N' end NEW_CONSTRUCTION_FLAG,
case when  INGRP1.NODEC = 1 then 'Y' else 'N' end  NODEC,
case when  INGRP1.BIA = 1 then 'Y' else 'N' end BIA, 
 case when  INGRP1.NOCHANGE = 1 then 'Y' else 'N' end NOCHANGE,
  substring(INGRP1.BUSINESSNAME,1,100) BUSINESS_NAME,
  INGRP1.BUSINESSTYPE BUSINESS_TYPE,
  dqm.Q_TLKPBUSINESSTYPE.BUSINESSTYPEDESCRIPTION BUSINESS_TYPE_DESCRIPTION,
  INGRP1.NEWCONSTRUCTIONABSTCD NEW_CONSTRUCTION_ABST_CD,
  INGRP1.NEWCONSTRUCTIONVALUE NEW_CONSTRUCTION_VALUE,
  INGRP1.DECLARATIONSENTDATE DECLARATION_SENT_DATE,
  INGRP1.DECLARATIONRETURNDATE DECLARATION_RETURN_DATE,
  INGRP1.VALUEDBY VALUED_BY,
  rowhash,
  INGRP1.ASSOCIATED_ACCOUNT
FROM
   ( SELECT
  Q_TBLACCTPP.ACCOUNTNO ACCOUNTNO_1,
  Q_TBLACCT.ACCTSTATUSCODE,
  Q_TBLACCT.BUSINESSNAME BUSINESSNAME,
  Q_TBLACCTPP.BUSINESSCODE BUSINESSTYPE,
  Q_TBLACCTPP.LATEDECLARATIONFLAG  LATEDECLARATION,
  INGRP4.SEQID NEWCONSTRUCTIONFLAG,
  INGRP4.ABSTRACTCODE NEWCONSTRUCTIONABSTCD,
  INGRP4.NCTOTALACTUALVALUE NEWCONSTRUCTIONVALUE,
  cast( Q_TBLACCTPP.PPDECLARATIONSENTDATE as varchar)  DECLARATIONSENTDATE,
  cast ( Q_TBLACCTPP.PPDECLARATIONRETURNDATE as varchar)  DECLARATIONRETURNDATE,
  Q_TBLACCTPP.PPAPPRAISER VALUEDBY,
  Q_TBLACCTPP.NODECLARATIONFLAG  NODEC,
  Q_TBLACCTPP.BESTINFOAVAILABLEFLAG  BIA,
  Q_TBLACCTPP.NOCHANGEFLAG  NOCHANGE,
  HASHBYTES('SHA2_256', ISNULL(RTRIM(Q_TBLACCTPP.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(substring(Q_TBLACCT.BUSINESSNAME,1,100)), 'DBNULL_TEXT')) AS rowhash,
  Q_TBLACCT.ASSOCIATEDACCT ASSOCIATED_ACCOUNT
FROM
    dqm.Q_TBLACCTPP  Q_TBLACCTPP   
 JOIN   W_PUBLISHED_ACCOUNT  W_PUBLISHED_ACCOUNT ON ( ( Q_TBLACCTPP.ACCOUNTNO = W_PUBLISHED_ACCOUNT.ACCOUNT_NO ) )
JOIN   dqm.Q_TBLACCT  Q_TBLACCT ON ( ( Q_TBLACCT.ACCOUNTNO = W_PUBLISHED_ACCOUNT.ACCOUNT_NO ) )
LEFT OUTER JOIN  ( SELECT
  S_TBLACCTNEWCONSTRUCTION.ACCOUNTNO ACCOUNTNO,
  S_TBLACCTNEWCONSTRUCTION.ABSTRACTCODE ABSTRACTCODE,
  S_TBLACCTNEWCONSTRUCTION.NCTOTALACTUALVALUE NCTOTALACTUALVALUE,
  S_TBLACCTNEWCONSTRUCTION.SEQID SEQID
FROM
  asr_staging.S_TBLACCTNEWCONSTRUCTION  S_TBLACCTNEWCONSTRUCTION ) INGRP4 ON ( ( INGRP4.ACCOUNTNO = Q_TBLACCTPP.ACCOUNTNO ) ) ) INGRP1   
 JOIN   dqm.Q_TLKPBUSINESSTYPE  ON ( ( INGRP1.BUSINESSTYPE = dqm.Q_TLKPBUSINESSTYPE.BUSINESSCODE ) )
WHERE INGRP1.ACCTSTATUSCODE = 'A'













