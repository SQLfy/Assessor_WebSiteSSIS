USE [assessor_app]
GO

/****** Object:  Table [asr_app].[azure_important_dates]    Script Date: 3/2/2017 3:45:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [asr_app].[azure_important_dates](
	[ID] [int] NOT NULL,
	[Description] [nvarchar](220) NULL,
	[Reappraisal] [nvarchar](30) NULL,
	[Event_Name] [nvarchar](220) NULL,
	[Intervening] [nvarchar](30) NULL,
	[Category] [nvarchar](30) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
 CONSTRAINT [PK_azure_important_dates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [asr_app].[azure_important_dates] ADD  CONSTRAINT [DF_important_dates_CREATE_DTM]  DEFAULT (getdate()) FOR [create_datetime]
GO

ALTER TABLE [asr_app].[azure_important_dates] ADD  CONSTRAINT [DF_important_dates_CREATE_USER_ID]  DEFAULT (suser_name()) FOR [create_user_id]
GO

USE [assessor_app]
GO
ALTER TABLE [asr_app].[realnov] DROP CONSTRAINT [fk_nov_account]
GO

/****** Object:  Table [asr_app].[realnov]    Script Date: 3/15/2017 11:36:44 AM ******/
DROP TABLE [asr_app].[realnov]
GO

