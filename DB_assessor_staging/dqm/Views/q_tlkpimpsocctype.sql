﻿
CREATE view [dqm].[q_tlkpimpsocctype] as 
select -- all columns
OCCCODE, OCCCODEDESCRIPTION, ABSTRACTCODE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED
from [asr_staging].[s_tlkpimpsocctype]
WHERE OCCCODE NOT IN 
(SELECT OCCCODE FROM [dqm].[S_TLKPIMPSOCCTYPE_ERR]);


