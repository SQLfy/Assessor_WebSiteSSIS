﻿

CREATE VIEW [rw_extract].[V_TLKPTAXAUTHORITY]
AS
SELECT TAXAUTHORITY
      ,STATEAUTHORITYCODE
      ,AUTHORITYTYPE
      ,AUTHORITYNAME
      ,CAST(CREATIONDATE AS VARCHAR(22) ) CREATIONDATE
      ,CONTACTPERSON
      ,CONTACTADDRESS1
      ,CONTACTADDRESS2
      ,CONTACTCITY
      ,CONTACTSTATE
      ,CONTACTZIPCODE
      ,AFFILIATE
      ,AUTHORITYSIZE
      ,SORTORDER
      ,ACTIVEFLAG
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,CONTACTPHONE
      ,AUTHORITYVALUETYPE
      ,ISURBANRENEWALAUTHORIZERFLAG
FROM PRRW.ENCOMPASS.TLKPTAXAUTHORITY;






