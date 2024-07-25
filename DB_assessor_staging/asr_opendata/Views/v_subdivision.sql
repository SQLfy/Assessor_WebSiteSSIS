﻿
create view asr_opendata.v_subdivision
as

SELECT
  S_TBNSUBFILING.SUBFILINGRECORDINGNO  RECORDINGNO,
  MIN(S_TBNSUBDIVISION.SUBNAME) MIN_SUB_NAME
FROM
   asr_staging.S_TBNSUBDIVISION  
 JOIN  asr_staging.S_TBNSUBFILING ON ( ( S_TBNSUBDIVISION.SUBNO = S_TBNSUBFILING.SUBNO ) )
GROUP BY
S_TBNSUBFILING.SUBFILINGRECORDINGNO;

