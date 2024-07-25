

CREATE view [dqm].[q_tblacctpp] as select * from asr_staging.s_tblacctpp
WHERE ACCOUNTNO NOT IN
(SELECT ACCOUNTNO FROM S_TBLACCTPP_ERR);

