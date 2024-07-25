
-- ==========================================================================================
-- Author:		David Guillen
-- Create date: 05/12/2017
-- Description:	transformation for occupancy_code
-- ==========================================================================================


CREATE procedure [trn].[sp_occupancy_code_insert]
AS

BEGIN

insert into [assessor_datastore].[asr_datastore].[occupancy_code]
([occupancy_code],[code_descr])
select
CAST(OCCCODE as varchar(50)) OCCCODE, 
CAST(OCCCODEDESCRIPTION as varchar(256)) OCCCODEDESCRIPTION
from [asr_staging].[s_tlkpimpsocctype];

END

