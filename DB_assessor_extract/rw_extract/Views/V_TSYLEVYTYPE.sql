﻿
CREATE VIEW [rw_extract].[V_TSYLEVYTYPE]
AS
SELECT LEVYTYPEID
      ,JURISDICTIONID
      ,LEVYTYPE
      ,SORTORDER
      ,ACTIVEFLAG
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
  FROM PRRW.CCI_SYS.TSYLEVYTYPE





