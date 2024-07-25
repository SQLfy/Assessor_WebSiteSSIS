


CREATE VIEW [trn].[v_etl_TBLMLSHISTORY]
/**************************************************************************************************
Description: view source prior to loading into the datastore
Usage: Select Top 100 * from [trn].[v_etl_TBLMLSHISTORY]
--------------------------------------------------------------------------------------------------
Date:		Name:			Comments:
20210325	Marc Beacom		Initial Creation
20210512	Marc Beacom		Refactored due to source system changes

**************************************************************************************************/
AS

	SELECT 
		[TBLMLSHISTORYID]
		,[MLSMONTH]
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

		,GETDATE() AS create_datetime
		,SUSER_NAME() AS create_user_id

		,HASHBYTES(	'SHA2_256'
					, isnull(cast([MLSMONTH]			as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([MLSYEAR]				as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([MLSTYPE]				as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([MONTHSOFINVENTORY]	as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([ACTIVELISTINGCOUNT]	as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([AVGDOM]				as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([MEDIANDOM]			as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([SALESCOUNT]			as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([AVGLISTPRICE]		as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([MEDIANLISTPRICE]		as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([AVGCLOSEPRICE]		as varchar(100))		, 'DBNULL_TEXT')
					+ isnull(cast([MEDIANCLOSEPRICE]	as varchar(100))		, 'DBNULL_TEXT')
				) AS rowhash 
	FROM [asr_staging].[s_TBLMLSHISTORY]