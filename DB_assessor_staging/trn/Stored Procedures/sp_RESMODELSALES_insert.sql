
CREATE PROCEDURE [trn].[sp_RESMODELSALES_insert]
AS 
begin
/**************************************************************************************************
Created By: Marc Beacom
Description: view source prior to loading into the datastore
Usage: exec [trn].[sp_RESMODELSALES_insert]
--------------------------------------------------------------------------------------------------
Date:		Name:			Comments:
20210325	Marc Beacom		Initial Creation
**************************************************************************************************/
SET NOCOUNT ON;

	MERGE	assessor_datastore.Reporting.RESMODELSALES AS myTarget
	USING	trn.v_etl_RESMODELSALES AS mySource
	ON		myTarget.rowhash = mySource.rowhash
	WHEN MATCHED 
		 THEN
			UPDATE SET	 MyTarget.[NBHD]				=	mySource.[NBHD]
						,MyTarget.[SUBNAME]				=	mySource.[SUBNAME]
						,MyTarget.[ACCOUNTNO]			=	mySource.[ACCOUNTNO]
						,MyTarget.[PARCELNO]			=	mySource.[PARCELNO]
						,MyTarget.[STREETADDRESS]		=	mySource.[STREETADDRESS]
						,MyTarget.[PLANMODEL]			=	mySource.[PLANMODEL]
						,MyTarget.[RECEPTIONNO]			=	mySource.[RECEPTIONNO]
						,MyTarget.[SALEDATE]			=	mySource.[SALEDATE]
						,MyTarget.[ADJSALEPRICE]		=	mySource.[ADJSALEPRICE]
						,MyTarget.[TASP]				=	mySource.[TASP]
						,MyTarget.[VALID1FLAG]			=	mySource.[VALID1FLAG]
						,MyTarget.[EXCLUDECODE1]		=	mySource.[EXCLUDECODE1]
						,MyTarget.[NEWCONSTRUCTION]		=	mySource.[NEWCONSTRUCTION]
						,MyTarget.[SALESRATIO]			=	mySource.[SALESRATIO]
						,MyTarget.[CURRENTVALUE]		=	mySource.[CURRENTVALUE]
						,MyTarget.[CURRENTYEAR]			=	mySource.[CURRENTYEAR]
						,MyTarget.[Create_Datetime]		=	mySource.[Create_Datetime]
						,MyTarget.[Create_User_ID]		=	mySource.[Create_User_ID]

						,myTarget.update_datetime		=	GETDATE()
						,myTarget.update_user_id		=	SUSER_NAME()
						,myTarget.rowhash				=	mySource.rowhash


	WHEN NOT MATCHED BY TARGET 
		 THEN
		 INSERT (	[NBHD]
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
					,[Create_Datetime]
					,[Create_User_ID]
					,[Rowhash]
				)
		 VALUES (	[NBHD]
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
					,[Create_Datetime]
					,[Create_User_ID]
					,[Rowhash]
				)

	WHEN NOT MATCHED BY SOURCE
		 THEN
		 DELETE;

end	--	[trn].[sp_RESMODELSALES_insert]