USE [assessor_datastore]
GO

/****** Object:  Table [asr_datastore].[azure_important_dates]    Script Date: 3/2/2017 3:35:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [asr_datastore].[azure_important_dates](
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

ALTER TABLE [asr_datastore].[azure_important_dates] ADD  CONSTRAINT [DF_important_dates_CREATE_DTM]  DEFAULT (getdate()) FOR [create_datetime]
GO

ALTER TABLE [asr_datastore].[azure_important_dates] ADD  CONSTRAINT [DF_important_dates_CREATE_USER_ID]  DEFAULT (suser_name()) FOR [create_user_id]
GO

USE [assessor_datastore]
GO

/****** Object:  Table [asr_datastore].[realnov]    Script Date: 3/2/2017 3:36:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [asr_datastore].[realnov](
	[ACCOUNTNO] [varchar](30) NULL,
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
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[ASSESSOR] [varchar](50) NULL,
	[SREXEMPTIONDEADLINE] [varchar](15) NULL,
	[VETEXEMPTIONDEADLINE] [varchar](15) NULL
) ON [PRIMARY]

GO

USE [assessor_datastore]
GO

/****** Object:  View [asr_app_query].[v_azure_important_dates]    Script Date: 3/2/2017 3:40:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [asr_app_query].[v_azure_important_dates]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/2/2017
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access azure_important_dates for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT ID, Description, Reappraisal, Event_Name, Intervening, Category, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.azure_important_dates;












GO

USE [assessor_datastore]
GO

/****** Object:  View [asr_app_query].[v_realnov]    Script Date: 3/2/2017 3:42:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [asr_app_query].[v_realnov]
AS
SELECT        rn.ACCOUNTNO, rn.TAXYEAR, rn.PARCELNO, rn.PROPADDRESS, rn.LEGALDESCRIPTION1, rn.LEGALDESCRIPTION2, rn.LEGALDESCRIPTION3, rn.NAME1, rn.NAME2, rn.PNAME1, rn.PNAME2, 
                         rn.OWNERADDRESS1, rn.OWNERADDRESS2, rn.OWNERCITY, rn.OWNERSTATE, rn.OWNERZIP, rn.PROPCLASS1, rn.PRIORVALUE1, rn.CURRENTVALUE1, rn.INCREASEDECREASE1, rn.PROPCLASS2, 
                         rn.PRIORVALUE2, rn.CURRENTVALUE2, rn.INCREASEDECREASE2, rn.PROPCLASS3, rn.PRIORVALUE3, rn.CURRENTVALUE3, rn.INCREASEDECREASE3, rn.PROPCLASS4, rn.PRIORVALUE4, rn.CURRENTVALUE4, 
                         rn.INCREASEDECREASE4, rn.PROPCLASS5, rn.PRIORVALUE5, rn.CURRENTVALUE5, rn.INCREASEDECREASE5, rn.PROPCLASS6, rn.PRIORVALUE6, rn.CURRENTVALUE6, rn.INCREASEDECREASE6, 
                         rn.TOTALPRIOR, rn.TOTALCURRENT, rn.TOTALINCREASEDECREASE, rn.VALUEYEAR, rn.PROPERTYTYPE, rn.PRIMARYBUILDING, rn.BUILDINGCOUNT, rn.SUBDIVISION, rn.NEIGHBORHOOD, rn.RESIDENTIALSF, 
                         rn.STYLE, rn.QUALITY, rn.YEARBUILT, rn.HEATTYPE, rn.BASEMENTSF, rn.FINISHEDBSMNTSF, rn.BASEMENTTYPE, rn.GARAGESF, rn.IMPSF, rn.COMMERCIALSF, rn.OUTBUILDINGSF, rn.LANDTYPE, rn.ACREAGE,
                          rn.LEA, rn.LANDATTRIBUTES, rn.APPRDATEYEAR, rn.REAPPRYEAR, rn.BEGPERYEAR, rn.ENDPERYEAR, rn.CBOEDEADLINE, rn.PRINTFLAG, rn.BULKNOVFLAG, rn.PRIVATEFLAG, rn.create_datetime, 
                         rn.create_user_id, rn.update_datetime, rn.update_user_id, rn.ASSESSOR, rn.SREXEMPTIONDEADLINE, rn.VETEXEMPTIONDEADLINE

FROM            asr_datastore.realnov AS rn INNER JOIN
                         assessor_app.asr_app.account AS ac ON rn.ACCOUNTNO = ac.account_no


GO


