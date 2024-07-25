

CREATE VIEW [asr_ods2].[tool_show_asr_app_column_dictionary]
AS
SELECT s.name AS Schema_name, t.name AS table_Name, c.name AS column_name, ep.value AS extended_property 
FROM sys.schemas s INNER JOIN
              sys.tables t  ON t.schema_id = s.schema_id INNER JOIN
              sys.columns AS c ON c.object_id = t.object_id LEFT JOIN
			  sys.extended_properties AS ep ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
WHERE     s.name = 'asr_app'
  AND     t.name <> 'data_processing_log'
  AND     c.name <> 'create_datetime' and c.name <> 'create_user_id'
  AND     c.name <> 'update_datetime' and c.name <> 'update_user_id'
  AND     c.name <> 'rowhash' 



