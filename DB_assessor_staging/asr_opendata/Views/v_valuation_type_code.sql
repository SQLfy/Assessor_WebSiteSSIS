

create view [asr_opendata].[v_valuation_type_code]
as

SELECT distinct [ABSTRACTTYPE] ABSTRACTTYPE,
ABSTRACTTYPE CODE_DESCR
  FROM [asr_staging].[s_tlkpabstractcodetype];

