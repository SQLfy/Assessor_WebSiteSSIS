
create view asr_opendata.v_built_as_code
as

select 
[BLTASCODE] BUILT_AS_CODE, 
[BLTASDESCRIPTION] CODE_DESCR
from [asr_staging].[s_tlkpimpsbltastype];

