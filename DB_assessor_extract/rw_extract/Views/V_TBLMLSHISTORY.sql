

CREATE VIEW [rw_extract].[V_TBLMLSHISTORY]
AS
/**************************************************************************************************
Description:	Used in the ODS2 extract to bring tables used in the Assesor Propery PBI Report
Usage:			select top 100 * from [rw_extract].[V_TBLMLSHISTORY]
--------------------------------------------------------------------------------------------------
Date:		Name:			Comments:
20210324	Marc Beacom		Initial Creation
20210512	Marc Beacom		Refactored due to source system changes

**************************************************************************************************/


SELECT 
		[MLSMONTH]
		,[MLSYEAR]
		,[MLSTYPE]
		,[MONTHSOFINVENTORY]
		,[ACTIVELISTINGCOUNT]
		,[AVGDOM]
		,[MEDIANDOM]
		,[SALESCOUNT]
		,[AVGLISTPRICE]
		,[MEDIANLISTPRICE]
		,[AVGCLOSEPRICE]
		,[MEDIANCLOSEPRICE]
FROM	[PRRW].[dbo].[TBLMLSHISTORY]

