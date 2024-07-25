

-- =============================================
-- Author:		David Guillen	
-- Create date: 5/12/2017
-- Description:	transformation for heat_type
-- =============================================

create procedure [trn].[sp_heat_type_insert]
as

BEGIN

insert into [assessor_datastore].[asr_datastore].[heat_type]
([heat_type],[code_descr])
SELECT DISTINCT
  HVACTYPE HVACTYPE,
  HVACTYPE CODE_DESCR
FROM
  asr_staging.S_TLKPIMPSHVACTYPE;

 END


