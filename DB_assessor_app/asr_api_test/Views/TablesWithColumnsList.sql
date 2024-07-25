

CREATE VIEW [asr_api_test].[TablesWithColumnsList]
AS
SELECT        TOP (100) PERCENT [name] AS [Table_Name], id AS [Table_ID], asr_api_test.GetColsStringByTableId(id) AS [Columns]
FROM            sys.sysobjects AS so1
WHERE        (uid = 12) AND (xtype = 'u')
