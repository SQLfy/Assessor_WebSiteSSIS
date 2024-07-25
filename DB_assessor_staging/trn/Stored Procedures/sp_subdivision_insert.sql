
-- ==========================================================================================
-- Author:		David Guillen
-- Create date: 05/12/2017
-- Description:	transformation for subdivision
-- ==========================================================================================


CREATE procedure [trn].[sp_subdivision_insert]
AS

BEGIN

truncate table  [assessor_datastore].[asr_datastore].[subdivision];

insert into [assessor_datastore].[asr_datastore].[subdivision]
([subdivision_no], [subdivision_name])

SELECT 
  AGGREGATOR.RECORDINGNO RECORDINGNO,
  AGGREGATOR.MIN_SUB_NAME MIN_SUB_NAME
FROM
  (SELECT
  S_TBNSUBFILING.SUBFILINGRECORDINGNO  RECORDINGNO,
  MIN(S_TBNSUBDIVISION.SUBNAME) MIN_SUB_NAME
FROM
    asr_staging.S_TBNSUBDIVISION  
 JOIN   asr_staging.S_TBNSUBFILING ON ( ( S_TBNSUBDIVISION.SUBNO = S_TBNSUBFILING.SUBNO ) )
GROUP BY
S_TBNSUBFILING.SUBFILINGRECORDINGNO)  AGGREGATOR;

END


