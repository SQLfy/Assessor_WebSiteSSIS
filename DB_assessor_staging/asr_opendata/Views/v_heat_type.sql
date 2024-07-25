
create view asr_opendata.v_heat_type
as

SELECT DISTINCT
  HVACTYPE HVACTYPE,
  HVACTYPE CODE_DESCR
FROM
 asr_staging.S_TLKPIMPSHVACTYPE;

