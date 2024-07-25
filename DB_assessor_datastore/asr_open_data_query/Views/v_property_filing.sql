
create view [asr_open_data_query].[v_property_filing]
as

SELECT     FilingKey, SUB_FILING_RECORDING_NO, SUBDIVISION_NAME, FILING_NO, FILING_DESCRIPTION AS FILING_DESCR
FROM        (SELECT     FilingKey, SUB_FILING_RECORDING_NO, SUBDIVISION_NAME, FILING_NO, FILING_DESCRIPTION, ROW_NUMBER() OVER (PARTITION BY FilingKey
                   ORDER BY FILING_NO DESC) AS DedupKey
FROM        (SELECT     isnull(cast(SUB_FILING_RECORDING_NO AS varchar(max)), '') + isnull(cast(SUBDIVISION_NAME AS varchar(max)), '') + isnull(cast(FILING_NO AS varchar(max)), '') AS FilingKey, SUB_FILING_RECORDING_NO, SUBDIVISION_NAME, FILING_NO, 
                                     FILING_DESCRIPTION
                   FROM        [assessor_datastore].[asr_datastore].[sub_filing] pf) a) x
WHERE     x.DedupKey = 1
