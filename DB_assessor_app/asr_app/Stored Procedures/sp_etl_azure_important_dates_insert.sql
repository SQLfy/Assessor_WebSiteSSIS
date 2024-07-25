

CREATE PROCEDURE [asr_app].[sp_etl_azure_important_dates_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     6/15/2017
Developer:    Richard Edwards
Comments:	  Initial creation
              Truncate and Insert into the azure important dates table


			  ID
			  Description 
			  Reappraisal 
			  Event Name
			  Intervening
			  Category
			  create_datetime 
			  create_user_id 
			  update_datetime 
			  update_user_id 


*************************************************************************************/
SET NOCOUNT ON;

BEGIN
    TRUNCATE TABLE [asr_app].[azure_important_dates]

	INSERT INTO [asr_app].[azure_important_dates]
	SELECT ID,
	       Description,
	       CAST(CAST(DATEPART(Year, GETDATE()) AS varchar) + '-' + SUBSTRING(Reappraisal, 1, 3) + '-' + SUBSTRING(Reappraisal, CHARINDEX(' ', Reappraisal) + 1, 2) AS date),
		   Event_Name,
		   CAST(CAST(DATEPART(Year, GETDATE()) AS varchar) + '-' + SUBSTRING(Intervening, 1, 3) + '-' + SUBSTRING(Intervening, CHARINDEX(' ', Intervening) + 1, 2) AS date),
		   Category,
		   create_datetime,
		   create_user_id,
	       update_datetime,
		   update_user_id,
		   Title
	FROM [assessor_datastore].[asr_app_query].[v_azure_important_dates]
END
