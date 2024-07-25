
create view [asr_opendata].[v_document_type_code]
as

SELECT DISTINCT
  [DEEDCODE] DEED_CODE,
  [DEEDDESCRIPTION] CODE_DESCR
FROM
[asr_staging].[s_tlkpdeedtype];


