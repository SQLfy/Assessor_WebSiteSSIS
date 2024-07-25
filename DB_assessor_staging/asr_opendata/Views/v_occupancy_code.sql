
create view asr_opendata.v_occupancy_code
as

select
OCCCODE, OCCCODEDESCRIPTION CODE_DESCR
from [asr_staging].[s_tlkpimpsocctype];

