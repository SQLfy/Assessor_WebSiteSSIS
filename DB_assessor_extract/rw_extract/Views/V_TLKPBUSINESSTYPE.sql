﻿

/****** Object:  View [ODS_EXTRACT_ASR].[V_TLKPBUSINESSTYPE]    Script Date: 10/30/2013 11:58:51 AM ******/





CREATE VIEW [rw_extract].[V_TLKPBUSINESSTYPE]
AS
SELECT BUSINESSCODE
      ,BUSINESSTYPEDESCRIPTION
      ,ACTIVEFLAG
      ,SORTORDER
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
FROM PRRW.ENCOMPASS.TLKPBUSINESSTYPE ;








