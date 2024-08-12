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


CREATE PROCEDURE [asr_staging].[insert_s_account_location]
AS 
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [asr_staging].[s_account_location] (Account_Number, State_Parcel_Number, longitude_x, latitude_y, [Location])
	SELECT ACCOUNTNO, gisloc.State_Parcel_Number, x as 'longitude_x', y as 'latitude_y', gisloc.[Location]
	FROM [assessor_staging].[asr_staging].[s_tblacctpropertyaddress] pra
	JOIN [assessor_staging].[asr_staging].[s_gis_api_locations] gisloc
	ON pra.ACCOUNTNO = gisloc.Account_Number
	WHERE [ORDERNO] = 1 -- 157974 

	SET NOCOUNT OFF;
END
GO


GO
