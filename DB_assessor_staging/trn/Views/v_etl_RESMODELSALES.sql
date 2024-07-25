
CREATE VIEW [trn].[v_etl_RESMODELSALES]
/**************************************************************************************************
Created By: Marc Beacom
Description: view source prior to loading into the datastore
Usage: Select Top 100 * from [trn].[v_etl_RESMODELSALES]
--------------------------------------------------------------------------------------------------
Date:		Name:			Comments:
20210325	Marc Beacom		Initial Creation
**************************************************************************************************/
AS

SELECT [RESMODELSALESID]
      ,[NBHD]
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
	  ,GETDATE() AS create_datetime
	  ,SUSER_NAME() AS create_user_id
	  ,HASHBYTES(	'SHA2_256'
					,isnull([NBHD]										, 'DBNULL_TEXT')
					+ isnull([SUBNAME]									, 'DBNULL_TEXT')
					+ isnull([ACCOUNTNO]								, 'DBNULL_TEXT')
					+ isnull([PARCELNO]									, 'DBNULL_TEXT')
					+ isnull([STREETADDRESS]							, 'DBNULL_TEXT')
					+ isnull([PLANMODEL]								, 'DBNULL_TEXT')
					+ isnull([RECEPTIONNO]								, 'DBNULL_TEXT')
					+ isnull(cast([SALEDATE] as	varchar(20))			, 'DBNULL_TEXT')
					+ isnull(cast([ADJSALEPRICE] as	varchar(20))		, 'DBNULL_TEXT')
					+ isnull(cast([TASP] as	varchar(20))				, 'DBNULL_TEXT')
					+ isnull(cast([VALID1FLAG] as	varchar(20))		, 'DBNULL_TEXT')
					+ isnull([EXCLUDECODE1]								, 'DBNULL_TEXT')
					+ isnull(cast([NEWCONSTRUCTION] as	varchar(20))	, 'DBNULL_TEXT')
					+ isnull(cast([SALESRATIO] as	varchar(20))		, 'DBNULL_TEXT')
					+ isnull(cast([CURRENTVALUE] as	varchar(20))		, 'DBNULL_TEXT')
					+ isnull(cast([CURRENTYEAR] as	varchar(20))		, 'DBNULL_TEXT')
				) AS rowhash 
  FROM [asr_staging].[s_RESMODELSALES]