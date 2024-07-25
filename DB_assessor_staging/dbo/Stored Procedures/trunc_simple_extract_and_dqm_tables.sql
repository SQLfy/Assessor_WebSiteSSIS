
create procedure [dbo].[trunc_simple_extract_and_dqm_tables] AS

BEGIN

truncate table [asr_staging].[s_tblimpsbltasvalue]
truncate table [asr_staging].[s_tblimpsbltasvalue_err]
truncate table [asr_staging].[s_tlkpimpshvactype]
truncate table [asr_staging].[s_tlkpimpshvactype_err]

END