/****** Object:  Table [asr_app].[realnov]    Script Date: 3/2/2017 3:45:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [asr_app].[realnov](
	[account_no] [varchar](30) NULL,
	[TAXYEAR] [numeric](4, 0) NULL,
	[PARCELNO] [varchar](30) NULL,
	[PROPADDRESS] [varchar](81) NULL,
	[LEGALDESCRIPTION1] [nvarchar](1024) NULL,
	[LEGALDESCRIPTION2] [nvarchar](1024) NULL,
	[LEGALDESCRIPTION3] [nvarchar](1024) NULL,
	[NAME1] [varchar](40) NULL,
	[NAME2] [varchar](40) NULL,
	[PNAME1] [varchar](40) NULL,
	[PNAME2] [varchar](40) NULL,
	[OWNERADDRESS1] [varchar](40) NULL,
	[OWNERADDRESS2] [varchar](40) NULL,
	[OWNERCITY] [varchar](50) NULL,
	[OWNERSTATE] [varchar](2) NULL,
	[OWNERZIP] [varchar](5) NULL,
	[PROPCLASS1] [varchar](50) NULL,
	[PRIORVALUE1] [varchar](8000) NULL,
	[CURRENTVALUE1] [varchar](8000) NULL,
	[INCREASEDECREASE1] [varchar](8000) NULL,
	[PROPCLASS2] [varchar](50) NULL,
	[PRIORVALUE2] [varchar](8000) NULL,
	[CURRENTVALUE2] [varchar](8000) NULL,
	[INCREASEDECREASE2] [varchar](8000) NULL,
	[PROPCLASS3] [varchar](50) NULL,
	[PRIORVALUE3] [varchar](8000) NULL,
	[CURRENTVALUE3] [varchar](8000) NULL,
	[INCREASEDECREASE3] [varchar](8000) NULL,
	[PROPCLASS4] [varchar](50) NULL,
	[PRIORVALUE4] [varchar](8000) NULL,
	[CURRENTVALUE4] [varchar](8000) NULL,
	[INCREASEDECREASE4] [varchar](8000) NULL,
	[PROPCLASS5] [varchar](50) NULL,
	[PRIORVALUE5] [varchar](50) NULL,
	[CURRENTVALUE5] [varchar](50) NULL,
	[INCREASEDECREASE5] [varchar](50) NULL,
	[PROPCLASS6] [varchar](50) NULL,
	[PRIORVALUE6] [varchar](50) NULL,
	[CURRENTVALUE6] [varchar](50) NULL,
	[INCREASEDECREASE6] [varchar](50) NULL,
	[TOTALPRIOR] [varchar](8000) NULL,
	[TOTALCURRENT] [varchar](8000) NULL,
	[TOTALINCREASEDECREASE] [varchar](8000) NULL,
	[VALUEYEAR] [int] NULL,
	[PROPERTYTYPE] [varchar](15) NULL,
	[PRIMARYBUILDING] [varchar](10) NULL,
	[BUILDINGCOUNT] [varchar](3) NULL,
	[SUBDIVISION] [varchar](18) NULL,
	[NEIGHBORHOOD] [varchar](10) NULL,
	[RESIDENTIALSF] [numeric](10, 0) NULL,
	[STYLE] [varchar](18) NULL,
	[QUALITY] [varchar](15) NULL,
	[YEARBUILT] [varchar](10) NULL,
	[HEATTYPE] [varchar](18) NULL,
	[BASEMENTSF] [numeric](10, 0) NULL,
	[FINISHEDBSMNTSF] [numeric](10, 0) NULL,
	[BASEMENTTYPE] [varchar](10) NULL,
	[GARAGESF] [numeric](10, 0) NULL,
	[IMPSF] [numeric](10, 0) NULL,
	[COMMERCIALSF] [numeric](10, 0) NULL,
	[OUTBUILDINGSF] [numeric](10, 0) NULL,
	[LANDTYPE] [varchar](15) NULL,
	[ACREAGE] [varchar](10) NULL,
	[LEA] [varchar](30) NULL,
	[LANDATTRIBUTES] [varchar](150) NULL,
	[APPRDATEYEAR] [varchar](10) NULL,
	[REAPPRYEAR] [varchar](10) NULL,
	[BEGPERYEAR] [varchar](10) NULL,
	[ENDPERYEAR] [varchar](10) NULL,
	[CBOEDEADLINE] [varchar](10) NULL,
	[PRINTFLAG] [varchar](1) NULL,
	[BULKNOVFLAG] [varchar](1) NULL,
	[PRIVATEFLAG] [varchar](1) NULL,
	[create_datetime] [datetime2](7) NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,
	[ASSESSOR] [varchar](50) NULL,
	[SREXEMPTIONDEADLINE] [varchar](15) NULL,
	[VETEXEMPTIONDEADLINE] [varchar](15) NULL
) ON [PRIMARY]

GO

ALTER TABLE [asr_app].[realnov]  WITH CHECK ADD  CONSTRAINT [fk_nov_account] FOREIGN KEY([account_no])
REFERENCES [asr_app].[account] ([account_no])
ON DELETE CASCADE
GO

ALTER TABLE [asr_app].[realnov] CHECK CONSTRAINT [fk_nov_account]
GO

USE [assessor_app]
GO

/****** Object:  StoredProcedure [asr_app].[sp_etl_azure_important_dates_insert]    Script Date: 3/2/2017 3:46:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE PROCEDURE [asr_app].[sp_etl_azure_important_dates_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/2/2017
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the azure important dates table


			  ID
			  Description 
			  Reappraisal 
			  Event Name
			  Intervening
			  Category
			  create_datetime 
			  create_user_id 
			  update_datetime 
			  update_user_id 
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_app.azure_important_dates AS myTarget
USING assessor_datastore.asr_app_query.v_azure_important_dates AS mySource
ON myTarget.ID = mySource.ID
WHEN MATCHED 
	 THEN
        UPDATE SET   myTarget.Description 				   =  mySource.Description
					,myTarget.Reappraisal 						   =  mySource.Reappraisal 						
					,myTarget.Event_Name						   =  mySource.Event_Name
					,myTarget.Intervening						   =  mySource.Intervening
					,myTarget.Category						   =  mySource.Category												
					,myTarget.create_datetime 				   =  mySource.create_datetime 			
					,myTarget.create_user_id 				   =  mySource.create_user_id 			
					,myTarget.update_datetime 				   =  GETDATE() 			
					,myTarget.update_user_id 				   =  'ETL_ASR_ODS2' 			


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT ( ID
			  ,Description
			  ,Reappraisal 
			  ,Event_Name
			  ,Intervening
			  ,Category
			  ,create_datetime 
			  ,create_user_id 
			  ,update_datetime 
			  ,update_user_id 
            )
     VALUES (mySource.ID	
			 ,mySource.Description
			 ,mySource.Reappraisal 						
			 ,mySource.Event_Name
			 ,mySource.Intervening
			 ,mySource.Category
			 ,mySource.create_datetime 			
			 ,mySource.create_user_id 			
			 ,mySource.update_datetime 			
			 ,mySource.update_user_id									            
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;












GO

USE [assessor_app]
GO

/****** Object:  StoredProcedure [asr_app].[sp_realnov_insert]    Script Date: 3/2/2017 3:47:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [asr_app].[sp_realnov_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     10/20/2016
Developer:    tony golden
Comments:	  Initial creation
              Merge changes into the realnov table

Mod #:  2
Mod Date:     3/2/2017
Developer:    richard edwards
Comments:	  add realnov columns SREXEMPTIONDEADLINE and VETEXEMPTIONDEADLINE

*************************************************************************************/

