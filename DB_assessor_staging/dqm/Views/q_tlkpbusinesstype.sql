


CREATE view [dqm].[q_tlkpbusinesstype] as select * from asr_staging.s_tlkpbusinesstype
WHERE BUSINESSCODE NOT IN
(SELECT BUSINESSCODE FROM dqm.S_TLKPBUSINESSTYPE_ERR);


