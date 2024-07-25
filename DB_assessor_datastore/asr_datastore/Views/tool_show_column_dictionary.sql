

CREATE VIEW [asr_datastore].[tool_show_column_dictionary]
AS
SELECT s.name AS Schema_name, t.name AS table_Name, c.name AS column_name, value AS extended_property
FROM sys.extended_properties AS ep
INNER JOIN sys.tables AS t ON ep.major_id = t.object_id 
INNER JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE class = 1
AND minor_id > 0



