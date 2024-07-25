﻿
CREATE VIEW [rw_extract].[V_NODTABLE2]
AS
SELECT       [HEADER]
      ,[AGENT_FLAG]
      ,[REVIEWNUMBER]
      ,[TAXYEAR]
      ,[ACCOUNTNO]
      ,[SUBLOT]
      ,[SUBBLOCK]
      ,[DESC1]
      ,[DESC2]
      ,[DESC3]
      ,[DESC4]
      ,[A/D]
      ,[PRIORVALUE1]
      ,[PRIORVALUE2]
      ,[PRIORVALUE3]
      ,[PRIORVALUE4]
      ,[CURRENTVALUE1]
      ,[CURRENTVALUE2]
      ,[CURRENTVALUE3]
      ,[CURRENTVALUE4]
      ,[PETVALUETOTAL]
      ,[PRIORVALUETOTAL]
      ,[CURRENTVALUETOTAL]
      ,[APPEALACCTADJUSTDENYREASON]
      ,[APPEALACCTREASONDESC]
      ,[SUBNAME]
      ,[FILINGNO]
FROM   PRRW.dbo.NODTABLE2




