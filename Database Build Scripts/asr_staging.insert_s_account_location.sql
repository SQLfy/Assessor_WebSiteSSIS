USE [assessor_staging]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/******************************************************************************
NAME:     insert_s_account_location
PURPOSE:  New source for GIS Account x/y Data -- Produces one primary account w/ x,y coordinates
NOTE:	  x = longitude; y = latitude. Colorado is between the 39th and 40th parallel.
Uses dependency staging tables of 
		[s_tblacctpropertyaddress]  
		[s_gis_api_locations]
To load s_account_location
To avoid changing a large number of views this small transform is done in the stating area.
The alternative was to get gis to change their API which would have taken more time.

EXEC [asr_staging].[insert_s_account_location]
select count(*) from [asr_staging].[s_account_location] 

REVISIONS:
Date        Author           Description
----------- ---------------- --------------------
2024-08-10  Kate Totten      INC0086311 - ODS2 GIS Failure
******************************************************************************/
-- Current version is in DB Build scripts

--CREATE OR ALTER PROCEDURE [asr_staging].[insert_s_account_location]
--AS 
BEGIN
	SET NOCOUNT ON;
	Select getdate()
	SET NOCOUNT OFF;
END

GO
