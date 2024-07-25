

CREATE PROCEDURE [trn].[sp_TBLMLSHISTORY_insert]
AS 
begin
/**************************************************************************************************
Description: view source prior to loading into the datastore
Usage: exec [trn].[sp_TBLMLSHISTORY_insert]
--------------------------------------------------------------------------------------------------
Date:		Name:			Comments:
20210325	Marc Beacom		Initial Creation
20210512	Marc Beacom		Refactored due to source system changes

**************************************************************************************************/
SET NOCOUNT ON;

	MERGE	assessor_datastore.Reporting.TBLMLSHISTORY AS myTarget
	USING	trn.v_etl_TBLMLSHISTORY AS mySource
	ON		myTarget.rowhash = mySource.rowhash
	WHEN MATCHED 
		 THEN
			UPDATE SET	 myTarget.[MLSMONTH]			=	mySource.[MLSMONTH]			
						,myTarget.[MLSYEAR]				=	mySource.[MLSYEAR]				
						,myTarget.[MLSTYPE]				=	mySource.[MLSTYPE]				
						,myTarget.[MONTHSOFINVENTORY]	=	mySource.[MONTHSOFINVENTORY]	
						,myTarget.[ACTIVELISTINGCOUNT]	=	mySource.[ACTIVELISTINGCOUNT]	
						,myTarget.[AVGDOM]				=	mySource.[AVGDOM]				
						,myTarget.[MEDIANDOM]			=	mySource.[MEDIANDOM]			
						,myTarget.[SALESCOUNT]			=	mySource.[SALESCOUNT]			
						,myTarget.[AVGLISTPRICE]		=	mySource.[AVGLISTPRICE]		
						,myTarget.[MEDIANLISTPRICE]		=	mySource.[MEDIANLISTPRICE]		
						,myTarget.[AVGCLOSEPRICE]		=	mySource.[AVGCLOSEPRICE]		
						,myTarget.[MEDIANCLOSEPRICE]	=	mySource.[MEDIANCLOSEPRICE]	
						,myTarget.[create_datetime]		=	mySource.[create_datetime]
						,myTarget.[create_user_id]		=	mySource.[create_user_id]
						,myTarget.update_datetime		=	GETDATE()
						,myTarget.update_user_id		=	SUSER_NAME()
						,myTarget.rowhash				=	mySource.rowhash


	WHEN NOT MATCHED BY TARGET 
		 THEN
		 INSERT (	 [MLSMONTH]			
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
					,[create_datetime]
					,[create_user_id]
					,[rowhash]
				)
		 VALUES (	 [MLSMONTH]			
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
					,[create_datetime]
					,[create_user_id]
					,[rowhash]
				)

	WHEN NOT MATCHED BY SOURCE
		 THEN
		 DELETE;

end	--	[trn].[sp_TBLMLSHISTORY_insert]