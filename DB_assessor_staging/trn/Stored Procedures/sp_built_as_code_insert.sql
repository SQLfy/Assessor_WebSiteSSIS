
-- ==========================================================================================
-- Author:		David Guillen
-- Create date: 05/12/2017
-- Description:	transformation for built_as_code
-- ==========================================================================================


CREATE procedure [trn].[sp_built_as_code_insert]
AS

BEGIN

insert into [assessor_datastore].[asr_datastore].[built_as_code]
([built_as_code],[code_descr])

select
BLTASCODE, BLTASDESCRIPTION
from [assessor_staging].[asr_staging].[s_tlkpimpsbltastype];

END


