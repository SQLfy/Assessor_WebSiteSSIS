

CREATE VIEW [trn].[v_etl_RESMODELANALYSISDATA]
/**************************************************************************************************
Created By: Marc Beacom
Description: view source prior to loading into the datastore
Usage: Select Top 100 * from [trn].[v_etl_RESMODELANALYSISDATA]
--------------------------------------------------------------------------------------------------
Date:		Name:			Comments:
20210325	Marc Beacom		Initial Creation
**************************************************************************************************/
AS


SELECT [RESMODELANALYSISDATAID]
      ,[NBHD]
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
	  ,GETDATE() AS create_datetime
	  ,SUSER_NAME() AS create_user_id
	  ,HASHBYTES(	'SHA2_256'
					
				  , isnull([NBHD]									, 'DBNULL_TEXT')
				  + isnull([SUBNAME]								, 'DBNULL_TEXT')
				  + isnull([ACCOUNTNO]								, 'DBNULL_TEXT')
				  + isnull([PARCELNO]								, 'DBNULL_TEXT')
				  + isnull([STREETADDRESS]							, 'DBNULL_TEXT')
				  + isnull([ANALYSISMODEL]							, 'DBNULL_TEXT')
				  + isnull([PLANMODEL]								, 'DBNULL_TEXT')
				  + isnull(cast([ADJYEARBUILT] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull([IMPQUALITY]								, 'DBNULL_TEXT')
				  + isnull([PROPERTYTYPE]							, 'DBNULL_TEXT')
				  + isnull([IMPUNITTYPE]							, 'DBNULL_TEXT')
				  + isnull(cast([CURRIMPCOUNT] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull([BLTASDESCRIPTION]						, 'DBNULL_TEXT')
				  + isnull([HVACTYPE]								, 'DBNULL_TEXT')
				  + isnull(cast([BATHCOUNT]  as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([FPCOUNT] as varchar(20))			, 'DBNULL_TEXT')
				  + isnull(cast([BLTASSF] as varchar(20))			, 'DBNULL_TEXT')
				  + isnull(cast([BASEMENTSF] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([FINISHEDBASEMENTSF] as varchar(20)), 'DBNULL_TEXT')
				  + isnull(cast([GARAGESF] as varchar(20))			, 'DBNULL_TEXT')
				  + isnull(cast([CARPORTSF] as varchar(20))			, 'DBNULL_TEXT')
				  + isnull(cast([PORCHSF] as varchar(20))			, 'DBNULL_TEXT')
				  + isnull([BASEMENT]								, 'DBNULL_TEXT')
				  + isnull(cast([LANDSF] as varchar(20))			, 'DBNULL_TEXT')
				  + isnull([GOLF]									, 'DBNULL_TEXT')
				  + isnull([GREENBELT]								, 'DBNULL_TEXT')
				  + isnull([POWERLINE]								, 'DBNULL_TEXT')
				  + isnull([SUPVIEW]								, 'DBNULL_TEXT')
				  + isnull([TRAFFIC]								, 'DBNULL_TEXT')
				  + isnull([CULDESAC]								, 'DBNULL_TEXT')
				  + isnull([TREED]									, 'DBNULL_TEXT')
				  + isnull([CORNERLOT]								, 'DBNULL_TEXT')
				  + isnull([RAILROAD]								, 'DBNULL_TEXT')
				  + isnull([UNPAVEDROAD]							, 'DBNULL_TEXT')
				  + isnull([RECEPTIONNO]							, 'DBNULL_TEXT')
				  + isnull(cast([SALEDATE] as varchar(20))			, 'DBNULL_TEXT')
				  + isnull(cast([ADJSALEPRICE] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([TASP] as varchar(20))				, 'DBNULL_TEXT')
				  + isnull(cast([VALID1FLAG] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull([EXCLUDECODE1]							, 'DBNULL_TEXT')
				  + isnull(cast([NEWCONSTRUCTION] as varchar(20))	, 'DBNULL_TEXT')
				  + isnull(cast([SALESRATIO] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([PREVIOUSVALUE] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([PREVIOUSYEAR] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([CURRENTVALUE] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([CURRENTYEAR] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([VALUECHANGE] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([PRICEPERSF] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([COUNTAPPEAL] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([UNIQUEFEATURE] as varchar(20))		, 'DBNULL_TEXT')
				  + isnull(cast([AG] as varchar(20))				, 'DBNULL_TEXT')
				  + isnull(cast([SALEPRICEPERSF] as varchar(20))	, 'DBNULL_TEXT')
				) AS rowhash 
FROM [asr_staging].[s_RESMODELANALYSISDATA]