SET NOCOUNT ON;

MERGE assessor_app.asr_app.realnov AS myTarget
USING assessor_datastore.asr_app_query.v_realnov  AS mySource
ON myTarget.account_no = mySource.accountno
AND myTarget.taxyear = mySource.taxyear
AND myTarget.parcelno = mySource.parcelno

WHEN MATCHED 
	 THEN
        UPDATE SET   
                      myTarget.account_no				=  mySource.ACCOUNTNO
					, myTarget.TAXYEAR					=  mySource.TAXYEAR
					, myTarget.PARCELNO					=  mySource.PARCELNO
					, myTarget.PROPADDRESS				=  mySource.PROPADDRESS
					, myTarget.LEGALDESCRIPTION1		=  mySource.LEGALDESCRIPTION1
					, myTarget.LEGALDESCRIPTION2		=  mySource.LEGALDESCRIPTION2
					, myTarget.LEGALDESCRIPTION3		=  mySource.LEGALDESCRIPTION3
					, myTarget.NAME1					=  mySource.NAME1
					, myTarget.NAME2					=  mySource.NAME2
					, myTarget.PNAME1					=  mySource.PNAME1
					, myTarget.PNAME2					=  mySource.PNAME2
					, myTarget.OWNERADDRESS1			=  mySource.OWNERADDRESS1
					, myTarget.OWNERADDRESS2			=  mySource.OWNERADDRESS2
					, myTarget.OWNERCITY				=  mySource.OWNERCITY
					, myTarget.OWNERSTATE				=  mySource.OWNERSTATE
					, myTarget.OWNERZIP					=  mySource.OWNERZIP
					, myTarget.PROPCLASS1				=  mySource.PROPCLASS1
					, myTarget.PRIORVALUE1				=  mySource.PRIORVALUE1
					, myTarget.CURRENTVALUE1			=  mySource.CURRENTVALUE1
					, myTarget.INCREASEDECREASE1		=  mySource.INCREASEDECREASE1
					, myTarget.PROPCLASS2				=  mySource.PROPCLASS2
					, myTarget.PRIORVALUE2				=  mySource.PRIORVALUE2
					, myTarget.CURRENTVALUE2			=  mySource.CURRENTVALUE2
					, myTarget.INCREASEDECREASE2		=  mySource.INCREASEDECREASE2
					, myTarget.PROPCLASS3				=  mySource.PROPCLASS3
					, myTarget.PRIORVALUE3				=  mySource.PRIORVALUE3
					, myTarget.CURRENTVALUE3			=  mySource.CURRENTVALUE3
					, myTarget.INCREASEDECREASE3		=  mySource.INCREASEDECREASE3
					, myTarget.PROPCLASS4				=  mySource.PROPCLASS4
					, myTarget.PRIORVALUE4				=  mySource.PRIORVALUE4
					, myTarget.CURRENTVALUE4			=  mySource.CURRENTVALUE4
					, myTarget.INCREASEDECREASE4		=  mySource.INCREASEDECREASE4
					, myTarget.PROPCLASS5				=  mySource.PROPCLASS5
					, myTarget.PRIORVALUE5				=  mySource.PRIORVALUE5
					, myTarget.CURRENTVALUE5			=  mySource.CURRENTVALUE5
					, myTarget.INCREASEDECREASE5		=  mySource.INCREASEDECREASE5
					, myTarget.PROPCLASS6				=  mySource.PROPCLASS6
					, myTarget.PRIORVALUE6				=  mySource.PRIORVALUE6
					, myTarget.CURRENTVALUE6			=  mySource.CURRENTVALUE6
					, myTarget.INCREASEDECREASE6		=  mySource.INCREASEDECREASE6
					, myTarget.TOTALPRIOR				=  mySource.TOTALPRIOR
					, myTarget.TOTALCURRENT				=  mySource.TOTALCURRENT
					, myTarget.TOTALINCREASEDECREASE	=  mySource.TOTALINCREASEDECREASE
					, myTarget.VALUEYEAR				=  mySource.VALUEYEAR
					, myTarget.PROPERTYTYPE				=  mySource.PROPERTYTYPE
					, myTarget.PRIMARYBUILDING			=  mySource.PRIMARYBUILDING
					, myTarget.BUILDINGCOUNT			=  mySource.BUILDINGCOUNT
					, myTarget.SUBDIVISION				=  mySource.SUBDIVISION
					, myTarget.NEIGHBORHOOD				=  mySource.NEIGHBORHOOD
					, myTarget.RESIDENTIALSF			=  mySource.RESIDENTIALSF
					, myTarget.STYLE					=  mySource.STYLE
					, myTarget.QUALITY					=  mySource.QUALITY
					, myTarget.YEARBUILT				=  mySource.YEARBUILT
					, myTarget.HEATTYPE					=  mySource.HEATTYPE
					, myTarget.BASEMENTSF				=  mySource.BASEMENTSF
					, myTarget.FINISHEDBSMNTSF			=  mySource.FINISHEDBSMNTSF
					, myTarget.BASEMENTTYPE				=  mySource.BASEMENTTYPE
					, myTarget.GARAGESF					=  mySource.GARAGESF
					, myTarget.IMPSF					=  mySource.IMPSF
					, myTarget.COMMERCIALSF				=  mySource.COMMERCIALSF
					, myTarget.OUTBUILDINGSF			=  mySource.OUTBUILDINGSF
					, myTarget.LANDTYPE					=  mySource.LANDTYPE
					, myTarget.ACREAGE					=  mySource.ACREAGE
					, myTarget.LEA						=  mySource.LEA
					, myTarget.LANDATTRIBUTES			=  mySource.LANDATTRIBUTES
					, myTarget.APPRDATEYEAR				=  mySource.APPRDATEYEAR
					, myTarget.REAPPRYEAR				=  mySource.REAPPRYEAR
					, myTarget.BEGPERYEAR				=  mySource.BEGPERYEAR
					, myTarget.ENDPERYEAR				=  mySource.ENDPERYEAR
					, myTarget.CBOEDEADLINE				=  mySource.CBOEDEADLINE
					, myTarget.PRINTFLAG				=  mySource.PRINTFLAG
					, myTarget.BULKNOVFLAG				=  mySource.BULKNOVFLAG
					, myTarget.PRIVATEFLAG				=  mySource.PRIVATEFLAG
					, myTarget.create_datetime			=  mySource.create_datetime
					, myTarget.create_user_id			=  mySource.create_user_id
					, myTarget.update_datetime			=  GETDATE()
					, myTarget.update_user_id			=  SUSER_NAME()
					, myTarget.ASSESSOR                 = mySource.ASSESSOR
					, myTarget.SREXEMPTIONDEADLINE      = mySource.SREXEMPTIONDEADLINE
					, myTarget.VETEXEMPTIONDEADLINE     = mySource.VETEXEMPTIONDEADLINE				  
				  

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
              account_no
			 , TAXYEAR
			 , PARCELNO
			 , PROPADDRESS
			 , LEGALDESCRIPTION1
			 , LEGALDESCRIPTION2
			 , LEGALDESCRIPTION3
			 , NAME1
			 , NAME2
			 , PNAME1
			 , PNAME2
			 , OWNERADDRESS1
			 , OWNERADDRESS2
			 , OWNERCITY
			 , OWNERSTATE
			 , OWNERZIP
			 , PROPCLASS1
			 , PRIORVALUE1
			 , CURRENTVALUE1
			 , INCREASEDECREASE1
			 , PROPCLASS2
			 , PRIORVALUE2
			 , CURRENTVALUE2
			 , INCREASEDECREASE2
			 , PROPCLASS3
			 , PRIORVALUE3
			 , CURRENTVALUE3
			 , INCREASEDECREASE3
			 , PROPCLASS4
			 , PRIORVALUE4
			 , CURRENTVALUE4
			 , INCREASEDECREASE4
			 , PROPCLASS5
			 , PRIORVALUE5
			 , CURRENTVALUE5
			 , INCREASEDECREASE5
			 , PROPCLASS6
			 , PRIORVALUE6
			 , CURRENTVALUE6
			 , INCREASEDECREASE6
			 , TOTALPRIOR
			 , TOTALCURRENT
			 , TOTALINCREASEDECREASE
			 , VALUEYEAR
			 , PROPERTYTYPE
			 , PRIMARYBUILDING
			 , BUILDINGCOUNT
			 , SUBDIVISION
			 , NEIGHBORHOOD
			 , RESIDENTIALSF
			 , STYLE
			 , QUALITY
			 , YEARBUILT
			 , HEATTYPE
			 , BASEMENTSF
			 , FINISHEDBSMNTSF
			 , BASEMENTTYPE
			 , GARAGESF
			 , IMPSF
			 , COMMERCIALSF
			 , OUTBUILDINGSF
			 , LANDTYPE
			 , ACREAGE
			 , LEA
			 , LANDATTRIBUTES
			 , APPRDATEYEAR
			 , REAPPRYEAR
			 , BEGPERYEAR
			 , ENDPERYEAR
			 , CBOEDEADLINE
			 , PRINTFLAG
			 , BULKNOVFLAG
			 , PRIVATEFLAG
			 , create_datetime
			 , create_user_id
			 , update_datetime
			 , update_user_id
			 , ASSESSOR
			 , SREXEMPTIONDEADLINE
			 , VETEXEMPTIONDEADLINE
            )
     VALUES (
	           mySource.ACCOUNTNO
			 , mySource.TAXYEAR
			 , mySource.PARCELNO
			 , mySource.PROPADDRESS
			 , mySource.LEGALDESCRIPTION1
			 , mySource.LEGALDESCRIPTION2
			 , mySource.LEGALDESCRIPTION3
			 , mySource.NAME1
			 , mySource.NAME2
			 , mySource.PNAME1
			 , mySource.PNAME2
			 , mySource.OWNERADDRESS1
			 , mySource.OWNERADDRESS2
			 , mySource.OWNERCITY
			 , mySource.OWNERSTATE
			 , mySource.OWNERZIP
			 , mySource.PROPCLASS1
			 , mySource.PRIORVALUE1
			 , mySource.CURRENTVALUE1
			 , mySource.INCREASEDECREASE1
			 , mySource.PROPCLASS2
			 , mySource.PRIORVALUE2
			 , mySource.CURRENTVALUE2
			 , mySource.INCREASEDECREASE2
			 , mySource.PROPCLASS3
			 , mySource.PRIORVALUE3
			 , mySource.CURRENTVALUE3
			 , mySource.INCREASEDECREASE3
			 , mySource.PROPCLASS4
			 , mySource.PRIORVALUE4
			 , mySource.CURRENTVALUE4
			 , mySource.INCREASEDECREASE4
			 , mySource.PROPCLASS5
			 , mySource.PRIORVALUE5
			 , mySource.CURRENTVALUE5
			 , mySource.INCREASEDECREASE5
			 , mySource.PROPCLASS6
			 , mySource.PRIORVALUE6
			 , mySource.CURRENTVALUE6
			 , mySource.INCREASEDECREASE6
			 , mySource.TOTALPRIOR
			 , mySource.TOTALCURRENT
			 , mySource.TOTALINCREASEDECREASE
			 , mySource.VALUEYEAR
			 , mySource.PROPERTYTYPE
			 , mySource.PRIMARYBUILDING
			 , mySource.BUILDINGCOUNT
			 , mySource.SUBDIVISION
			 , mySource.NEIGHBORHOOD
			 , mySource.RESIDENTIALSF
			 , mySource.STYLE
			 , mySource.QUALITY
			 , mySource.YEARBUILT
			 , mySource.HEATTYPE
			 , mySource.BASEMENTSF
			 , mySource.FINISHEDBSMNTSF
			 , mySource.BASEMENTTYPE
			 , mySource.GARAGESF
			 , mySource.IMPSF
			 , mySource.COMMERCIALSF
			 , mySource.OUTBUILDINGSF
			 , mySource.LANDTYPE
			 , mySource.ACREAGE
			 , mySource.LEA
			 , mySource.LANDATTRIBUTES
			 , mySource.APPRDATEYEAR
			 , mySource.REAPPRYEAR
			 , mySource.BEGPERYEAR
			 , mySource.ENDPERYEAR
			 , mySource.CBOEDEADLINE
			 , mySource.PRINTFLAG
			 , mySource.BULKNOVFLAG
			 , mySource.PRIVATEFLAG
			 , mySource.create_datetime
			 , mySource.create_user_id
			 , mySource.update_datetime
			 , mySource.update_user_id
			 , mySource.ASSESSOR
			 , mySource.SREXEMPTIONDEADLINE
			 , mySource.VETEXEMPTIONDEADLINE
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;








GO
