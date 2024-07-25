﻿

CREATE view [dqm].[q_tlkpimpsaddons] as 
select -- all columns
ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR
from [asr_staging].[s_tlkpimpsaddons]
WHERE ADDONCODE NOT IN
(SELECT ADDONCODE FROM [dqm].[S_TLKPIMPSADDONS_ERR]);


