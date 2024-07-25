CREATE TABLE [asr_staging].[etl_parameter_bkp] (
    [PARAMETER_NAME]  VARCHAR (50)   NOT NULL,
    [PARAMETER_VALUE] VARCHAR (100)  NULL,
    [PARAMETER_DESCR] VARCHAR (1000) NULL,
    [CREATE_DTM]      DATETIME2 (7)  CONSTRAINT [DF_etl_parameter_CREATE_DTM_bkp] DEFAULT (getdate()) NULL,
    [CREATE_USER_ID]  VARCHAR (30)   CONSTRAINT [DF_etl_parameter_CREATE_USER_ID_bkp] DEFAULT (suser_name()) NULL,
    [UPDATE_DTM]      DATETIME2 (7)  NULL,
    [UPDATE_USER_ID]  VARCHAR (30)   NULL,
    CONSTRAINT [pk_etl_parameter_bkp] PRIMARY KEY CLUSTERED ([PARAMETER_NAME] ASC)
);


GO

-- =============================================
-- Author:		David Guillen
-- Create date: 02/16/2016
-- Description:	trigger will update columns UPDATE_DTM and UPDATE_USER_ID
--              in table asr_staging.etl_parameter
--              after any update to this table
-- =============================================
CREATE TRIGGER [asr_staging].[trg_upd_etl_parameter] 
   ON  [asr_staging].[etl_parameter_bkp] 
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	update asr_staging.etl_parameter
		SET [UPDATE_DTM] = getdate(),
		[UPDATE_USER_ID] = SUSER_NAME()
			from asr_staging.etl_parameter e 
			INNER JOIN inserted i
				on e.PARAMETER_NAME = i.PARAMETER_NAME


END



