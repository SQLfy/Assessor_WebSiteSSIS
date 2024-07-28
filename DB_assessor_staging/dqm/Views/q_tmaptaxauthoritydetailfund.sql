﻿

CREATE view [dqm].[q_tmaptaxauthoritydetailfund] as 
select -- all columns
TAXAUTHORITY, TAXYEAR, FUNDCODE, PARENTFUNDCODE, ASSESSEDMILLLEVY, ALTERNATEMILLLEVY, REALFLAG, PPFLAG, MAXLEVYINCLUDEFLAG, SORTORDER, JURISDICTIONID, LASTUPDATED, LEVYTYPEID, TAXDISTRICTID, EXCLUDEREDUCEDRATEFLAG, INCLUDEONTAXBILLFLAG, PERMANENTRATE, BILLINGRATE, URDOTADJUSTMENTRATE, BUDGETEDTAXVALUE, BUDGETEDTAXRATE, TRUNCATIONLOSSVALUE, FUNDCATEGORYTYPEID
from [asr_staging].[s_tmaptaxauthoritydetailfund]
WHERE taxauthority+CAST(taxyear AS VARCHAR(4) )+fundcode NOT IN
(SELECT taxauthority+CAST(taxyear AS VARCHAR(4) )+fundcode from [dqm].[S_TMAPTAXAUTHORITYDETAILFUND_ERR]);

