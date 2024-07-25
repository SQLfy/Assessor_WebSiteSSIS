
CREATE view [dqm].[q_tlkpimpshvactype] as 
select * from asr_staging.s_tlkpimpshvactype
WHERE HVACTYPE+PROPERTYTYPE NOT IN 
(SELECT HVACTYPE+PROPERTYTYPE FROM asr_staging.S_TLKPIMPSHVACTYPE_ERR);