﻿


CREATE VIEW [rw_extract].[V_TLKPLEATYPE]
AS
SELECT LEA
      ,LEADESCRIPTION
      ,SORTORDER
      ,ACTIVEFLAG
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
FROM PRRW.ENCOMPASS.TLKPLEATYPE;





