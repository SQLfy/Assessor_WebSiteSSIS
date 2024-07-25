

CREATE VIEW [rw_extract].[V_RESMODELANALYSISDATA]
AS
/**************************************************************************************************
Created By:		Marc Beacom
Description:	Used in the ODS2 extract to bring tables used in the Assesor Propery PBI Report
Usage:			select top 100 * from [rw_extract].[V_RESMODELANALYSISDATA]
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
		,[ANALYSISMODEL]
		,[PLANMODEL]
		,[ADJYEARBUILT]
		,[IMPQUALITY]
		,[PROPERTYTYPE]
		,[IMPUNITTYPE]
		,[CURRIMPCOUNT]
		,[BLTASDESCRIPTION]
		,[HVACTYPE]
		,[BATHCOUNT]
		,[FPCOUNT]
		,[BLTASSF]
		,[BASEMENTSF]
		,[FINISHEDBASEMENTSF]
		,[GARAGESF]
		,[CARPORTSF]
		,[PORCHSF]
		,[BASEMENT]
		,[LANDSF]
		,[GOLF]
		,[GREENBELT]
		,[POWERLINE]
		,[SUPVIEW]
		,[TRAFFIC]
		,[CULDESAC]
		,[TREED]
		,[CORNERLOT]
		,[RAILROAD]
		,[UNPAVEDROAD]
		,[RECEPTIONNO]
		,[SALEDATE]
		,[ADJSALEPRICE]
		,[TASP]
		,[VALID1FLAG]
		,[EXCLUDECODE1]
		,[NEWCONSTRUCTION]
		,[SALESRATIO]
		,[PREVIOUSVALUE]
		,[PREVIOUSYEAR]
		,[CURRENTVALUE]
		,[CURRENTYEAR]
		,[VALUECHANGE]
		,[PRICEPERSF]
		,[COUNTAPPEAL]
		,[UNIQUEFEATURE]
		,[AG]
		,[SALEPRICEPERSF]
FROM	[PRRW].[dbo].[RESMODELANALYSISDATA]

