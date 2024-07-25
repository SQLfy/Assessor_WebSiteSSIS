



-- ===========================================================================================
-- Author:		David Guillen
-- Create date: 2/4/2016
-- Description:	PROCEDURE USED FOR LOGGING LOAD ASR_ODS2 START AND END TIMES
--              THIS LOGGING TABLE WAS REQUESTED BY ASSESSOR SIMPLE SEARCH APPLICATION
--              AND THE DATA IS A SHARED LOGGING LOCATION FOR ETL AND ELASTIC SEARCH INDEXING
-- ===========================================================================================

CREATE PROCEDURE [asr_ods2].[sp_data_processing_log] @dml_type nvarchar(6), @process_status nvarchar(32)

AS 
BEGIN


IF @dml_type = 'INSERT' 
		 
	INSERT INTO [asr_ods2].[data_processing_log] 
	(process_name, process_start_time, process_end_time, process_status)
	VALUES ('ETL LOAD TO ASR_ODS2',GETDATE(),NULL, 'DATA LOAD IN PROGRESS');

ELSE IF @dml_type= 'UPDATE'

	UPDATE [asr_ods2].[data_processing_log]
		SET process_end_time = GETDATE(),
		    process_status = @process_status
		WHERE data_processing_log_id = 
			(SELECT max(data_processing_log_id)
				 FROM [asr_ods2].[data_processing_log]
					WHERE process_name = 'ETL LOAD TO ASR_ODS2'
					AND	process_status = 'DATA LOAD IN PROGRESS'
					AND process_end_time IS NULL);


END




