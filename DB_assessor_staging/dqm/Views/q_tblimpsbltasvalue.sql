
CREATE view [dqm].[q_tblimpsbltasvalue] as select * from asr_staging.s_tblimpsbltasvalue
WHERE ACCOUNTNO NOT IN 
(SELECT ACCOUNTNO FROM asr_staging.S_TBLIMPSBLTASVALUE_ERR);

