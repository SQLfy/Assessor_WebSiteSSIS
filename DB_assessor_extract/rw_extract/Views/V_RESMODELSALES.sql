
CREATE VIEW [rw_extract].[V_RESMODELSALES]
AS
/**************************************************************************************************
Created By:		Marc Beacom
Description:	Used in the ODS2 extract to bring tables used in the Assesor Propery PBI Report
Usage:			select top 100 * from [rw_extract].[V_RESMODELSALES]
--------------------------------------------------------------------------------------------------
Date:		Name:			Comments:
20210324	Marc Beacom		Initial Creation

**************************************************************************************************/

SELECT 
		[NBHD]
		,[SUBNAME]
		,[ACCOUNTNO]
		,[PARCELNO]
		,[STREETADDRESS]
		,[PLANMODEL]
		,[RECEPTIONNO]
		,[SALEDATE]
		,[ADJSALEPRICE]
		,[TASP]
		,[VALID1FLAG]
		,[EXCLUDECODE1]
		,[NEWCONSTRUCTION]
		,[SALESRATIO]
		,[CURRENTVALUE]
		,[CURRENTYEAR]
FROM	[PRRW].[dbo].[RESMODELSALES]

