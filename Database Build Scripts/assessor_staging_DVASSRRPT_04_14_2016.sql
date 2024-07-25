USE [master]
GO
/****** Object:  Database [assessor_staging]    Script Date: 4/14/2016 11:01:37 AM ******/
CREATE DATABASE [assessor_staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_staging', FILENAME = N'E:\Data\assessor_staging_NEW.mdf' , SIZE = 8184832KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_staging_log', FILENAME = N'E:\Logs\assessor_staging_log_NEW.ldf' , SIZE = 9930624KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [assessor_staging] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assessor_staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assessor_staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assessor_staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assessor_staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assessor_staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assessor_staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [assessor_staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assessor_staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assessor_staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assessor_staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assessor_staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assessor_staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assessor_staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assessor_staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assessor_staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assessor_staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [assessor_staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assessor_staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assessor_staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assessor_staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assessor_staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assessor_staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assessor_staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assessor_staging] SET RECOVERY FULL 
GO
ALTER DATABASE [assessor_staging] SET  MULTI_USER 
GO
ALTER DATABASE [assessor_staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assessor_staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [assessor_staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [assessor_staging] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [assessor_staging] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'assessor_staging', N'ON'
GO
USE [assessor_staging]
GO
/****** Object:  User [DCGD\dbrooks]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE USER [DCGD\dbrooks] FOR LOGIN [DCGD\dbrooks] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DCGD\database_development]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE USER [DCGD\database_development] FOR LOGIN [DCGD\database_development]
GO
/****** Object:  User [DCGD\cstanton]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE USER [DCGD\cstanton] FOR LOGIN [DCGD\cstanton] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [assessor_app_user]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE USER [assessor_app_user] FOR LOGIN [assessor_app_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DCGD\dbrooks]
GO
ALTER ROLE [db_owner] ADD MEMBER [DCGD\database_development]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DCGD\cstanton]
GO
ALTER ROLE [db_datareader] ADD MEMBER [assessor_app_user]
GO
/****** Object:  Schema [asr_staging]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE SCHEMA [asr_staging]
GO
/****** Object:  Schema [dqm]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE SCHEMA [dqm]
GO
/****** Object:  Schema [trn]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE SCHEMA [trn]
GO
/****** Object:  Table [asr_staging].[etl_parameter]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[etl_parameter](
	[PARAMETER_NAME] [varchar](50) NOT NULL,
	[PARAMETER_VALUE] [varchar](100) NULL,
	[PARAMETER_DESCR] [varchar](1000) NULL,
	[CREATE_DTM] [datetime2](7) NULL CONSTRAINT [DF_etl_parameter_CREATE_DTM]  DEFAULT (getdate()),
	[CREATE_USER_ID] [varchar](30) NULL CONSTRAINT [DF_etl_parameter_CREATE_USER_ID]  DEFAULT (suser_name()),
	[UPDATE_DTM] [datetime2](7) NULL,
	[UPDATE_USER_ID] [varchar](30) NULL,
 CONSTRAINT [pk_etl_parameter] PRIMARY KEY CLUSTERED 
(
	[PARAMETER_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_account_location]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_account_location](
	[Account_Number] [varchar](50) NULL,
	[State_Parcel_number] [nvarchar](15) NULL,
	[longitude_x] [numeric](30, 8) NULL,
	[latitude_y] [numeric](30, 8) NULL,
	[elevation_z] [numeric](30, 8) NULL,
	[Location] [nvarchar](50) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblacct]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblacct](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[PARCELNO] [varchar](30) NULL,
	[LOCALNO] [varchar](30) NULL,
	[MAPNO] [varchar](40) NULL,
	[ACCTSTATUSCODE] [varchar](1) NULL,
	[ACCTTYPE] [varchar](15) NULL,
	[ASSIGNEDTO] [varchar](20) NULL,
	[VALUEAREACODE] [varchar](10) NULL,
	[ASSOCIATEDACCT] [varchar](30) NULL,
	[APPRAISALTYPE] [varchar](30) NULL,
	[ECONOMICAREACODE] [varchar](10) NULL,
	[ACCTDATECREATED] [varchar](22) NULL,
	[DEFAULTAPPROACHTYPE] [varchar](15) NULL,
	[DEFAULTTAXDISTRICT] [varchar](10) NULL,
	[BUSINESSLICENSE] [varchar](10) NULL,
	[MAPGROUP] [varchar](2) NULL,
	[CONTROLMAP] [varchar](5) NULL,
	[PROPERTYIDENTIFIER] [varchar](1) NULL,
	[SPECIALINTERESTNUMBER] [varchar](3) NULL,
	[ACCTON0] [numeric](20, 6) NULL,
	[ACCTON1] [numeric](20, 6) NULL,
	[ACCTON2] [numeric](20, 6) NULL,
	[PRIMARYUSECODE] [varchar](10) NULL,
	[WARD] [varchar](2) NULL,
	[ACCTOD0] [varchar](22) NULL,
	[ACCTOD1] [varchar](22) NULL,
	[ACCTOM0] [varchar](50) NULL,
	[ACCTOM1] [varchar](50) NULL,
	[STRIPPEDACCOUNTNO] [varchar](30) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[ACCTOT0] [varchar](50) NULL,
	[ACCTOT1] [varchar](50) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[CENSUSTRACT] [numeric](6, 2) NULL,
	[CENSUSBLOCK] [numeric](6, 2) NULL,
	[MOBILEHOMESPACE] [varchar](10) NULL,
	[EFILEFLAG] [numeric](1, 0) NULL,
	[BUSINESSNAME] [varchar](255) NULL,
	[COSTHYBRIDPERCENT] [numeric](15, 4) NULL,
	[MARKETHYBRIDPERCENT] [numeric](15, 4) NULL,
	[INCOMEHYBRIDPERCENT] [numeric](15, 4) NULL,
	[RECONCILEDHYBRIDPERCENT] [numeric](15, 4) NULL,
	[PARCELSEQUENCE] [numeric](4, 0) NULL,
	[PROPERTYCLASSID] [numeric](15, 0) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[DETAILEDREVIEWDATE] [varchar](22) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tblacct_ClusteredIndex-accountno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblacctlegal]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblacctlegal](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[LEGAL] [varchar](4000) NULL,
	[ACCTLEGALON0] [numeric](20, 6) NULL,
	[ACCTLEGALON1] [numeric](20, 6) NULL,
	[ACCTLEGALON2] [numeric](20, 6) NULL,
	[ACCTLEGALOD0] [varchar](22) NULL,
	[ACCTLEGALOD1] [varchar](22) NULL,
	[ACCTLEGALOM0] [varchar](50) NULL,
	[ACCTLEGALOM1] [varchar](50) NULL,
	[ACCTLEGALOT0] [varchar](50) NULL,
	[ACCTLEGALOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[SHORTDESCRIPTION] [varchar](255) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblacctnbhd]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblacctnbhd](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[NBHDCODE] [varchar](10) NULL,
	[NBHDEXTENSION] [varchar](10) NULL,
	[PROPERTYTYPE] [varchar](15) NULL,
	[NBHDADJUSTMENTVALUE] [numeric](15, 4) NULL,
	[ACCTNBHDON0] [numeric](20, 6) NULL,
	[ACCTNBHDON1] [numeric](20, 6) NULL,
	[ACCTNBHDON2] [numeric](20, 6) NULL,
	[ACCTNBHDOD0] [varchar](22) NULL,
	[ACCTNBHDOD1] [varchar](22) NULL,
	[ACCTNBHDOM0] [varchar](50) NULL,
	[ACCTNBHDOM1] [varchar](50) NULL,
	[ACCTNBHDOT0] [varchar](50) NULL,
	[ACCTNBHDOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblacctowneraddress]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblacctowneraddress](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[PERSONCODE] [numeric](15, 0) NULL,
	[ADDRESSCODE] [numeric](15, 0) NULL,
	[PRIMARYOWNERFLAG] [numeric](1, 0) NULL,
	[ACCTOWNERADDRESSON0] [numeric](20, 6) NULL,
	[ACCTOWNERADDRESSON1] [numeric](20, 6) NULL,
	[ACCTOWNERADDRESSON2] [numeric](20, 6) NULL,
	[ACCTOWNERADDRESSOD0] [varchar](22) NULL,
	[ACCTOWNERADDRESSOD1] [varchar](22) NULL,
	[ACCTOWNERADDRESSOM0] [varchar](50) NULL,
	[ACCTOWNERADDRESSOM1] [varchar](50) NULL,
	[ACCTOWNERADDRESSOT0] [varchar](50) NULL,
	[ACCTOWNERADDRESSOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[OWNERPERCENT] [numeric](9, 8) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[OWNERSHIPTYPE] [varchar](50) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblacctpropertyaddress]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblacctpropertyaddress](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[BUILDINGID] [varchar](10) NULL,
	[PREDIRECTION] [varchar](2) NULL,
	[STREETNO] [varchar](15) NULL,
	[UNITNAME] [varchar](6) NULL,
	[POSTDIRECTION] [varchar](2) NULL,
	[STREETTYPE] [varchar](4) NULL,
	[STREETNAME] [varchar](50) NULL,
	[PROPERTYZIPCODE] [varchar](10) NULL,
	[PROPERTYCITY] [varchar](50) NULL,
	[ORDERNO] [numeric](5, 0) NULL,
	[ACCTPROPERTYADDRESSON0] [numeric](20, 6) NULL,
	[ACCTPROPERTYADDRESSON1] [numeric](20, 6) NULL,
	[ACCTPROPERTYADDRESSON2] [numeric](20, 6) NULL,
	[BUSINESSNAME] [varchar](255) NULL,
	[ACCTPROPERTYADDRESSOD0] [varchar](22) NULL,
	[ACCTPROPERTYADDRESSOD1] [varchar](22) NULL,
	[ACCTPROPERTYADDRESSOM0] [varchar](50) NULL,
	[ACCTPROPERTYADDRESSOM1] [varchar](50) NULL,
	[ACCTPROPERTYADDRESSOT0] [varchar](50) NULL,
	[ACCTPROPERTYADDRESSOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[PROPERTYADDRESSCODE] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[LOCATIONID] [numeric](15, 0) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tblacctpropertyaddress_accountno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblacctreal]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblacctreal](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPONLYFLAG] [numeric](1, 0) NULL,
	[TIFFLAG] [numeric](1, 0) NULL,
	[VACANTFLAG] [numeric](1, 0) NULL,
	[LANDWIDTH] [numeric](11, 0) NULL,
	[LANDDEPTH] [numeric](11, 0) NULL,
	[LANDEASEMENTSF] [numeric](20, 6) NULL,
	[LANDEXCESSSF] [numeric](20, 6) NULL,
	[TRAFFICCOUNT] [numeric](15, 0) NULL,
	[PARKINGSPACES] [numeric](15, 0) NULL,
	[ZONINGCODE] [varchar](50) NULL,
	[FLOODFRINGE] [numeric](11, 0) NULL,
	[FLOODWAY] [numeric](11, 0) NULL,
	[TAPFEE] [numeric](15, 2) NULL,
	[PLATTEDFLAG] [numeric](1, 0) NULL,
	[LANDCERTIFICATIONCODE] [varchar](10) NULL,
	[LANDAPPRAISER] [varchar](20) NULL,
	[LANDAPPRAISALDATE] [varchar](22) NULL,
	[LANDOVERRIDESIZEADJ] [numeric](20, 6) NULL,
	[LANDSIZEADJ] [numeric](20, 6) NULL,
	[LANDGROSSSF] [numeric](20, 6) NULL,
	[LANDGROSSACRES] [numeric](20, 6) NULL,
	[LANDGROSSFF] [numeric](20, 6) NULL,
	[LANDGROSSUNITCOUNT] [numeric](20, 6) NULL,
	[ACCTREALON0] [numeric](20, 6) NULL,
	[ACCTREALON1] [numeric](20, 6) NULL,
	[ACCTREALON2] [numeric](20, 6) NULL,
	[ACCTREALOD0] [varchar](22) NULL,
	[ACCTREALOD1] [varchar](22) NULL,
	[ACCTREALOM0] [varchar](50) NULL,
	[ACCTREALOM1] [varchar](50) NULL,
	[ACCTREALOT0] [varchar](50) NULL,
	[ACCTREALOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[DEFAULTLEA] [varchar](30) NULL,
	[TOTALACCTIMPINTERESTPCT] [numeric](9, 6) NULL,
	[TOTALACCTLANDINTERESTPCT] [numeric](9, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tbladdresssecure]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tbladdresssecure](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ADDRESSCODE] [numeric](15, 0) NULL,
	[ADDRESS1] [varchar](50) NULL,
	[ADDRESS2] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATECODE] [varchar](2) NULL,
	[ZIPCODE] [varchar](10) NULL,
	[PERSONCODE] [numeric](15, 0) NULL,
	[PROVINCE] [varchar](50) NULL,
	[ADDRESSON0] [numeric](20, 6) NULL,
	[ADDRESSON1] [numeric](20, 6) NULL,
	[ADDRESSON2] [numeric](20, 6) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[COUNTRY] [varchar](100) NULL,
	[POSTALCODE] [varchar](20) NULL,
	[ADDRESSOD0] [varchar](22) NULL,
	[ADDRESSOD1] [varchar](22) NULL,
	[ADDRESSOM0] [varchar](50) NULL,
	[ADDRESSOM1] [varchar](50) NULL,
	[ADDRESSOT0] [varchar](50) NULL,
	[ADDRESSOT1] [varchar](50) NULL,
	[ADDRESSVALIDFLAG] [numeric](1, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblimps]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblimps](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[IMPDESCRIPTION] [varchar](100) NULL,
	[COSTVALUEBY] [varchar](10) NULL,
	[MARKETVALUEBY] [varchar](10) NULL,
	[INCOMEVALUEBY] [varchar](10) NULL,
	[LANDATTRIBUTEDPCT] [numeric](15, 4) NULL,
	[IMPCOMPLETEDPCT] [numeric](15, 4) NULL,
	[IMPQUALITY] [varchar](15) NULL,
	[IMPUNITTYPE] [varchar](30) NULL,
	[IMPDESIGNADJPCT] [numeric](15, 4) NULL,
	[IMPEXTERIORADJPCT] [numeric](15, 4) NULL,
	[IMPPHYSICALDEPRPCT] [numeric](15, 4) NULL,
	[FUNCTIONALOBSOLESCEPCT] [numeric](15, 4) NULL,
	[ECONOMICOBSOLESCEPCT] [numeric](15, 4) NULL,
	[IMPOTHERADJPCT] [numeric](15, 4) NULL,
	[MHTITLENO] [varchar](30) NULL,
	[MHSERIALNO] [varchar](30) NULL,
	[MHTOTALLENGTH] [numeric](15, 0) NULL,
	[MHDECALNO] [varchar](30) NULL,
	[MHTAGNO] [varchar](30) NULL,
	[APPRAISER] [varchar](20) NULL,
	[APPRAISALDATE] [varchar](22) NULL,
	[OWNEROCCUPIEDFLAG] [numeric](1, 0) NULL,
	[COSTMETHOD] [varchar](30) NULL,
	[MARKETMETHOD] [varchar](30) NULL,
	[INCOMEMETHOD] [varchar](30) NULL,
	[IMPCONDITIONTYPE] [varchar](40) NULL,
	[CONDOLANDPERCENT] [numeric](15, 6) NULL,
	[IMPSF] [numeric](15, 0) NULL,
	[CONDOIMPPERCENT] [numeric](15, 6) NULL,
	[IMPPERIMETER] [numeric](15, 0) NULL,
	[IMPINTERIORADJPCT] [numeric](15, 4) NULL,
	[CONDOIMPSF] [numeric](15, 0) NULL,
	[IMPAMATEURADJPCT] [numeric](15, 4) NULL,
	[IMPNETSF] [numeric](15, 0) NULL,
	[PROPERTYTYPE] [varchar](15) NULL,
	[APPROACHTYPE] [varchar](15) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[IMPSOT0] [varchar](50) NULL,
	[IMPSOT1] [varchar](50) NULL,
	[IMPSOM0] [varchar](50) NULL,
	[IMPSOM1] [varchar](50) NULL,
	[IMPSOD0] [varchar](22) NULL,
	[IMPSOD1] [varchar](22) NULL,
	[IMPSON0] [numeric](20, 6) NULL,
	[IMPSON1] [numeric](20, 6) NULL,
	[IMPSON2] [numeric](20, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [s_tblimps_ClusteredIndex-accountno_impno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [s_tblimps_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimps]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblimpsbltas]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblimpsbltas](
	[DETAILID] [numeric](15, 0) NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[BLTASCODE] [numeric](15, 0) NULL,
	[HVACPERCENT] [numeric](15, 4) NULL,
	[CLIMATE] [varchar](15) NULL,
	[IMPEXTERIOR] [varchar](50) NULL,
	[IMPINTERIOR] [varchar](30) NULL,
	[BLTASSTORIES] [numeric](15, 2) NULL,
	[BLTASSTORYHEIGHT] [numeric](15, 0) NULL,
	[ROOFTYPE] [varchar](30) NULL,
	[ROOFCOVER] [varchar](30) NULL,
	[FLOORCOVER] [varchar](30) NULL,
	[BLTASFOUNDATION] [varchar](30) NULL,
	[ROOMCOUNT] [numeric](7, 0) NULL,
	[BEDROOMCOUNT] [numeric](7, 2) NULL,
	[BLTASTOTALUNITCOUNT] [numeric](15, 0) NULL,
	[IMPBLTASOTHER] [numeric](15, 0) NULL,
	[CLASSCODE] [varchar](10) NULL,
	[DIAMETER] [numeric](15, 0) NULL,
	[CAPACITY] [numeric](15, 0) NULL,
	[BLTASHORSEPOWER] [numeric](15, 0) NULL,
	[BLTASHEIGHT] [numeric](15, 0) NULL,
	[BLTASYEARBUILT] [numeric](4, 0) NULL,
	[YEARREMODELED] [numeric](4, 0) NULL,
	[REMODELEDPERCENT] [numeric](15, 4) NULL,
	[EFFECTIVEAGE] [numeric](5, 0) NULL,
	[BLTASLENGTH] [numeric](15, 0) NULL,
	[BLTASWIDTH] [numeric](15, 0) NULL,
	[MHTAGLENGTH] [numeric](15, 0) NULL,
	[MHTAGWIDTH] [numeric](15, 0) NULL,
	[MHSKIRT] [varchar](30) NULL,
	[MHSKIRTLINEARFEET] [numeric](15, 0) NULL,
	[MHWALLTYPE] [varchar](32) NULL,
	[BLTASSF] [numeric](15, 0) NULL,
	[SPRINKLERSF] [numeric](15, 0) NULL,
	[BATHCOUNT] [numeric](7, 2) NULL,
	[PRIMARYBLTASORDERNO] [numeric](5, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[HVACTYPE] [varchar](30) NULL,
	[IMPSBLTASOT0] [varchar](50) NULL,
	[IMPSBLTASOT1] [varchar](50) NULL,
	[IMPSBLTASOM0] [varchar](50) NULL,
	[IMPSBLTASOM1] [varchar](50) NULL,
	[IMPSBLTASOD0] [varchar](22) NULL,
	[IMPSBLTASOD1] [varchar](22) NULL,
	[IMPSBLTASON0] [numeric](20, 6) NULL,
	[IMPSBLTASON1] [numeric](20, 6) NULL,
	[IMPSBLTASON2] [numeric](20, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[MHDEPRCODE] [varchar](10) NULL,
	[MHMAKE] [varchar](50) NULL,
	[MHMODELNAME] [varchar](30) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[APEXID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblimpsdetail]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblimpsdetail](
	[DETAILID] [numeric](15, 0) NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[IMPDETAILTYPE] [varchar](30) NULL,
	[IMPDETAILDESCRIPTION] [varchar](50) NULL,
	[DETAILUNITCOUNT] [numeric](15, 4) NULL,
	[DETAILYEARBUILT] [numeric](4, 0) NULL,
	[ADDONCODE] [numeric](15, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[APEXLINKFLAG] [numeric](1, 0) NULL,
	[IMPSDETAILOT0] [varchar](50) NULL,
	[IMPSDETAILOT1] [varchar](50) NULL,
	[IMPSDETAILOM0] [varchar](50) NULL,
	[IMPSDETAILOM1] [varchar](50) NULL,
	[IMPSDETAILOD0] [varchar](22) NULL,
	[IMPSDETAILOD1] [varchar](22) NULL,
	[IMPSDETAILON0] [numeric](20, 6) NULL,
	[IMPSDETAILON1] [numeric](20, 6) NULL,
	[IMPSDETAILON2] [numeric](20, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[IMPDETAILTYPEID] [numeric](5, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [s_tblimpsdetail_ClusteredIndex-accountno_impno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [s_tblimpsdetail_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsdetail]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblimpsocc]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblimpsocc](
	[DETAILID] [numeric](15, 0) NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[OCCCODE] [numeric](15, 0) NULL,
	[OCCPERCENT] [numeric](15, 4) NULL,
	[ABSTRACTCODE] [varchar](10) NULL,
	[IMPABSTRACTVALUE] [numeric](15, 2) NULL,
	[ABSTRACTINDATE] [varchar](22) NULL,
	[ABSTRACTOUTDATE] [varchar](22) NULL,
	[ABSTRACTADJCODE] [varchar](5) NULL,
	[PRORATETYPE] [varchar](10) NULL,
	[TAXDISTRICT] [varchar](10) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[IMPSOCCOT0] [varchar](50) NULL,
	[IMPSOCCOT1] [varchar](50) NULL,
	[IMPSOCCOM0] [varchar](50) NULL,
	[IMPSOCCOM1] [varchar](50) NULL,
	[IMPSOCCOD0] [varchar](22) NULL,
	[IMPSOCCOD1] [varchar](22) NULL,
	[IMPSOCCON0] [numeric](20, 6) NULL,
	[IMPSOCCON1] [numeric](20, 6) NULL,
	[IMPSOCCON2] [numeric](20, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[OCCCOMPLETEDPCT] [numeric](15, 4) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [s_tblimpsocc_ClusteredIndex-accountno_impno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [s_tblimpsocc_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsocc]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tbllandabstract]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tbllandabstract](
	[ACCOUNTNO] [varchar](30) NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[LANDTYPE] [varchar](15) NULL,
	[ABSTRACTCODE] [varchar](10) NULL,
	[LANDACRES] [numeric](20, 6) NULL,
	[LANDSF] [numeric](20, 6) NULL,
	[LANDFF] [numeric](20, 6) NULL,
	[LANDUNITCOUNT] [numeric](20, 6) NULL,
	[LANDVALUEPER] [numeric](15, 2) NULL,
	[LANDVALUE] [numeric](15, 2) NULL,
	[LANDOVERRIDEFLAG] [numeric](1, 0) NULL,
	[LANDOVERRIDETOTAL] [numeric](15, 2) NULL,
	[LANDACTUALTOTAL] [numeric](15, 2) NULL,
	[LANDCLASS] [varchar](10) NULL,
	[LANDSUBCLASS] [varchar](10) NULL,
	[LANDVALUEBY] [varchar](20) NULL,
	[LANDVALUEMEASURE] [varchar](20) NULL,
	[ABSTRACTINDATE] [varchar](22) NULL,
	[ABSTRACTOUTDATE] [varchar](22) NULL,
	[PRORATETYPE] [varchar](10) NULL,
	[LANDACTIVEFLAG] [numeric](1, 0) NULL,
	[DETAILID] [numeric](15, 0) NULL,
	[ABSTRACTADJCODE] [varchar](5) NULL,
	[LANDVALUEPERADJFACTOR] [numeric](15, 6) NULL,
	[ATTRIBUTEADJFLAG] [numeric](1, 0) NULL,
	[LANDADJSIZE] [numeric](20, 6) NULL,
	[LANDOVERRIDEADJSIZE] [numeric](20, 6) NULL,
	[LANDABSTRACTON0] [numeric](20, 6) NULL,
	[LANDABSTRACTON1] [numeric](20, 6) NULL,
	[LANDABSTRACTON2] [numeric](20, 6) NULL,
	[LANDOVERRIDEVALUEPER] [numeric](15, 2) NULL,
	[TAXDISTRICT] [varchar](10) NULL,
	[LANDABSTRACTOD0] [varchar](22) NULL,
	[LANDABSTRACTOD1] [varchar](22) NULL,
	[LANDABSTRACTOM0] [varchar](50) NULL,
	[LANDABSTRACTOM1] [varchar](50) NULL,
	[LANDABSTRACTOT0] [varchar](50) NULL,
	[LANDABSTRACTOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[MSALANDVALUE] [numeric](15, 2) NULL,
	[MSALANDVALUEPER] [numeric](15, 2) NULL,
	[LEA] [varchar](30) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [s_tbllandabstract_ClusteredIndex-accountno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [s_tbllandabstract_ClusteredIndex-accountno] ON [asr_staging].[s_tbllandabstract]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tbllandattribute]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tbllandattribute](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[DETAILID] [numeric](15, 0) NULL,
	[ATTRIBUTETYPE] [varchar](30) NULL,
	[ATTRIBUTESUBTYPE] [varchar](50) NULL,
	[ATTRIBUTEADJUSTMENT] [numeric](15, 6) NULL,
	[FILTERTYPE] [varchar](15) NULL,
	[LANDATTRIBUTEOT0] [varchar](50) NULL,
	[LANDATTRIBUTEOT1] [varchar](50) NULL,
	[LANDATTRIBUTEON0] [numeric](20, 6) NULL,
	[LANDATTRIBUTEON1] [numeric](20, 6) NULL,
	[LANDATTRIBUTEON2] [numeric](20, 6) NULL,
	[LANDATTRIBUTEOD0] [varchar](22) NULL,
	[LANDATTRIBUTEOD1] [varchar](22) NULL,
	[LANDATTRIBUTEOM0] [varchar](50) NULL,
	[LANDATTRIBUTEOM1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblpersonsecure]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblpersonsecure](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[PERSONCODE] [numeric](15, 0) NULL,
	[NAME1] [varchar](60) NULL,
	[NAME2] [varchar](60) NULL,
	[PHONE] [varchar](18) NULL,
	[FAX] [varchar](18) NULL,
	[MOBILE] [varchar](18) NULL,
	[PAGER] [varchar](18) NULL,
	[EMAILADDRESS] [varchar](100) NULL,
	[FEDERALIDNO] [varchar](30) NULL,
	[PRIVATEFLAG] [numeric](1, 0) NULL,
	[PERSONON0] [numeric](20, 6) NULL,
	[PERSONON1] [numeric](20, 6) NULL,
	[PERSONON2] [numeric](20, 6) NULL,
	[ALTNAME1] [varchar](60) NULL,
	[PERSONTYPEID] [numeric](15, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[PERSONOD0] [varchar](22) NULL,
	[PERSONOD1] [varchar](22) NULL,
	[PERSONOM0] [varchar](50) NULL,
	[PERSONOM1] [varchar](50) NULL,
	[PERSONOT0] [varchar](50) NULL,
	[PERSONOT1] [varchar](50) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblsale]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblsale](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[RECEPTIONNO] [varchar](30) NULL,
	[BOOK] [varchar](6) NULL,
	[PAGE] [varchar](10) NULL,
	[GRANTOR] [varchar](80) NULL,
	[GRANTEE] [varchar](80) NULL,
	[DOCUMENTDATE] [varchar](22) NULL,
	[SALEDATE] [varchar](22) NULL,
	[DOCUMENTFEE] [numeric](15, 2) NULL,
	[DEEDCODE] [varchar](10) NULL,
	[PENALTYFLAG] [numeric](1, 0) NULL,
	[PENALTYDATE] [varchar](22) NULL,
	[SALEPRICE] [numeric](15, 2) NULL,
	[PPADJAMOUNT] [numeric](15, 2) NULL,
	[GOODWILLADJAMOUNT] [numeric](15, 2) NULL,
	[OTHERADJAMOUNT] [numeric](15, 2) NULL,
	[TIMEADJ] [numeric](15, 4) NULL,
	[DOWNPAYMENTAMOUNT] [numeric](15, 2) NULL,
	[DOWNPAYMENTPCT] [numeric](15, 4) NULL,
	[NOTEAMOUNT] [numeric](15, 2) NULL,
	[INTERESTRATEPCT] [numeric](15, 4) NULL,
	[LOANTERM] [numeric](15, 4) NULL,
	[POINTSPAID] [numeric](15, 4) NULL,
	[POINTSPAIDBY] [varchar](30) NULL,
	[LOANINSTITUTION] [varchar](50) NULL,
	[MKTRATEPCT] [numeric](15, 4) NULL,
	[PAYMENTAMOUNT] [numeric](15, 2) NULL,
	[RECOURSEFLAG] [numeric](1, 0) NULL,
	[TENANT] [varchar](30) NULL,
	[VALID1FLAG] [numeric](1, 0) NULL,
	[VALID2FLAG] [numeric](1, 0) NULL,
	[CONFIRMEDFLAG] [numeric](1, 0) NULL,
	[EXCLUDECODE1] [varchar](10) NULL,
	[EXCLUDECODE2] [varchar](10) NULL,
	[IMPROVEDFLAG] [numeric](1, 0) NULL,
	[CONFIRMBY] [varchar](30) NULL,
	[CONFIRMMETHOD] [varchar](30) NULL,
	[CONFIRMDATE] [varchar](22) NULL,
	[COMMENTS] [varchar](500) NULL,
	[NONSALEFLAG] [numeric](1, 0) NULL,
	[SALEON0] [numeric](20, 6) NULL,
	[SALEON1] [numeric](20, 6) NULL,
	[SALEON2] [numeric](20, 6) NULL,
	[SALEOD0] [varchar](22) NULL,
	[SALEOD1] [varchar](22) NULL,
	[SALEOM0] [varchar](50) NULL,
	[SALEOM1] [varchar](50) NULL,
	[SALEOT0] [varchar](50) NULL,
	[SALEOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[BALLOONPAYMENTYEAR] [numeric](4, 0) NULL,
	[TRANSFERDECLARATIONFLAG] [numeric](1, 0) NULL,
	[TRANSFERDECLARATIONDATE] [varchar](22) NULL,
	[QUESTIONNAIREMAILDATE] [varchar](22) NULL,
	[QUESTIONNAIRERETURNDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [s_tblsale_ClusteredIndex-receptionno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [s_tblsale_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsale]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblsaleacct]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblsaleacct](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[RECEPTIONNO] [varchar](30) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[INVENTORYEFFECTIVEDATE] [varchar](22) NULL,
	[ACCTADJSALEPRICE] [numeric](15, 2) NULL,
	[GROUPPRIMARYACCTFLAG] [numeric](1, 0) NULL,
	[SALEACCTON0] [numeric](20, 6) NULL,
	[SALEACCTON1] [numeric](20, 6) NULL,
	[SALEACCTON2] [numeric](20, 6) NULL,
	[SALEACCTOD0] [varchar](22) NULL,
	[SALEACCTOD1] [varchar](22) NULL,
	[SALEACCTOM0] [varchar](50) NULL,
	[SALEACCTOM1] [varchar](50) NULL,
	[SALEACCTOT0] [varchar](50) NULL,
	[SALEACCTOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SALEACCTPENALTYDATE] [varchar](22) NULL,
	[SALEACCTPENALTYFLAG] [numeric](1, 0) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [s_tblsaleacct_ClusteredIndex-receptionno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [s_tblsaleacct_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsaleacct]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblsubaccount]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tblsubaccount](
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[SUBNO] [varchar](30) NULL,
	[FILINGNO] [varchar](30) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[BLOCK] [varchar](20) NULL,
	[LOT] [varchar](20) NULL,
	[TRACT] [varchar](20) NULL,
	[SUBACCOUNTON0] [numeric](20, 6) NULL,
	[SUBACCOUNTON1] [numeric](20, 6) NULL,
	[SUBACCOUNTON2] [numeric](20, 6) NULL,
	[SUBACCOUNTOD0] [varchar](22) NULL,
	[SUBACCOUNTOD1] [varchar](22) NULL,
	[SUBACCOUNTOM0] [varchar](50) NULL,
	[SUBACCOUNTOM1] [varchar](50) NULL,
	[SUBACCOUNTOT0] [varchar](50) NULL,
	[SUBACCOUNTOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[PRIORSUBNO] [varchar](30) NULL,
	[PRIORFILINGNO] [varchar](30) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tblsubaccount_ClusteredIndex-accountno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE CLUSTERED INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tbnsaleinventory]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tbnsaleinventory](
	[RECEPTIONNO] [varchar](30) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[PARCELNO] [varchar](30) NULL,
	[INVENTORYEFFECTIVEDATE] [varchar](22) NULL,
	[SALEDATE] [varchar](22) NULL,
	[SALEPRICE] [numeric](15, 2) NULL,
	[ADJSALEPRICE] [numeric](15, 2) NULL,
	[SALEVALUEPER] [numeric](15, 2) NULL,
	[ACCTTYPE] [varchar](15) NULL,
	[ECONOMICAREACODE] [varchar](10) NULL,
	[LEA] [varchar](30) NULL,
	[SUBDIVISION] [varchar](30) NULL,
	[VALUEAREACODE] [varchar](10) NULL,
	[PROPERTYTYPE] [varchar](15) NULL,
	[IMPCONDITIONTYPE] [varchar](40) NULL,
	[IMPQUALITY] [varchar](15) NULL,
	[IMPABSTRACTCODE] [varchar](10) NULL,
	[BLTASDESCRIPTION] [varchar](50) NULL,
	[BLTASYEARBUILT] [numeric](4, 0) NULL,
	[PHYSICALAGE] [numeric](4, 0) NULL,
	[ADJUSTEDYEARBUILT] [numeric](4, 0) NULL,
	[EFFECTIVEAGE] [numeric](5, 0) NULL,
	[IMPEXTERIOR] [varchar](50) NULL,
	[CLASSCODE] [varchar](10) NULL,
	[IMPCOUNT] [numeric](15, 0) NULL,
	[BLTASTOTALUNITCOUNT] [numeric](15, 0) NULL,
	[ROOMCOUNT] [numeric](7, 0) NULL,
	[BEDROOMCOUNT] [numeric](7, 2) NULL,
	[BATHCOUNT] [numeric](7, 2) NULL,
	[FIXTURECOUNT] [numeric](15, 0) NULL,
	[TOTALIMPSF] [numeric](15, 2) NULL,
	[RESIDENTIALSF] [numeric](15, 2) NULL,
	[COMMERCIALSF] [numeric](15, 2) NULL,
	[CONDOIMPSF] [numeric](15, 0) NULL,
	[OUTBUILDINGSF] [numeric](15, 2) NULL,
	[IMPBLTASOTHER] [numeric](15, 0) NULL,
	[LANDNETSF] [numeric](20, 6) NULL,
	[MULTIPLEUSEFLAG] [numeric](1, 0) NULL,
	[LANDTYPE] [varchar](15) NULL,
	[LANDABSTRACTCODE] [varchar](10) NULL,
	[LANDCERTIFICATIONCODE] [varchar](10) NULL,
	[LANDGROSSACRECOUNT] [numeric](20, 6) NULL,
	[LANDGROSSSF] [numeric](20, 6) NULL,
	[LANDGROSSFF] [numeric](20, 6) NULL,
	[LANDGROSSUNITCOUNT] [numeric](20, 6) NULL,
	[ZONINGCODE] [varchar](50) NULL,
	[PLATTEDFLAG] [numeric](1, 0) NULL,
	[UNITNAME] [varchar](6) NULL,
	[ACCTADJSALEVALUEPER] [numeric](15, 2) NULL,
	[TOTALLANDVALUETIMEOFSALE] [numeric](15, 2) NULL,
	[TOTALACCTVALUETIMEOFSALE] [numeric](15, 2) NULL,
	[PRIORYEARTAXROLLACTUALAMT] [numeric](15, 2) NULL,
	[PRIORYEARTAXROLLASSESSED] [numeric](15, 2) NULL,
	[LANDNETACRECOUNT] [numeric](20, 6) NULL,
	[HVACTYPE] [varchar](30) NULL,
	[IMPUNITTYPE] [varchar](30) NULL,
	[IMPINTERIOR] [varchar](30) NULL,
	[ROOFCOVER] [varchar](30) NULL,
	[ROOFTYPE] [varchar](30) NULL,
	[INVENTORYOVERRIDEFLAG] [numeric](1, 0) NULL,
	[ZONEDAREA] [numeric](20, 6) NULL,
	[NBHDCODE1] [varchar](10) NULL,
	[NBHDCODE2] [varchar](10) NULL,
	[NBHDCODE3] [varchar](10) NULL,
	[NBHDCODE4] [varchar](10) NULL,
	[NBHDEXTENSION1] [varchar](10) NULL,
	[NBHDEXTENSION2] [varchar](10) NULL,
	[NBHDEXTENSION3] [varchar](10) NULL,
	[NBHDEXTENSION4] [varchar](10) NULL,
	[OCCCODE1] [numeric](15, 0) NULL,
	[OCCCODE2] [numeric](15, 0) NULL,
	[OCCCODE3] [numeric](15, 0) NULL,
	[ACCTADJSALEPRICE] [numeric](15, 2) NULL,
	[TIMEADJSALEPRICE] [numeric](15, 2) NULL,
	[DEEDCODE] [varchar](10) NULL,
	[VALID1FLAG] [numeric](1, 0) NULL,
	[VALID2FLAG] [numeric](1, 0) NULL,
	[EXCLUDECODE1] [varchar](10) NULL,
	[EXCLUDECODE2] [varchar](10) NULL,
	[IMPROVEDFLAG] [numeric](1, 0) NULL,
	[CONFIRMEDFLAG] [numeric](1, 0) NULL,
	[BUSINESSNAME] [varchar](255) NULL,
	[STREETNO] [varchar](15) NULL,
	[PREDIRECTION] [varchar](2) NULL,
	[STREETNAME] [varchar](50) NULL,
	[STREETTYPE] [varchar](4) NULL,
	[POSTDIRECTION] [varchar](2) NULL,
	[PROPERTYCITY] [varchar](50) NULL,
	[PROPERTYZIPCODE] [varchar](10) NULL,
	[OUTBUILDINGCOUNT] [numeric](15, 2) NULL,
	[LANDEXCESSSF] [numeric](20, 6) NULL,
	[APPROACHTYPE] [varchar](15) NULL,
	[FLOORCOVER] [varchar](30) NULL,
	[CONDOIMPPERCENT] [numeric](15, 6) NULL,
	[FINALSF] [numeric](20, 6) NULL,
	[FINALSFVALUEPER] [numeric](15, 2) NULL,
	[ZONEDAREAVALUEPER] [numeric](15, 2) NULL,
	[GROUPINVENTORYFLAG] [numeric](1, 0) NULL,
	[GRANTORNAME1] [varchar](80) NULL,
	[GRANTORNAME2] [varchar](60) NULL,
	[GRANTORADDRESS1] [varchar](50) NULL,
	[GRANTORADDRESS2] [varchar](50) NULL,
	[GRANTORCITY] [varchar](50) NULL,
	[GRANTORSTATECODE] [varchar](2) NULL,
	[GRANTORZIPCODE] [varchar](10) NULL,
	[SUBDIVISIONNAME] [varchar](255) NULL,
	[LOT] [varchar](20) NULL,
	[BLOCK] [varchar](20) NULL,
	[FILINGNO] [varchar](30) NULL,
	[TRACT] [varchar](20) NULL,
	[LEGALDESCRIPTION] [varchar](4000) NULL,
	[GRANTEENAME1] [varchar](80) NULL,
	[GRANTEENAME2] [varchar](60) NULL,
	[GRANTEEADDRESS1] [varchar](50) NULL,
	[GRANTEEADDRESS2] [varchar](50) NULL,
	[GRANTEECITY] [varchar](50) NULL,
	[GRANTEESTATECODE] [varchar](2) NULL,
	[GRANTEEZIPCODE] [varchar](10) NULL,
	[SALEINVENTORYON0] [numeric](20, 6) NULL,
	[SALEINVENTORYON1] [numeric](20, 6) NULL,
	[SALEINVENTORYON2] [numeric](20, 6) NULL,
	[OCCCODEDESCRIPTION1] [varchar](50) NULL,
	[OCCCODEDESCRIPTION2] [varchar](50) NULL,
	[OCCCODEDESCRIPTION3] [varchar](50) NULL,
	[SALEINVENTORYOD0] [varchar](22) NULL,
	[SALEINVENTORYOD1] [varchar](22) NULL,
	[SALEINVENTORYOM0] [varchar](50) NULL,
	[SALEINVENTORYOM1] [varchar](50) NULL,
	[SALEINVENTORYOT0] [varchar](50) NULL,
	[SALEINVENTORYOT1] [varchar](50) NULL,
	[LANDNETFF] [numeric](20, 6) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[OUTOFAREASALEJURISDICTION] [varchar](30) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[GRANTEEPROVINCE] [varchar](50) NULL,
	[GRANTEECOUNTRY] [varchar](100) NULL,
	[GRANTEEPOSTALCODE] [varchar](20) NULL,
	[OCCCOMPLETEDPCT] [numeric](15, 4) NULL,
	[PRIMARYUSECODE] [varchar](10) NULL,
	[GRANTORPROVINCE] [varchar](50) NULL,
	[GRANTORCOUNTRY] [varchar](100) NULL,
	[GRANTORPOSTALCODE] [varchar](20) NULL,
	[LANDNETUNITCOUNT] [numeric](20, 6) NULL,
	[TOTALFINISHEDSF] [numeric](15, 2) NULL,
	[TOTALUNFINISHEDSF] [numeric](15, 2) NULL,
	[BLTASCODE] [numeric](15, 0) NULL,
	[SALERATIO] [numeric](7, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tbnsaleinventorydetail]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tbnsaleinventorydetail](
	[RECEPTIONNO] [varchar](30) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[DETAILTYPE] [varchar](50) NULL,
	[INVENTORYDETAILTYPE] [varchar](100) NULL,
	[INVENTORYDETAILDESCRIPTION] [varchar](100) NULL,
	[INVENTORYUNITCOUNT] [numeric](15, 4) NULL,
	[SALEINVENTORYDETAILON0] [numeric](20, 6) NULL,
	[SALEINVENTORYDETAILON1] [numeric](20, 6) NULL,
	[SALEINVENTORYDETAILON2] [numeric](20, 6) NULL,
	[SALEINVENTORYDETAILOD0] [varchar](22) NULL,
	[SALEINVENTORYDETAILOD1] [varchar](22) NULL,
	[SALEINVENTORYDETAILOM0] [varchar](50) NULL,
	[SALEINVENTORYDETAILOM1] [varchar](50) NULL,
	[SALEINVENTORYDETAILOT0] [varchar](50) NULL,
	[SALEINVENTORYDETAILOT1] [varchar](50) NULL,
	[YEARBUILT] [numeric](4, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[INVENTORYDETAILID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tbnsubdivision]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tbnsubdivision](
	[SUBNO] [varchar](30) NULL,
	[SUBNAME] [varchar](255) NULL,
	[SUBDATECREATED] [varchar](22) NULL,
	[SUBON2] [numeric](20, 6) NULL,
	[SUBOT0] [varchar](50) NULL,
	[SUBOT1] [varchar](50) NULL,
	[SUBOD0] [varchar](22) NULL,
	[SUBOD1] [varchar](22) NULL,
	[SUBOM0] [varchar](50) NULL,
	[SUBOM1] [varchar](50) NULL,
	[SUBON0] [numeric](20, 6) NULL,
	[SUBON1] [numeric](20, 6) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tbnsubfiling]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tbnsubfiling](
	[SUBNO] [varchar](30) NULL,
	[FILINGNO] [varchar](30) NULL,
	[SUBFILINGDESCRIPTION] [varchar](50) NULL,
	[SUBFILINGRECORDINGNO] [varchar](20) NULL,
	[SUBFILINGCITY] [varchar](50) NULL,
	[DEFAULTSECTION] [varchar](15) NULL,
	[DEFAULTTOWNSHIP] [varchar](15) NULL,
	[DEFAULTRANGE] [varchar](15) NULL,
	[DEFAULTQTR] [varchar](15) NULL,
	[DEFAULTQTRQTR] [varchar](15) NULL,
	[SUBFILINGDATERECORDED] [varchar](22) NULL,
	[DEFAULTLEA] [varchar](30) NULL,
	[DEFAULTTAXDISTRICT] [varchar](10) NULL,
	[MAPNO] [varchar](40) NULL,
	[ECONOMICAREACODE] [varchar](10) NULL,
	[ACCOUNTTYPE] [varchar](15) NULL,
	[LANDCERTIFICATIONCODE] [varchar](10) NULL,
	[FLAGTYPE] [varchar](12) NULL,
	[SUBFILINGSTATUS] [varchar](15) NULL,
	[DEFAULTAPPROACHTYPE] [varchar](15) NULL,
	[VALUEAREACODE] [varchar](10) NULL,
	[ZONINGCODE] [varchar](50) NULL,
	[BLOCKCOUNT] [numeric](15, 0) NULL,
	[LOTCOUNT] [numeric](15, 0) NULL,
	[TRACTCOUNT] [numeric](15, 0) NULL,
	[SUBFILINGMHTITLEFLAG] [numeric](1, 0) NULL,
	[SUBFILINGNOTESFLAG] [numeric](1, 0) NULL,
	[SUBFILINGNEWCONSTFLAG] [numeric](1, 0) NULL,
	[SUBFILINGPHOTOSFLAG] [numeric](1, 0) NULL,
	[SUBFILINGSKETCHESFLAG] [numeric](1, 0) NULL,
	[SUBFILINGTAXYEAR] [numeric](4, 0) NULL,
	[SUBFILINGON0] [numeric](20, 6) NULL,
	[SUBFILINGON1] [numeric](20, 6) NULL,
	[SUBFILINGON2] [numeric](20, 6) NULL,
	[ASSIGNEDTO] [varchar](20) NULL,
	[SUBFILINGOD0] [varchar](22) NULL,
	[SUBFILINGOD1] [varchar](22) NULL,
	[SUBFILINGOM0] [varchar](50) NULL,
	[SUBFILINGOM1] [varchar](50) NULL,
	[SUBFILINGOT0] [varchar](50) NULL,
	[SUBFILINGOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[DEFAULTLEGAL] [varchar](4000) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[PRIMARYUSECODE] [varchar](10) NULL,
	[APPRAISALTYPE] [varchar](30) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpabstractcode]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpabstractcode](
	[ABSTRACTCODE] [varchar](10) NULL,
	[ABSTRACTDESCRIPTION] [varchar](500) NULL,
	[EQUIVALENCEABSTRACTCODE] [varchar](10) NULL,
	[ROLLABSTRACTVALUEFLAG] [numeric](1, 0) NULL,
	[VALUEGROUPCODE] [numeric](15, 0) NULL,
	[ACTUALPRECISION] [numeric](11, 0) NULL,
	[ACTUALMINIMUMVALUE] [numeric](11, 0) NULL,
	[ASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ASSESSEDMINIMUMVALUE] [numeric](11, 0) NULL,
	[ACTUALROUNDTYPE] [varchar](10) NULL,
	[ASSESSEDROUNDTYPE] [varchar](10) NULL,
	[USEVALUEFLAG] [numeric](1, 0) NULL,
	[ADJACTUALPRECISION] [numeric](11, 0) NULL,
	[ADJACTUALMINIMUMVALUE] [numeric](11, 0) NULL,
	[ADJACTUALROUNDTYPE] [varchar](10) NULL,
	[ADJASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ADJASSESSEDMINIMUMVALUE] [numeric](11, 0) NULL,
	[ADJASSESSEDROUNDTYPE] [varchar](10) NULL,
	[ADJALTACTUALPRECISION] [numeric](11, 0) NULL,
	[ADJALTACTUALMINVALUE] [numeric](11, 0) NULL,
	[ADJALTACTUALROUNDTYPE] [varchar](10) NULL,
	[ADJALTASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ADJALTASSESSEDMINVALUE] [numeric](11, 0) NULL,
	[ADJALTASSESSEDDROUNDTYPE] [varchar](10) NULL,
	[ALTASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ALTASSESSEDMINIMUMVALUE] [numeric](11, 0) NULL,
	[ALTASSESSEDROUNDTYPE] [varchar](10) NULL,
	[SHOWADMINFLAG] [numeric](1, 0) NULL,
	[CLASSIFICATIONID] [varchar](2) NULL,
	[LOCALGROWTHEXEMPTFLAG] [numeric](1, 0) NULL,
	[EXPORTCNTGROUPEXCLUSIONFLAG] [numeric](1, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[LIMITTOABSTTYPE] [varchar](1) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[ABSTRACTCATEGORYCODE] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpaccttype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpaccttype](
	[ACCTTYPE] [varchar](15) NULL,
	[APPRAISALTYPE] [varchar](30) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[MHLPFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[MASSINCLUDEFLAG] [numeric](1, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpdeedtype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpdeedtype](
	[DEEDCODE] [varchar](10) NULL,
	[DEEDDESCRIPTION] [varchar](40) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[EFFECTEXEMPTIONSFLAG] [numeric](1, 0) NULL,
	[EFFECTCAPFLAG] [numeric](1, 0) NULL,
	[INCLUDEINSALESRATIOSFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[NONSALEFLAG] [numeric](1, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpimpsaddons]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpimpsaddons](
	[ADDONDESCRIPTION] [varchar](50) NULL,
	[ADDONVALUE] [numeric](15, 2) NULL,
	[ADDONFILTERTYPE] [varchar](50) NULL,
	[DEPRTYPE] [varchar](20) NULL,
	[OVERRIDELIFEEXPECTANCY] [numeric](3, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[USEINANALYSISFLAG] [numeric](1, 0) NULL,
	[IMPDETAILTYPE] [varchar](30) NULL,
	[ADDONCODE] [numeric](15, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[APEXLINKFLAG] [numeric](1, 0) NULL,
	[TAXYEAR] [numeric](4, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpimpsbltastype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpimpsbltastype](
	[BLTASCODE] [numeric](15, 0) NULL,
	[BLTASDESCRIPTION] [varchar](50) NULL,
	[MSCOSTTABLE] [varchar](50) NULL,
	[PROPERTYTYPE] [varchar](15) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[BLTASTOTALTYPE] [varchar](15) NULL,
	[MARSHALLSWIFTCODE] [numeric](15, 0) NULL,
	[BLTASCALCULATIONTYPE] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpimpscomclasstype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpimpscomclasstype](
	[CLASSCODE] [varchar](10) NULL,
	[CLASSDESCRIPTION] [varchar](40) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpimpsocctype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpimpsocctype](
	[OCCCODE] [numeric](15, 0) NULL,
	[OCCCODEDESCRIPTION] [varchar](50) NULL,
	[ABSTRACTCODE] [varchar](10) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkplandattributetype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkplandattributetype](
	[ATTRIBUTETYPE] [varchar](30) NULL,
	[ATTRIBUTESUBTYPE] [varchar](50) NULL,
	[ATTRIBUTEADJUSTMENT] [numeric](15, 6) NULL,
	[FILTERTYPE] [varchar](15) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[USEINANALYSISFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[EXECUTIONORDER] [numeric](9, 0) NULL,
	[ADJUSTMENTCALCULATIONTYPE] [varchar](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpleatype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpleatype](
	[LEA] [varchar](30) NULL,
	[LEADESCRIPTION] [varchar](50) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpsaleexclude]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpsaleexclude](
	[EXCLUDECODE] [varchar](10) NULL,
	[EXCLUDEDESCRIPTION] [varchar](40) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpstatusacct]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpstatusacct](
	[ACCTSTATUSCODE] [varchar](1) NULL,
	[ACCTSTATUSDESCRIPTION] [varchar](15) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkptaxauthority]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkptaxauthority](
	[TAXAUTHORITY] [varchar](10) NULL,
	[STATEAUTHORITYCODE] [varchar](10) NULL,
	[AUTHORITYTYPE] [varchar](60) NULL,
	[AUTHORITYNAME] [varchar](50) NULL,
	[CREATIONDATE] [varchar](22) NULL,
	[CONTACTPERSON] [varchar](50) NULL,
	[CONTACTADDRESS1] [varchar](40) NULL,
	[CONTACTADDRESS2] [varchar](40) NULL,
	[CONTACTCITY] [varchar](40) NULL,
	[CONTACTSTATE] [varchar](2) NULL,
	[CONTACTZIPCODE] [varchar](10) NULL,
	[AFFILIATE] [varchar](10) NULL,
	[AUTHORITYSIZE] [varchar](10) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[CONTACTPHONE] [varchar](18) NULL,
	[AUTHORITYVALUETYPE] [varchar](15) NULL,
	[ISURBANRENEWALAUTHORIZERFLAG] [numeric](1, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkptaxauthoritydetail]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkptaxauthoritydetail](
	[TAXAUTHORITY] [varchar](10) NULL,
	[TAXYEAR] [numeric](4, 0) NULL,
	[NETASSESSED] [numeric](15, 2) NULL,
	[GROSSASSESSED] [numeric](15, 2) NULL,
	[TIFDISTRICTINCREMENT] [numeric](15, 2) NULL,
	[NEWCONSTRUCTION] [numeric](15, 2) NULL,
	[PRODUCINGMINEINCREMENT] [numeric](15, 2) NULL,
	[ANNEXINCLUSIONS] [numeric](15, 2) NULL,
	[PREVIOUSEXEMPTFEDERAL] [numeric](15, 2) NULL,
	[NEWPRIMARYOIL] [numeric](15, 2) NULL,
	[TAXOMITTEDPROPERTY] [numeric](15, 2) NULL,
	[TAXESABATEDREFUNDED] [numeric](15, 2) NULL,
	[REALACTUALVALUE] [numeric](15, 2) NULL,
	[REALNEWCONSTACTUALVALUE] [numeric](15, 2) NULL,
	[NEWANNEXACTUALVALUE] [numeric](15, 2) NULL,
	[PRODUCINGMINEACTUALVALUE] [numeric](15, 2) NULL,
	[PREVIOUSEXEMPTACTUALVALUE] [numeric](15, 2) NULL,
	[NEWWELLPRODUCINGACTUALVALUE] [numeric](15, 2) NULL,
	[REALOMITTEDACTUALVALUE] [numeric](15, 2) NULL,
	[REALDESTROYEDACTUALVALUE] [numeric](15, 2) NULL,
	[DISCONNECTEXCLACTUALVALUE] [numeric](15, 2) NULL,
	[PREVIOUSTAXACTUALVALUE] [numeric](15, 2) NULL,
	[GROSSACTUALVALUE] [numeric](15, 2) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[MAXASSESSEDMILLLEVY] [numeric](15, 2) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkptaxdistrict]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkptaxdistrict](
	[TAXDISTRICT] [varchar](10) NULL,
	[TAXDISTRICTNAME] [varchar](30) NULL,
	[TAXAREA] [varchar](50) NULL,
	[CREATIONDATE] [varchar](22) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[TAXDISTRICTCATEGORY] [varchar](10) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[TAXDISTRICTTYPE] [numeric](5, 0) NULL,
	[TAXDISTRICTID] [numeric](15, 0) NULL,
	[ASSOCIATEDURBANRENEWALPLAN] [varchar](10) NULL,
	[REPORTINGTAXDISTRICT] [varchar](10) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkptaxfund]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkptaxfund](
	[FUNDCODE] [varchar](20) NULL,
	[FUNDDESCRIPTION] [varchar](100) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tlkpzoning]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tlkpzoning](
	[ZONINGCODE] [varchar](50) NULL,
	[ZONINGDESCRIPTION] [varchar](40) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [datetime2](0) NULL,
	[ZONINGFACTOR] [numeric](15, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tmaptaxauthoritydetailfund]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tmaptaxauthoritydetailfund](
	[TAXAUTHORITY] [varchar](10) NULL,
	[TAXYEAR] [numeric](4, 0) NULL,
	[FUNDCODE] [varchar](20) NULL,
	[PARENTFUNDCODE] [varchar](20) NULL,
	[ASSESSEDMILLLEVY] [numeric](11, 6) NULL,
	[ALTERNATEMILLLEVY] [numeric](11, 6) NULL,
	[REALFLAG] [numeric](1, 0) NULL,
	[PPFLAG] [numeric](1, 0) NULL,
	[MAXLEVYINCLUDEFLAG] [numeric](1, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[LEVYTYPEID] [numeric](4, 0) NULL,
	[TAXDISTRICTID] [numeric](15, 0) NULL,
	[EXCLUDEREDUCEDRATEFLAG] [numeric](1, 0) NULL,
	[INCLUDEONTAXBILLFLAG] [numeric](1, 0) NULL,
	[PERMANENTRATE] [numeric](11, 6) NULL,
	[BILLINGRATE] [numeric](11, 6) NULL,
	[URDOTADJUSTMENTRATE] [numeric](11, 6) NULL,
	[BUDGETEDTAXVALUE] [numeric](15, 2) NULL,
	[BUDGETEDTAXRATE] [numeric](11, 6) NULL,
	[TRUNCATIONLOSSVALUE] [numeric](15, 2) NULL,
	[FUNDCATEGORYTYPEID] [numeric](3, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tmaptaxdistrictauthority]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tmaptaxdistrictauthority](
	[TAXDISTRICT] [varchar](10) NULL,
	[TAXAUTHORITY] [varchar](10) NULL,
	[TAXYEAR] [numeric](4, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[TIFAUTHORITY] [varchar](10) NULL,
	[TIFPERCENTAGE] [numeric](8, 7) NULL,
	[EXCESSVALUE] [numeric](15, 2) NULL,
	[EXCESSVALUENOTUSED] [numeric](15, 2) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tsgnvalue]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tsgnvalue](
	[ACCOUNTNO] [varchar](30) NULL,
	[TAXYEAR] [numeric](4, 0) NULL,
	[VALUEGROUPCODE] [numeric](15, 0) NULL,
	[TAXDISTRICT] [varchar](10) NULL,
	[PARCELNO] [varchar](30) NULL,
	[TAXDOLLARS] [numeric](15, 2) NULL,
	[ALTERNATETAXDOLLARS] [numeric](15, 2) NULL,
	[ADJUSTEDTAXDOLLARS] [numeric](15, 2) NULL,
	[ADJALTERNATETAXDOLLARS] [numeric](15, 2) NULL,
	[TOTALTAXDOLLARS] [numeric](15, 2) NULL,
	[ADJTOTALTAXDOLLARS] [numeric](15, 2) NULL,
	[ACTUALVALUE] [numeric](15, 2) NULL,
	[ADJACTUALVALUE] [numeric](15, 2) NULL,
	[ALTERNATEADJACTUALVALUE] [numeric](15, 2) NULL,
	[ADJALTERNATEADJACTUALVALUE] [numeric](15, 2) NULL,
	[ASSESSEDVALUE] [numeric](15, 2) NULL,
	[ALTERNATEASSESSEDVALUE] [numeric](15, 2) NULL,
	[ADJASSESSEDVALUE] [numeric](15, 2) NULL,
	[ADJALTERNATEASSESSEDVALUE] [numeric](15, 2) NULL,
	[MILLLEVY] [numeric](11, 6) NULL,
	[ALTERNATEMILLLEVY] [numeric](11, 6) NULL,
	[AVERAGEASSESSMENTRATIO] [numeric](15, 6) NULL,
	[AVERAGEALTASSESSMENTRATIO] [numeric](15, 6) NULL,
	[ACTUALPENALTYVALUE] [numeric](15, 2) NULL,
	[ALTERNATEACTUALPENALTYVALUE] [numeric](15, 2) NULL,
	[ASSESSEDPENALTYVALUE] [numeric](15, 2) NULL,
	[ALTERNATEASSDPENALTYVALUE] [numeric](15, 2) NULL,
	[PENALTYTAXDOLLARS] [numeric](15, 2) NULL,
	[ALTERNATEPENALTYTAXDOLLARS] [numeric](15, 2) NULL,
	[RAWASSESSEDVALUE] [numeric](15, 2) NULL,
	[RAWTAXDOLLARS] [numeric](15, 2) NULL,
	[TOTALPENALTYTAXDOLLARS] [numeric](15, 2) NULL,
	[IMPCURRENTUSE] [numeric](15, 4) NULL,
	[LANDMKTUSE] [numeric](15, 4) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [datetime2](0) NULL,
	[FINALADJASSESSEDVALUE] [numeric](15, 2) NULL,
	[FINALADJALTASSESSEDVALUE] [numeric](15, 2) NULL,
	[FINALADJASSDPENALTYVALUE] [numeric](15, 2) NULL,
	[FINALADJALTASSDPENALTYVALUE] [numeric](15, 2) NULL,
	[CCIAPPLICATIONID] [numeric](15, 0) NULL,
	[CAPOVERMARKETVALUE] [numeric](15, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tsylevytype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_tsylevytype](
	[LEVYTYPEID] [numeric](4, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LEVYTYPE] [varchar](50) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[assessor_unit_test_result]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[assessor_unit_test_result](
	[table_name] [nvarchar](100) NULL,
	[table_count] [int] NULL,
	[error_table_count] [int] NULL,
	[unit_test_result] [nvarchar](50) NULL,
	[run_date] [datetime] NULL,
	[notes] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblacct_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblacct_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[PARCELNO] [varchar](30) NULL,
	[LOCALNO] [varchar](30) NULL,
	[MAPNO] [varchar](40) NULL,
	[ACCTSTATUSCODE] [varchar](1) NULL,
	[ACCTTYPE] [varchar](15) NULL,
	[ASSIGNEDTO] [varchar](20) NULL,
	[VALUEAREACODE] [varchar](10) NULL,
	[ASSOCIATEDACCT] [varchar](30) NULL,
	[APPRAISALTYPE] [varchar](30) NULL,
	[ECONOMICAREACODE] [varchar](10) NULL,
	[ACCTDATECREATED] [varchar](22) NULL,
	[DEFAULTAPPROACHTYPE] [varchar](15) NULL,
	[DEFAULTTAXDISTRICT] [varchar](10) NULL,
	[BUSINESSLICENSE] [varchar](10) NULL,
	[MAPGROUP] [varchar](2) NULL,
	[CONTROLMAP] [varchar](5) NULL,
	[PROPERTYIDENTIFIER] [varchar](1) NULL,
	[SPECIALINTERESTNUMBER] [varchar](3) NULL,
	[ACCTON0] [numeric](20, 6) NULL,
	[ACCTON1] [numeric](20, 6) NULL,
	[ACCTON2] [numeric](20, 6) NULL,
	[PRIMARYUSECODE] [varchar](10) NULL,
	[WARD] [varchar](2) NULL,
	[ACCTOD0] [varchar](22) NULL,
	[ACCTOD1] [varchar](22) NULL,
	[ACCTOM0] [varchar](50) NULL,
	[ACCTOM1] [varchar](50) NULL,
	[STRIPPEDACCOUNTNO] [varchar](30) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[ACCTOT0] [varchar](50) NULL,
	[ACCTOT1] [varchar](50) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[CENSUSTRACT] [numeric](6, 2) NULL,
	[CENSUSBLOCK] [numeric](6, 2) NULL,
	[MOBILEHOMESPACE] [varchar](10) NULL,
	[EFILEFLAG] [numeric](1, 0) NULL,
	[BUSINESSNAME] [varchar](255) NULL,
	[COSTHYBRIDPERCENT] [numeric](15, 4) NULL,
	[MARKETHYBRIDPERCENT] [numeric](15, 4) NULL,
	[INCOMEHYBRIDPERCENT] [numeric](15, 4) NULL,
	[RECONCILEDHYBRIDPERCENT] [numeric](15, 4) NULL,
	[PARCELSEQUENCE] [numeric](4, 0) NULL,
	[PROPERTYCLASSID] [numeric](15, 0) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[DETAILEDREVIEWDATE] [varchar](22) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblacctnbhd_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblacctnbhd_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[NBHDCODE] [varchar](10) NULL,
	[NBHDEXTENSION] [varchar](10) NULL,
	[PROPERTYTYPE] [varchar](15) NULL,
	[NBHDADJUSTMENTVALUE] [numeric](15, 4) NULL,
	[ACCTNBHDON0] [numeric](20, 6) NULL,
	[ACCTNBHDON1] [numeric](20, 6) NULL,
	[ACCTNBHDON2] [numeric](20, 6) NULL,
	[ACCTNBHDOD0] [varchar](22) NULL,
	[ACCTNBHDOD1] [varchar](22) NULL,
	[ACCTNBHDOM0] [varchar](50) NULL,
	[ACCTNBHDOM1] [varchar](50) NULL,
	[ACCTNBHDOT0] [varchar](50) NULL,
	[ACCTNBHDOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblacctowneraddress_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblacctowneraddress_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[PERSONCODE] [numeric](15, 0) NULL,
	[ADDRESSCODE] [numeric](15, 0) NULL,
	[PRIMARYOWNERFLAG] [numeric](1, 0) NULL,
	[ACCTOWNERADDRESSON0] [numeric](20, 6) NULL,
	[ACCTOWNERADDRESSON1] [numeric](20, 6) NULL,
	[ACCTOWNERADDRESSON2] [numeric](20, 6) NULL,
	[ACCTOWNERADDRESSOD0] [varchar](22) NULL,
	[ACCTOWNERADDRESSOD1] [varchar](22) NULL,
	[ACCTOWNERADDRESSOM0] [varchar](50) NULL,
	[ACCTOWNERADDRESSOM1] [varchar](50) NULL,
	[ACCTOWNERADDRESSOT0] [varchar](50) NULL,
	[ACCTOWNERADDRESSOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[OWNERPERCENT] [numeric](9, 8) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[OWNERSHIPTYPE] [varchar](50) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblacctpropertyaddress_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblacctpropertyaddress_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[BUILDINGID] [varchar](10) NULL,
	[PREDIRECTION] [varchar](2) NULL,
	[STREETNO] [varchar](15) NULL,
	[UNITNAME] [varchar](6) NULL,
	[POSTDIRECTION] [varchar](2) NULL,
	[STREETTYPE] [varchar](4) NULL,
	[STREETNAME] [varchar](50) NULL,
	[PROPERTYZIPCODE] [varchar](10) NULL,
	[PROPERTYCITY] [varchar](50) NULL,
	[ORDERNO] [numeric](5, 0) NULL,
	[ACCTPROPERTYADDRESSON0] [numeric](20, 6) NULL,
	[ACCTPROPERTYADDRESSON1] [numeric](20, 6) NULL,
	[ACCTPROPERTYADDRESSON2] [numeric](20, 6) NULL,
	[BUSINESSNAME] [varchar](255) NULL,
	[ACCTPROPERTYADDRESSOD0] [varchar](22) NULL,
	[ACCTPROPERTYADDRESSOD1] [varchar](22) NULL,
	[ACCTPROPERTYADDRESSOM0] [varchar](50) NULL,
	[ACCTPROPERTYADDRESSOM1] [varchar](50) NULL,
	[ACCTPROPERTYADDRESSOT0] [varchar](50) NULL,
	[ACCTPROPERTYADDRESSOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[PROPERTYADDRESSCODE] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[LOCATIONID] [numeric](15, 0) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblacctreal_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblacctreal_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPONLYFLAG] [numeric](1, 0) NULL,
	[TIFFLAG] [numeric](1, 0) NULL,
	[VACANTFLAG] [numeric](1, 0) NULL,
	[LANDWIDTH] [numeric](11, 0) NULL,
	[LANDDEPTH] [numeric](11, 0) NULL,
	[LANDEASEMENTSF] [numeric](20, 6) NULL,
	[LANDEXCESSSF] [numeric](20, 6) NULL,
	[TRAFFICCOUNT] [numeric](15, 0) NULL,
	[PARKINGSPACES] [numeric](15, 0) NULL,
	[ZONINGCODE] [varchar](50) NULL,
	[FLOODFRINGE] [numeric](11, 0) NULL,
	[FLOODWAY] [numeric](11, 0) NULL,
	[TAPFEE] [numeric](15, 2) NULL,
	[PLATTEDFLAG] [numeric](1, 0) NULL,
	[LANDCERTIFICATIONCODE] [varchar](10) NULL,
	[LANDAPPRAISER] [varchar](20) NULL,
	[LANDAPPRAISALDATE] [varchar](22) NULL,
	[LANDOVERRIDESIZEADJ] [numeric](20, 6) NULL,
	[LANDSIZEADJ] [numeric](20, 6) NULL,
	[LANDGROSSSF] [numeric](20, 6) NULL,
	[LANDGROSSACRES] [numeric](20, 6) NULL,
	[LANDGROSSFF] [numeric](20, 6) NULL,
	[LANDGROSSUNITCOUNT] [numeric](20, 6) NULL,
	[ACCTREALON0] [numeric](20, 6) NULL,
	[ACCTREALON1] [numeric](20, 6) NULL,
	[ACCTREALON2] [numeric](20, 6) NULL,
	[ACCTREALOD0] [varchar](22) NULL,
	[ACCTREALOD1] [varchar](22) NULL,
	[ACCTREALOM0] [varchar](50) NULL,
	[ACCTREALOM1] [varchar](50) NULL,
	[ACCTREALOT0] [varchar](50) NULL,
	[ACCTREALOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[DEFAULTLEA] [varchar](30) NULL,
	[TOTALACCTIMPINTERESTPCT] [numeric](9, 6) NULL,
	[TOTALACCTLANDINTERESTPCT] [numeric](9, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tbladdresssecure_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tbladdresssecure_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ADDRESSCODE] [numeric](15, 0) NULL,
	[ADDRESS1] [varchar](50) NULL,
	[ADDRESS2] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATECODE] [varchar](2) NULL,
	[ZIPCODE] [varchar](10) NULL,
	[PERSONCODE] [numeric](15, 0) NULL,
	[PROVINCE] [varchar](50) NULL,
	[ADDRESSON0] [numeric](20, 6) NULL,
	[ADDRESSON1] [numeric](20, 6) NULL,
	[ADDRESSON2] [numeric](20, 6) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[COUNTRY] [varchar](100) NULL,
	[POSTALCODE] [varchar](20) NULL,
	[ADDRESSOD0] [varchar](22) NULL,
	[ADDRESSOD1] [varchar](22) NULL,
	[ADDRESSOM0] [varchar](50) NULL,
	[ADDRESSOM1] [varchar](50) NULL,
	[ADDRESSOT0] [varchar](50) NULL,
	[ADDRESSOT1] [varchar](50) NULL,
	[ADDRESSVALIDFLAG] [numeric](1, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblimps_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblimps_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[IMPDESCRIPTION] [varchar](100) NULL,
	[COSTVALUEBY] [varchar](10) NULL,
	[MARKETVALUEBY] [varchar](10) NULL,
	[INCOMEVALUEBY] [varchar](10) NULL,
	[LANDATTRIBUTEDPCT] [numeric](15, 4) NULL,
	[IMPCOMPLETEDPCT] [numeric](15, 4) NULL,
	[IMPQUALITY] [varchar](15) NULL,
	[IMPUNITTYPE] [varchar](30) NULL,
	[IMPDESIGNADJPCT] [numeric](15, 4) NULL,
	[IMPEXTERIORADJPCT] [numeric](15, 4) NULL,
	[IMPPHYSICALDEPRPCT] [numeric](15, 4) NULL,
	[FUNCTIONALOBSOLESCEPCT] [numeric](15, 4) NULL,
	[ECONOMICOBSOLESCEPCT] [numeric](15, 4) NULL,
	[IMPOTHERADJPCT] [numeric](15, 4) NULL,
	[MHTITLENO] [varchar](30) NULL,
	[MHSERIALNO] [varchar](30) NULL,
	[MHTOTALLENGTH] [numeric](15, 0) NULL,
	[MHDECALNO] [varchar](30) NULL,
	[MHTAGNO] [varchar](30) NULL,
	[APPRAISER] [varchar](20) NULL,
	[APPRAISALDATE] [varchar](22) NULL,
	[OWNEROCCUPIEDFLAG] [numeric](1, 0) NULL,
	[COSTMETHOD] [varchar](30) NULL,
	[MARKETMETHOD] [varchar](30) NULL,
	[INCOMEMETHOD] [varchar](30) NULL,
	[IMPCONDITIONTYPE] [varchar](40) NULL,
	[CONDOLANDPERCENT] [numeric](15, 6) NULL,
	[IMPSF] [numeric](15, 0) NULL,
	[CONDOIMPPERCENT] [numeric](15, 6) NULL,
	[IMPPERIMETER] [numeric](15, 0) NULL,
	[IMPINTERIORADJPCT] [numeric](15, 4) NULL,
	[CONDOIMPSF] [numeric](15, 0) NULL,
	[IMPAMATEURADJPCT] [numeric](15, 4) NULL,
	[IMPNETSF] [numeric](15, 0) NULL,
	[PROPERTYTYPE] [varchar](15) NULL,
	[APPROACHTYPE] [varchar](15) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[IMPSOT0] [varchar](50) NULL,
	[IMPSOT1] [varchar](50) NULL,
	[IMPSOM0] [varchar](50) NULL,
	[IMPSOM1] [varchar](50) NULL,
	[IMPSOD0] [varchar](22) NULL,
	[IMPSOD1] [varchar](22) NULL,
	[IMPSON0] [numeric](20, 6) NULL,
	[IMPSON1] [numeric](20, 6) NULL,
	[IMPSON2] [numeric](20, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblimpsbltas_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblimpsbltas_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[DETAILID] [numeric](15, 0) NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[BLTASCODE] [numeric](15, 0) NULL,
	[IMPEXTERIOR] [varchar](50) NULL,
	[IMPINTERIOR] [varchar](30) NULL,
	[BLTASSTORIES] [numeric](15, 2) NULL,
	[BLTASSTORYHEIGHT] [numeric](15, 0) NULL,
	[ROOFTYPE] [varchar](30) NULL,
	[ROOFCOVER] [varchar](30) NULL,
	[FLOORCOVER] [varchar](30) NULL,
	[ROOMCOUNT] [numeric](7, 0) NULL,
	[BEDROOMCOUNT] [numeric](7, 2) NULL,
	[BLTASTOTALUNITCOUNT] [numeric](15, 0) NULL,
	[IMPBLTASOTHER] [numeric](15, 0) NULL,
	[CLASSCODE] [varchar](10) NULL,
	[BLTASHEIGHT] [numeric](15, 0) NULL,
	[BLTASYEARBUILT] [numeric](4, 0) NULL,
	[YEARREMODELED] [numeric](4, 0) NULL,
	[REMODELEDPERCENT] [numeric](15, 4) NULL,
	[EFFECTIVEAGE] [numeric](5, 0) NULL,
	[BLTASLENGTH] [numeric](15, 0) NULL,
	[BLTASWIDTH] [numeric](15, 0) NULL,
	[MHTAGLENGTH] [numeric](15, 0) NULL,
	[MHTAGWIDTH] [numeric](15, 0) NULL,
	[BLTASSF] [numeric](15, 0) NULL,
	[SPRINKLERSF] [numeric](15, 0) NULL,
	[BATHCOUNT] [numeric](7, 2) NULL,
	[PRIMARYBLTASORDERNO] [numeric](5, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[HVACTYPE] [varchar](30) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[APEXID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblimpsdetail_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblimpsdetail_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[DETAILID] [numeric](15, 0) NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[IMPDETAILTYPE] [varchar](30) NULL,
	[IMPDETAILDESCRIPTION] [varchar](50) NULL,
	[DETAILUNITCOUNT] [numeric](15, 4) NULL,
	[DETAILYEARBUILT] [numeric](4, 0) NULL,
	[ADDONCODE] [numeric](15, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[APEXLINKFLAG] [numeric](1, 0) NULL,
	[IMPSDETAILOT0] [varchar](50) NULL,
	[IMPSDETAILOT1] [varchar](50) NULL,
	[IMPSDETAILOM0] [varchar](50) NULL,
	[IMPSDETAILOM1] [varchar](50) NULL,
	[IMPSDETAILOD0] [varchar](22) NULL,
	[IMPSDETAILOD1] [varchar](22) NULL,
	[IMPSDETAILON0] [numeric](20, 6) NULL,
	[IMPSDETAILON1] [numeric](20, 6) NULL,
	[IMPSDETAILON2] [numeric](20, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[IMPDETAILTYPEID] [numeric](5, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblimpsocc_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblimpsocc_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[DETAILID] [numeric](15, 0) NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[IMPNO] [numeric](7, 2) NULL,
	[OCCCODE] [numeric](15, 0) NULL,
	[OCCPERCENT] [numeric](15, 4) NULL,
	[ABSTRACTCODE] [varchar](10) NULL,
	[IMPABSTRACTVALUE] [numeric](15, 2) NULL,
	[ABSTRACTINDATE] [varchar](22) NULL,
	[ABSTRACTOUTDATE] [varchar](22) NULL,
	[ABSTRACTADJCODE] [varchar](5) NULL,
	[PRORATETYPE] [varchar](10) NULL,
	[TAXDISTRICT] [varchar](10) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[IMPSOCCOT0] [varchar](50) NULL,
	[IMPSOCCOT1] [varchar](50) NULL,
	[IMPSOCCOM0] [varchar](50) NULL,
	[IMPSOCCOM1] [varchar](50) NULL,
	[IMPSOCCOD0] [varchar](22) NULL,
	[IMPSOCCOD1] [varchar](22) NULL,
	[IMPSOCCON0] [numeric](20, 6) NULL,
	[IMPSOCCON1] [numeric](20, 6) NULL,
	[IMPSOCCON2] [numeric](20, 6) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[OCCCOMPLETEDPCT] [numeric](15, 4) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tbllandattribute_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tbllandattribute_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[DETAILID] [numeric](15, 0) NULL,
	[ATTRIBUTETYPE] [varchar](30) NULL,
	[ATTRIBUTESUBTYPE] [varchar](50) NULL,
	[ATTRIBUTEADJUSTMENT] [numeric](15, 6) NULL,
	[FILTERTYPE] [varchar](15) NULL,
	[LANDATTRIBUTEOT0] [varchar](50) NULL,
	[LANDATTRIBUTEOT1] [varchar](50) NULL,
	[LANDATTRIBUTEON0] [numeric](20, 6) NULL,
	[LANDATTRIBUTEON1] [numeric](20, 6) NULL,
	[LANDATTRIBUTEON2] [numeric](20, 6) NULL,
	[LANDATTRIBUTEOD0] [varchar](22) NULL,
	[LANDATTRIBUTEOD1] [varchar](22) NULL,
	[LANDATTRIBUTEOM0] [varchar](50) NULL,
	[LANDATTRIBUTEOM1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblpersonsecure_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblpersonsecure_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[PERSONCODE] [numeric](15, 0) NULL,
	[NAME1] [varchar](60) NULL,
	[NAME2] [varchar](60) NULL,
	[PHONE] [varchar](18) NULL,
	[FAX] [varchar](18) NULL,
	[MOBILE] [varchar](18) NULL,
	[PAGER] [varchar](18) NULL,
	[EMAILADDRESS] [varchar](100) NULL,
	[FEDERALIDNO] [varchar](30) NULL,
	[PRIVATEFLAG] [numeric](1, 0) NULL,
	[PERSONON0] [numeric](20, 6) NULL,
	[PERSONON1] [numeric](20, 6) NULL,
	[PERSONON2] [numeric](20, 6) NULL,
	[ALTNAME1] [varchar](60) NULL,
	[PERSONTYPEID] [numeric](15, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[PERSONOD0] [varchar](22) NULL,
	[PERSONOD1] [varchar](22) NULL,
	[PERSONOM0] [varchar](50) NULL,
	[PERSONOM1] [varchar](50) NULL,
	[PERSONOT0] [varchar](50) NULL,
	[PERSONOT1] [varchar](50) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblsale_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblsale_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[RECEPTIONNO] [varchar](30) NULL,
	[BOOK] [varchar](6) NULL,
	[PAGE] [varchar](10) NULL,
	[GRANTOR] [varchar](80) NULL,
	[GRANTEE] [varchar](80) NULL,
	[DOCUMENTDATE] [varchar](22) NULL,
	[SALEDATE] [varchar](22) NULL,
	[DEEDCODE] [varchar](10) NULL,
	[SALEPRICE] [numeric](15, 2) NULL,
	[PPADJAMOUNT] [numeric](15, 2) NULL,
	[GOODWILLADJAMOUNT] [numeric](15, 2) NULL,
	[OTHERADJAMOUNT] [numeric](15, 2) NULL,
	[TIMEADJ] [numeric](15, 4) NULL,
	[NONSALEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblsaleacct_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblsaleacct_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[RECEPTIONNO] [varchar](30) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[INVENTORYEFFECTIVEDATE] [varchar](22) NULL,
	[ACCTADJSALEPRICE] [numeric](15, 2) NULL,
	[GROUPPRIMARYACCTFLAG] [numeric](1, 0) NULL,
	[SALEACCTON0] [numeric](20, 6) NULL,
	[SALEACCTON1] [numeric](20, 6) NULL,
	[SALEACCTON2] [numeric](20, 6) NULL,
	[SALEACCTOD0] [varchar](22) NULL,
	[SALEACCTOD1] [varchar](22) NULL,
	[SALEACCTOM0] [varchar](50) NULL,
	[SALEACCTOM1] [varchar](50) NULL,
	[SALEACCTOT0] [varchar](50) NULL,
	[SALEACCTOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SALEACCTPENALTYDATE] [varchar](22) NULL,
	[SALEACCTPENALTYFLAG] [numeric](1, 0) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblsubaccount_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tblsubaccount_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[VERSTART] [numeric](11, 0) NULL,
	[VEREND] [numeric](11, 0) NULL,
	[SUBNO] [varchar](30) NULL,
	[FILINGNO] [varchar](30) NULL,
	[ACCOUNTNO] [varchar](30) NULL,
	[BLOCK] [varchar](20) NULL,
	[LOT] [varchar](20) NULL,
	[TRACT] [varchar](20) NULL,
	[SUBACCOUNTON0] [numeric](20, 6) NULL,
	[SUBACCOUNTON1] [numeric](20, 6) NULL,
	[SUBACCOUNTON2] [numeric](20, 6) NULL,
	[SUBACCOUNTOD0] [varchar](22) NULL,
	[SUBACCOUNTOD1] [varchar](22) NULL,
	[SUBACCOUNTOM0] [varchar](50) NULL,
	[SUBACCOUNTOM1] [varchar](50) NULL,
	[SUBACCOUNTOT0] [varchar](50) NULL,
	[SUBACCOUNTOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[WRITEDATE] [varchar](22) NULL,
	[SEQID] [numeric](15, 0) NULL,
	[PRIORSUBNO] [varchar](30) NULL,
	[PRIORFILINGNO] [varchar](30) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tbnsubfiling_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tbnsubfiling_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[SUBNO] [varchar](30) NULL,
	[FILINGNO] [varchar](30) NULL,
	[SUBFILINGDESCRIPTION] [varchar](50) NULL,
	[SUBFILINGRECORDINGNO] [varchar](20) NULL,
	[SUBFILINGCITY] [varchar](50) NULL,
	[DEFAULTSECTION] [varchar](15) NULL,
	[DEFAULTTOWNSHIP] [varchar](15) NULL,
	[DEFAULTRANGE] [varchar](15) NULL,
	[DEFAULTQTR] [varchar](15) NULL,
	[DEFAULTQTRQTR] [varchar](15) NULL,
	[SUBFILINGDATERECORDED] [varchar](22) NULL,
	[DEFAULTLEA] [varchar](30) NULL,
	[DEFAULTTAXDISTRICT] [varchar](10) NULL,
	[MAPNO] [varchar](40) NULL,
	[ECONOMICAREACODE] [varchar](10) NULL,
	[ACCOUNTTYPE] [varchar](15) NULL,
	[LANDCERTIFICATIONCODE] [varchar](10) NULL,
	[FLAGTYPE] [varchar](12) NULL,
	[SUBFILINGSTATUS] [varchar](15) NULL,
	[DEFAULTAPPROACHTYPE] [varchar](15) NULL,
	[VALUEAREACODE] [varchar](10) NULL,
	[ZONINGCODE] [varchar](50) NULL,
	[BLOCKCOUNT] [numeric](15, 0) NULL,
	[LOTCOUNT] [numeric](15, 0) NULL,
	[TRACTCOUNT] [numeric](15, 0) NULL,
	[SUBFILINGMHTITLEFLAG] [numeric](1, 0) NULL,
	[SUBFILINGNOTESFLAG] [numeric](1, 0) NULL,
	[SUBFILINGNEWCONSTFLAG] [numeric](1, 0) NULL,
	[SUBFILINGPHOTOSFLAG] [numeric](1, 0) NULL,
	[SUBFILINGSKETCHESFLAG] [numeric](1, 0) NULL,
	[SUBFILINGTAXYEAR] [numeric](4, 0) NULL,
	[SUBFILINGON0] [numeric](20, 6) NULL,
	[SUBFILINGON1] [numeric](20, 6) NULL,
	[SUBFILINGON2] [numeric](20, 6) NULL,
	[ASSIGNEDTO] [varchar](20) NULL,
	[SUBFILINGOD0] [varchar](22) NULL,
	[SUBFILINGOD1] [varchar](22) NULL,
	[SUBFILINGOM0] [varchar](50) NULL,
	[SUBFILINGOM1] [varchar](50) NULL,
	[SUBFILINGOT0] [varchar](50) NULL,
	[SUBFILINGOT1] [varchar](50) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[DEFAULTLEGAL] [varchar](4000) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[PRIMARYUSECODE] [varchar](10) NULL,
	[APPRAISALTYPE] [varchar](30) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tlkpabstractcode_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tlkpabstractcode_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[ABSTRACTCODE] [varchar](10) NULL,
	[ABSTRACTDESCRIPTION] [varchar](500) NULL,
	[EQUIVALENCEABSTRACTCODE] [varchar](10) NULL,
	[ROLLABSTRACTVALUEFLAG] [numeric](1, 0) NULL,
	[VALUEGROUPCODE] [numeric](15, 0) NULL,
	[ACTUALPRECISION] [numeric](11, 0) NULL,
	[ACTUALMINIMUMVALUE] [numeric](11, 0) NULL,
	[ASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ASSESSEDMINIMUMVALUE] [numeric](11, 0) NULL,
	[ACTUALROUNDTYPE] [varchar](10) NULL,
	[ASSESSEDROUNDTYPE] [varchar](10) NULL,
	[USEVALUEFLAG] [numeric](1, 0) NULL,
	[ADJACTUALPRECISION] [numeric](11, 0) NULL,
	[ADJACTUALMINIMUMVALUE] [numeric](11, 0) NULL,
	[ADJACTUALROUNDTYPE] [varchar](10) NULL,
	[ADJASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ADJASSESSEDMINIMUMVALUE] [numeric](11, 0) NULL,
	[ADJASSESSEDROUNDTYPE] [varchar](10) NULL,
	[ADJALTACTUALPRECISION] [numeric](11, 0) NULL,
	[ADJALTACTUALMINVALUE] [numeric](11, 0) NULL,
	[ADJALTACTUALROUNDTYPE] [varchar](10) NULL,
	[ADJALTASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ADJALTASSESSEDMINVALUE] [numeric](11, 0) NULL,
	[ADJALTASSESSEDDROUNDTYPE] [varchar](10) NULL,
	[ALTASSESSEDPRECISION] [numeric](11, 0) NULL,
	[ALTASSESSEDMINIMUMVALUE] [numeric](11, 0) NULL,
	[ALTASSESSEDROUNDTYPE] [varchar](10) NULL,
	[SHOWADMINFLAG] [numeric](1, 0) NULL,
	[CLASSIFICATIONID] [varchar](2) NULL,
	[LOCALGROWTHEXEMPTFLAG] [numeric](1, 0) NULL,
	[EXPORTCNTGROUPEXCLUSIONFLAG] [numeric](1, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[LIMITTOABSTTYPE] [varchar](1) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[ABSTRACTCATEGORYCODE] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tlkpimpsaddons_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tlkpimpsaddons_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[ADDONDESCRIPTION] [varchar](50) NULL,
	[ADDONVALUE] [numeric](15, 2) NULL,
	[ADDONFILTERTYPE] [varchar](50) NULL,
	[DEPRTYPE] [varchar](20) NULL,
	[OVERRIDELIFEEXPECTANCY] [numeric](3, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[USEINANALYSISFLAG] [numeric](1, 0) NULL,
	[IMPDETAILTYPE] [varchar](30) NULL,
	[ADDONCODE] [numeric](15, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[APEXLINKFLAG] [numeric](1, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tlkpimpsocctype_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tlkpimpsocctype_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[OCCCODE] [numeric](15, 0) NULL,
	[OCCCODEDESCRIPTION] [varchar](50) NULL,
	[ABSTRACTCODE] [varchar](10) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tlkpleatype_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tlkpleatype_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[LEA] [varchar](30) NULL,
	[LEADESCRIPTION] [varchar](50) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[ACTIVEFLAG] [numeric](1, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tmaptaxauthoritydetailfund_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tmaptaxauthoritydetailfund_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[TAXAUTHORITY] [varchar](10) NULL,
	[TAXYEAR] [numeric](4, 0) NULL,
	[FUNDCODE] [varchar](20) NULL,
	[PARENTFUNDCODE] [varchar](20) NULL,
	[ASSESSEDMILLLEVY] [numeric](11, 6) NULL,
	[ALTERNATEMILLLEVY] [numeric](11, 6) NULL,
	[REALFLAG] [numeric](1, 0) NULL,
	[PPFLAG] [numeric](1, 0) NULL,
	[MAXLEVYINCLUDEFLAG] [numeric](1, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[LEVYTYPEID] [numeric](4, 0) NULL,
	[TAXDISTRICTID] [numeric](15, 0) NULL,
	[EXCLUDEREDUCEDRATEFLAG] [numeric](1, 0) NULL,
	[INCLUDEONTAXBILLFLAG] [numeric](1, 0) NULL,
	[PERMANENTRATE] [numeric](11, 6) NULL,
	[BILLINGRATE] [numeric](11, 6) NULL,
	[URDOTADJUSTMENTRATE] [numeric](11, 6) NULL,
	[BUDGETEDTAXVALUE] [numeric](15, 2) NULL,
	[BUDGETEDTAXRATE] [numeric](11, 6) NULL,
	[TRUNCATIONLOSSVALUE] [numeric](15, 2) NULL,
	[FUNDCATEGORYTYPEID] [numeric](3, 0) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tmaptaxdistrictauthority_err]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[s_tmaptaxdistrictauthority_err](
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[DQM_RULE] [varchar](100) NOT NULL,
	[ERROR_DESCRIPTION] [varchar](100) NOT NULL,
	[DQM_RUN_DATE] [date] NOT NULL,
	[TAXDISTRICT] [varchar](10) NULL,
	[TAXAUTHORITY] [varchar](10) NULL,
	[TAXYEAR] [numeric](4, 0) NULL,
	[SORTORDER] [numeric](9, 0) NULL,
	[JURISDICTIONID] [numeric](15, 0) NULL,
	[LASTUPDATED] [varchar](22) NULL,
	[TIFAUTHORITY] [varchar](10) NULL,
	[TIFPERCENTAGE] [numeric](8, 7) NULL,
	[EXCESSVALUE] [numeric](15, 2) NULL,
	[EXCESSVALUENOTUSED] [numeric](15, 2) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[valid_account]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dqm].[valid_account](
	[account_no] [varchar](30) NOT NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
 CONSTRAINT [pk_valid_account] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dqm].[q_tblimpsocc]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dqm].[q_tblimpsocc] as 
select -- all columns
DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, OCCCODE, OCCPERCENT, ABSTRACTCODE, IMPABSTRACTVALUE, ABSTRACTINDATE, ABSTRACTOUTDATE, ABSTRACTADJCODE, PRORATETYPE, TAXDISTRICT, JURISDICTIONID, IMPSOCCOT0, IMPSOCCOT1, IMPSOCCOM0, IMPSOCCOM1, IMPSOCCOD0, IMPSOCCOD1, IMPSOCCON0, IMPSOCCON1, IMPSOCCON2, WRITEDATE, OCCCOMPLETEDPCT, SEQID
from [asr_staging].[s_tblimpsocc]
WHERE ACCOUNTNO NOT IN
(SELECT ACCOUNTNO FROM [dqm].[S_TBLIMPSOCC_ERR]);



GO
/****** Object:  View [trn].[v_etl_improvement_occupancy]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [trn].[v_etl_improvement_occupancy]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/3/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement_occupancy table
*************************************************************************************/
AS
SELECT
      i.ACCOUNTNO AS account_no
     ,i.IMPNO AS improvement_no
     ,i.DETAILID AS occupancy_detail_id
     ,i.OCCCODE AS occupancy_code
     ,o.OCCCODEDESCRIPTION AS occupancy_code_description
     ,i.OCCPERCENT AS occupancy_percent
     ,i.ABSTRACTCODE AS abstract_code
     ,c.ABSTRACTDESCRIPTION AS abstract_code_description
     ,i.IMPABSTRACTVALUE AS abstract_value
     ,GETDATE() AS create_datetime
     ,SUSER_NAME() AS create_user_id
     ,HASHBYTES('SHA2_256', 
                 ISNULL(RTRIM( i.ACCOUNTNO), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.IMPNO), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.DETAILID), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.OCCCODE), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(o.OCCCODEDESCRIPTION), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.OCCPERCENT), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.ABSTRACTCODE), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(c.ABSTRACTDESCRIPTION), 'DBNULL_TEXT') 
               + ISNULL(RTRIM(i.IMPABSTRACTVALUE), 'DBNULL_TEXT') 
		) AS rowhash
FROM  [dqm].[q_tblimpsocc] i
LEFT OUTER JOIN [asr_staging].[s_tlkpabstractcode] c
ON i.ABSTRACTCODE = c.ABSTRACTCODE  
LEFT OUTER JOIN [asr_staging].[s_tlkpimpsocctype] o
ON i.OCCCODE = o.OCCCODE
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON i.ACCOUNTNO = v.account_no;









GO
/****** Object:  View [dqm].[q_tblimpsbltas]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dqm].[q_tblimpsbltas] as 
select -- all columns
DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, BLTASCODE, HVACPERCENT, CLIMATE, IMPEXTERIOR, IMPINTERIOR, BLTASSTORIES, BLTASSTORYHEIGHT, ROOFTYPE, ROOFCOVER, FLOORCOVER, BLTASFOUNDATION, ROOMCOUNT, BEDROOMCOUNT, BLTASTOTALUNITCOUNT, IMPBLTASOTHER, CLASSCODE, DIAMETER, CAPACITY, BLTASHORSEPOWER, BLTASHEIGHT, BLTASYEARBUILT, YEARREMODELED, REMODELEDPERCENT, EFFECTIVEAGE, BLTASLENGTH, BLTASWIDTH, MHTAGLENGTH, MHTAGWIDTH, MHSKIRT, MHSKIRTLINEARFEET, MHWALLTYPE, BLTASSF, SPRINKLERSF, BATHCOUNT, PRIMARYBLTASORDERNO, JURISDICTIONID, HVACTYPE, IMPSBLTASOT0, IMPSBLTASOT1, IMPSBLTASOM0, IMPSBLTASOM1, IMPSBLTASOD0, IMPSBLTASOD1, IMPSBLTASON0, IMPSBLTASON1, IMPSBLTASON2, WRITEDATE, MHDEPRCODE, MHMAKE, MHMODELNAME, SEQID, APEXID 
from [asr_staging].[s_tblimpsbltas]
WHERE ACCOUNTNO NOT IN 
(SELECT ACCOUNTNO FROM [dqm].[S_TBLIMPSBLTAS_ERR]);




GO
/****** Object:  View [trn].[v_etl_improvement_built_as]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [trn].[v_etl_improvement_built_as]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/3/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement_occupancy table
*************************************************************************************/
AS
SELECT
      i.ACCOUNTNO  AS account_no
     ,i.IMPNO  AS improvement_no
     ,i.DETAILID  AS built_as_detail_id
     ,i.BLTASCODE  AS built_as_code 
     ,c.BLTASDESCRIPTION AS built_as_code_description
     ,i.HVACPERCENT  AS hvac_percent
     ,i.IMPEXTERIOR  AS exterior_construction_type
     ,i.IMPINTERIOR  AS interior_finish_type
     ,i.BLTASSTORIES  AS no_of_story
     ,i.BLTASSTORYHEIGHT  AS typical_story_height
     ,i.BLTASHEIGHT  AS built_as_height
     ,i.ROOFTYPE  AS roof_construction_type
     ,i.ROOFCOVER  AS roof_material_type
     ,i.FLOORCOVER  AS floor_material_type
     ,i.ROOMCOUNT  AS room_count
     ,i.BEDROOMCOUNT  AS bedroom_count
     ,i.BLTASTOTALUNITCOUNT  AS total_unit_count
     ,i.CLASSCODE  AS class_code
     ,ccd.CLASSDESCRIPTION  AS class_code_description
     ,i.BLTASYEARBUILT  AS built_year
     ,i.YEARREMODELED  AS remodeled_year
     ,i.REMODELEDPERCENT  AS remodeled_percent
     ,i.EFFECTIVEAGE  AS effective_age
     ,i.BLTASSF  AS built_as_sf
     ,i.SPRINKLERSF  AS sprinkler_coverage_sf
     ,i.BATHCOUNT  AS bathroom_count
     ,i.HVACTYPE  AS heat_type
     ,GETDATE() AS create_datetime
     ,SUSER_NAME() AS create_user_id
     ,HASHBYTES('SHA2_256', 
                 ISNULL(RTRIM(i.ACCOUNTNO), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.IMPNO), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.DETAILID), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BLTASCODE), 'DBNULL_TEXT')
               + ISNULL(RTRIM(c.BLTASDESCRIPTION), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.HVACPERCENT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.IMPEXTERIOR), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.IMPINTERIOR), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BLTASSTORIES), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BLTASSTORYHEIGHT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BLTASHEIGHT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.ROOFTYPE), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.ROOFCOVER), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.FLOORCOVER), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.ROOMCOUNT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BEDROOMCOUNT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BLTASTOTALUNITCOUNT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.CLASSCODE), 'DBNULL_TEXT')
               + ISNULL(RTRIM(ccd.CLASSDESCRIPTION), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BLTASYEARBUILT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.YEARREMODELED), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.REMODELEDPERCENT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.EFFECTIVEAGE), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BLTASSF), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.SPRINKLERSF), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.BATHCOUNT), 'DBNULL_TEXT')
               + ISNULL(RTRIM(i.HVACTYPE), 'DBNULL_TEXT')
		) AS rowhash
FROM  [dqm].[q_tblimpsbltas] i
LEFT OUTER JOIN [asr_staging].[s_tlkpimpsbltastype] c
ON i.BLTASCODE = c.BLTASCODE 
LEFT OUTER JOIN [asr_staging].[s_tlkpimpscomclasstype] ccd
ON i.CLASSCODE = ccd.CLASSCODE
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON i.ACCOUNTNO = v.account_no;











GO
/****** Object:  View [dqm].[q_tmaptaxauthoritydetailfund]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dqm].[q_tmaptaxauthoritydetailfund] as 
select -- all columns
TAXAUTHORITY, TAXYEAR, FUNDCODE, PARENTFUNDCODE, ASSESSEDMILLLEVY, ALTERNATEMILLLEVY, REALFLAG, PPFLAG, MAXLEVYINCLUDEFLAG, SORTORDER, JURISDICTIONID, LASTUPDATED, LEVYTYPEID, TAXDISTRICTID, EXCLUDEREDUCEDRATEFLAG, INCLUDEONTAXBILLFLAG, PERMANENTRATE, BILLINGRATE, URDOTADJUSTMENTRATE, BUDGETEDTAXVALUE, BUDGETEDTAXRATE, TRUNCATIONLOSSVALUE, FUNDCATEGORYTYPEID
from [asr_staging].[s_tmaptaxauthoritydetailfund]
WHERE taxauthority+CAST(taxyear AS VARCHAR(4) )+fundcode NOT IN
(SELECT taxauthority+CAST(taxyear AS VARCHAR(4) )+fundcode from [dqm].[S_TMAPTAXAUTHORITYDETAILFUND_ERR]);



GO
/****** Object:  View [trn].[v_etl_tax_authority_fund]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [trn].[v_etl_tax_authority_fund]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all tax authorities
*************************************************************************************/
AS
SELECT
   i.TAXAUTHORITY AS tax_authority_no
  ,i.FUNDCODE AS tax_fund_code
  ,i.LEVYTYPEID AS levy_type_id
  ,l.LEVYTYPE AS levy_type
  ,i.ASSESSEDMILLLEVY AS assessed_mill_levy
  ,f.FUNDDESCRIPTION  AS tax_fund_description
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
      ,HASHBYTES('SHA2_256', 
                  ISNULL(RTRIM(i.TAXAUTHORITY), 'DBNULL_TEXT')
                + ISNULL(RTRIM(i.FUNDCODE), 'DBNULL_TEXT')
                + ISNULL(RTRIM(i.LEVYTYPEID), 'DBNULL_TEXT')
                + ISNULL(RTRIM(l.LEVYTYPE), 'DBNULL_TEXT')
                + ISNULL(RTRIM(i.ASSESSEDMILLLEVY), 'DBNULL_TEXT')
                + ISNULL(RTRIM(f.FUNDDESCRIPTION), 'DBNULL_TEXT')
				) AS rowhash	
FROM
    dqm.q_tmaptaxauthoritydetailfund i
	INNER JOIN asr_staging.s_tlkptaxfund f
	ON i.fundcode = f.fundcode
	INNER JOIN asr_staging.s_tsylevytype l
	ON i.LEVYTYPEID = l.LEVYTYPEID








GO
/****** Object:  View [dqm].[q_tblsale]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dqm].[q_tblsale] as 
select
VERSTART, VEREND, cast(RECEPTIONNO as varchar(20)) AS RECEPTIONNO, BOOK, PAGE, GRANTOR, GRANTEE, DOCUMENTDATE
, SALEDATE, DOCUMENTFEE, DEEDCODE, PENALTYFLAG, PENALTYDATE, SALEPRICE, PPADJAMOUNT, GOODWILLADJAMOUNT, OTHERADJAMOUNT
, TIMEADJ, DOWNPAYMENTAMOUNT, DOWNPAYMENTPCT, NOTEAMOUNT, INTERESTRATEPCT, LOANTERM, POINTSPAID, POINTSPAIDBY, LOANINSTITUTION
, MKTRATEPCT, PAYMENTAMOUNT, RECOURSEFLAG, TENANT, VALID1FLAG, VALID2FLAG, CONFIRMEDFLAG, EXCLUDECODE1, EXCLUDECODE2
, IMPROVEDFLAG, CONFIRMBY, CONFIRMMETHOD, CONFIRMDATE, COMMENTS, NONSALEFLAG, SALEON0, SALEON1, SALEON2, SALEOD0, SALEOD1
, SALEOM0, SALEOM1, SALEOT0, SALEOT1, JURISDICTIONID, WRITEDATE, BALLOONPAYMENTYEAR, TRANSFERDECLARATIONFLAG, TRANSFERDECLARATIONDATE, QUESTIONNAIREMAILDATE, QUESTIONNAIRERETURNDATE, SEQID
from [asr_staging].[s_tblsale]
WHERE RECEPTIONNO NOT IN
(SELECT RECEPTIONNO FROM [dqm].[S_TBLSALE_ERR]);


GO
/****** Object:  View [trn].[v_etl_sale]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_sale]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/24/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all sales
*************************************************************************************/
AS
SELECT s.RECEPTIONNO AS recording_no
      ,s.GRANTOR AS grantor
      ,s.GRANTEE AS grantee
      ,s.SALEDATE AS sale_date
      ,s.DEEDCODE AS deed_code
	  ,d.DEEDDESCRIPTION AS deed_code_description
      ,s.SALEPRICE AS sale_price
      ,s.VALID1FLAG AS valid1_flag
      ,s.CONFIRMEDFLAG AS confirmed_flag
      ,s.EXCLUDECODE1 AS exclude_code_1
	  ,se.EXCLUDEDESCRIPTION AS exclude_code_1_description
      ,s.IMPROVEDFLAG AS improved_flag
      ,s.NONSALEFLAG AS non_sale_flag
      ,GETDATE() AS create_datetime
      ,SUSER_NAME () AS create_user_id
      ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(s.RECEPTIONNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.GRANTOR), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.GRANTEE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.SALEDATE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.DEEDCODE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.SALEPRICE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.VALID1FLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.CONFIRMEDFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.EXCLUDECODE1), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(se.EXCLUDEDESCRIPTION), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(s.IMPROVEDFLAG), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(s.NONSALEFLAG), 'DBNULL_TEXT')
				) AS rowhash	
  FROM dqm.q_tblsale s  
  LEFT OUTER JOIN asr_staging.s_tlkpsaleexclude se
  ON s.EXCLUDECODE1 = se.EXCLUDECODE
  LEFT OUTER JOIN asr_staging.s_tlkpdeedtype d
  ON s.DEEDCODE = d.deedcode;






GO
/****** Object:  View [dqm].[q_tblsaleacct]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dqm].[q_tblsaleacct] as 
select VERSTART, VEREND, substring(RECEPTIONNO,1,20) RECEPTIONNO, ACCOUNTNO, INVENTORYEFFECTIVEDATE, ACCTADJSALEPRICE, GROUPPRIMARYACCTFLAG, SALEACCTON0, SALEACCTON1, SALEACCTON2, SALEACCTOD0, SALEACCTOD1, SALEACCTOM0, SALEACCTOM1, SALEACCTOT0, SALEACCTOT1, JURISDICTIONID, WRITEDATE, SALEACCTPENALTYDATE, SALEACCTPENALTYFLAG, SEQID 
from [asr_staging].[s_tblsaleacct]
WHERE ACCOUNTNO NOT IN
(SELECT ACCOUNTNO FROM [dqm].[S_TBLSALEACCT_ERR]);

GO
/****** Object:  View [trn].[v_etl_sale_account]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_sale_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/25/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all details for sale_account
*************************************************************************************/
AS
SELECT sa.RECEPTIONNO AS recording_no
      ,sa.ACCOUNTNO AS account_no
      ,GETDATE() AS create_datetime
      ,SUSER_NAME () AS create_user_id
      ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(sa.RECEPTIONNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sa.ACCOUNTNO), 'DBNULL_TEXT') 
				) AS rowhash	
FROM dqm.q_tblsaleacct sa  
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON sa.ACCOUNTNO = v.account_no
LEFT OUTER JOIN [dqm].[s_tblsale_err] s  --exclude bad tblsale related rows
ON sa.RECEPTIONNO = s.RECEPTIONNO
WHERE s.RECEPTIONNO IS NULL;






GO
/****** Object:  View [dqm].[q_tblacctreal]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dqm].[q_tblacctreal] as 
select -- all columns
VERSTART, VEREND, ACCOUNTNO, IMPONLYFLAG, TIFFLAG, VACANTFLAG, LANDWIDTH, LANDDEPTH, LANDEASEMENTSF, LANDEXCESSSF, TRAFFICCOUNT, PARKINGSPACES, ZONINGCODE, FLOODFRINGE, FLOODWAY, TAPFEE, PLATTEDFLAG, LANDCERTIFICATIONCODE, LANDAPPRAISER, LANDAPPRAISALDATE, LANDOVERRIDESIZEADJ, LANDSIZEADJ, LANDGROSSSF, LANDGROSSACRES, LANDGROSSFF, LANDGROSSUNITCOUNT, ACCTREALON0, ACCTREALON1, ACCTREALON2, ACCTREALOD0, ACCTREALOD1, ACCTREALOM0, ACCTREALOM1, ACCTREALOT0, ACCTREALOT1, JURISDICTIONID, DEFAULTLEA, TOTALACCTIMPINTERESTPCT, TOTALACCTLANDINTERESTPCT, WRITEDATE, SEQID
from [asr_staging].[s_tblacctreal]
WHERE ACCOUNTNO NOT IN 
(SELECT ACCOUNTNO FROM [dqm].[S_TBLACCTREAL_ERR]);




GO
/****** Object:  View [dqm].[q_tlkpleatype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dqm].[q_tlkpleatype] as 
select -- all columns
LEA, LEADESCRIPTION, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED
from [asr_staging].[s_tlkpleatype]
WHERE LEA NOT IN
(SELECT LEA FROM [dqm].[S_TLKPLEATYPE_ERR]);


GO
/****** Object:  View [trn].[v_etl_real_account]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [trn].[v_etl_real_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all real property accounts
*************************************************************************************/
AS
SELECT 
       s.ACCOUNTNO  AS account_no
	  ,s.VACANTFLAG  AS vacant_flag
	  ,s.IMPONLYFLAG  AS improvement_only_flag
	  ,s.TIFFLAG  AS tif_flag
	  ,s.ZONINGCODE  AS zoning_code
	  ,zc.ZONINGDESCRIPTION  AS zoning_code_description
	  ,s.PLATTEDFLAG  AS platted_flag
	  ,s.DEFAULTLEA  AS default_lea
	  ,l.LEADESCRIPTION  AS default_lea_description
	  ,s.TOTALACCTIMPINTERESTPCT AS total_improvement_interest_percent
	  ,s.TOTALACCTLANDINTERESTPCT AS total_land_interest_percent
      ,GETDATE() AS create_datetime
      ,SUSER_NAME () AS create_user_id
      ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(s.ACCOUNTNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.VACANTFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.IMPONLYFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.TIFFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.ZONINGCODE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(zc.ZONINGDESCRIPTION), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.PLATTEDFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.DEFAULTLEA), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(l.LEADESCRIPTION), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.TOTALACCTIMPINTERESTPCT), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.TOTALACCTLANDINTERESTPCT), 'DBNULL_TEXT') 
				) AS rowhash				
FROM dqm.q_tblacctreal s
     LEFT OUTER JOIN [asr_staging].[s_tlkpzoning] zc
     ON s.ZONINGCODE = zc.ZONINGCODE
     LEFT OUTER JOIN [dqm].[q_tlkpleatype] l
     ON s.DEFAULTLEA = l.LEA
     INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
     ON s.ACCOUNTNO = v.account_no;







GO
/****** Object:  View [dqm].[q_tmaptaxdistrictauthority]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dqm].[q_tmaptaxdistrictauthority] as 
select -- all columns
TAXDISTRICT, TAXAUTHORITY, TAXYEAR, SORTORDER, JURISDICTIONID, LASTUPDATED, TIFAUTHORITY, TIFPERCENTAGE, EXCESSVALUE, EXCESSVALUENOTUSED, ETL_RUN_TIME
from [asr_staging].[s_tmaptaxdistrictauthority]
WHERE taxdistrict+taxauthority+taxyear  NOT IN
(SELECT taxdistrict+taxauthority+taxyear FROM [dqm].[S_TMAPTAXDISTRICTAUTHORITY_ERR]);






GO
/****** Object:  View [trn].[v_etl_tax_district_authority]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
-- 
*/

CREATE VIEW [trn].[v_etl_tax_district_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all details for the tax_district_authority table
*************************************************************************************/
AS
SELECT
  tda.taxdistrict AS tax_district_no,
  tda.taxauthority AS tax_authority_no,
  GETDATE() AS create_datetime,
  SUSER_NAME() AS create_user_id
FROM
    dqm.q_tmaptaxdistrictauthority tda





GO
/****** Object:  View [dqm].[q_tblacctowneraddress]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dqm].[q_tblacctowneraddress] as 
select -- all columns 
VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, 
ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, 
ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE, ETL_RUN_TIME
from [asr_staging].[s_tblacctowneraddress]
WHERE ACCOUNTNO NOT IN 
(SELECT ACCOUNTNO FROM [dqm].[S_TBLACCTOWNERADDRESS_ERR]);





GO
/****** Object:  View [dqm].[q_tbladdresssecure]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dqm].[q_tbladdresssecure] as 
select -- all columns 
VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, 
ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, 
ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID, ETL_RUN_TIME
from [asr_staging].[s_tbladdresssecure]
WHERE ADDRESSCODE NOT IN
(SELECT ADDRESSCODE FROM [dqm].[S_TBLADDRESSSECURE_ERR]);





GO
/****** Object:  View [dqm].[q_tblpersonsecure]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dqm].[q_tblpersonsecure] as 
select -- all columns
VERSTART, VEREND, PERSONCODE, NAME1, NAME2, PHONE, FAX, MOBILE, PAGER, EMAILADDRESS, FEDERALIDNO, 
PRIVATEFLAG, PERSONON0, PERSONON1, PERSONON2, ALTNAME1, PERSONTYPEID, JURISDICTIONID, PERSONOD0, 
PERSONOD1, PERSONOM0, PERSONOM1, PERSONOT0, PERSONOT1, WRITEDATE, SEQID, ETL_RUN_TIME
from [asr_staging].[s_tblpersonsecure]
WHERE PERSONCODE NOT IN 
(SELECT PERSONCODE FROM [dqm].[S_TBLPERSONSECURE_ERR]);





GO
/****** Object:  View [trn].[v_etl_account_owner_address]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














CREATE VIEW [trn].[v_etl_account_owner_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/29/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the account_owner_address table
Mod #:  2
Mod Date:      3/31/2016
Developer:     Christine Lin
Comments:      change owner_name to 'Unavailable' from NULL
*************************************************************************************/
AS
SELECT
   aoa.ACCOUNTNO AS account_no
  ,p.PERSONCODE AS person_code
  ,aoa.PRIMARYOWNERFLAG AS primary_owner_flag
  ,CASE WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NOT NULL THEN p.NAME1 + ' '+ p.NAME2
        WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NULL THEN p.NAME1
		WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NULL AND p.NAME2 IS NOT NULL THEN p.NAME2
        ELSE 'Unavailable' END AS owner_name  --change to Not Available from NULL
  ,aoa.OWNERPERCENT AS ownership_percent
  ,p.FEDERALIDNO AS federal_id_no
  ,ad.ADDRESS1 AS address_line_1
  ,ad.ADDRESS2 AS address_line_2
  ,ad.CITY AS city_name
  ,ISNULL(ad.STATECODE, ad.PROVINCE) AS state
  ,ISNULL(ad.ZIPCODE, ad.POSTALCODE) AS zip_code
  ,ad.COUNTRY AS country
  ,p.PRIVATEFLAG AS private_flag --indicate peace officer or domestic violence related individual
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(aoa.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.PERSONCODE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(aoa.PRIMARYOWNERFLAG), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(p.NAME1), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(p.NAME2), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(CASE WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NOT NULL THEN p.NAME1 + ' '+ p.NAME2
                                WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NULL THEN p.NAME1
	  	                        WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NULL AND p.NAME2 IS NOT NULL THEN p.NAME2
                                ELSE 'Not Available' END), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(aoa.OWNERPERCENT), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.FEDERALIDNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.ADDRESS1), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.ADDRESS2), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.CITY), 'DBNULL_TEXT')
			+ ISNULL(ISNULL(ad.STATECODE, ad.PROVINCE), 'DBNULL_TEXT')
			+ ISNULL(ISNULL(ad.ZIPCODE, ad.POSTALCODE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(ad.COUNTRY), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(p.PRIVATEFLAG), 'DBNULL_TEXT')
			) AS rowhash
FROM [dqm].[q_tblacctowneraddress] aoa
INNER JOIN [dqm].[q_tblpersonsecure] p
ON aoa.PERSONCODE = p.PERSONCODE
INNER JOIN  [dqm].[q_tbladdresssecure] ad
ON aoa.ADDRESSCODE = ad.ADDRESSCODE
AND aoa.PERSONCODE = ad.PERSONCODE
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON aoa.ACCOUNTNO = v.account_no;













GO
/****** Object:  View [dqm].[q_tblacctpropertyaddress]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dqm].[q_tblacctpropertyaddress] as 
SELECT -- all columns
s.VERSTART, s.VEREND, s.ACCOUNTNO, s.BUILDINGID, s.PREDIRECTION, s.STREETNO, s.UNITNAME, s.POSTDIRECTION, s.STREETTYPE, s.STREETNAME, 
s.PROPERTYZIPCODE, s.PROPERTYCITY, s.ORDERNO, s.ACCTPROPERTYADDRESSON0, s.ACCTPROPERTYADDRESSON1, s.ACCTPROPERTYADDRESSON2, 
s.BUSINESSNAME, s.ACCTPROPERTYADDRESSOD0, s.ACCTPROPERTYADDRESSOD1, s.ACCTPROPERTYADDRESSOM0, s.ACCTPROPERTYADDRESSOM1, 
s.ACCTPROPERTYADDRESSOT0, s.ACCTPROPERTYADDRESSOT1, s.JURISDICTIONID, s.PROPERTYADDRESSCODE, s.WRITEDATE, s.LOCATIONID, s.SEQID, s.ETL_RUN_TIME
FROM [asr_staging].[s_tblacctpropertyaddress] s
LEFT OUTER JOIN [dqm].[S_TBLACCTPROPERTYADDRESS_ERR] e
ON s.ACCOUNTNO = e.ACCOUNTNO
WHERE e.ACCOUNTNO IS NULL;










GO
/****** Object:  View [trn].[v_etl_account_property_address]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [trn].[v_etl_account_property_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/29/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the account_property_address table
*************************************************************************************/
AS
SELECT
   apa.ACCOUNTNO AS account_no
  ,apa.ORDERNO AS order_no
  ,apa.BUILDINGID AS building_no
  ,CASE WHEN pa.min_orderno IS NULL THEN 0 ELSE 1 END AS primary_address_flag
  ,apa.UNITNAME AS unit_no
  ,NULL AS unit_designator
  ,apa.STREETNO AS address_number
  ,NULL AS address_number_suffix
  ,apa.PREDIRECTION AS pre_direction_code
  ,apa.STREETNAME AS street_name
  ,apa.STREETTYPE AS street_type_code
  ,apa.POSTDIRECTION AS post_direction_code
  ,apa.PROPERTYCITY AS city_name
  ,apa.PROPERTYZIPCODE AS location_zip_code
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(apa.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.ORDERNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.BUILDINGID), 'DBNULL_TEXT') 
			+ CAST(CASE WHEN pa.min_orderno IS NULL THEN 0 ELSE 1 END AS VARCHAR(1) )
			+ ISNULL(RTRIM(apa.UNITNAME), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(unit_designator), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.STREETNO), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(address_number_suffix), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.PREDIRECTION), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.STREETNAME), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.STREETTYPE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.POSTDIRECTION), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.PROPERTYCITY), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(apa.PROPERTYZIPCODE), 'DBNULL_TEXT')
			) AS rowhash
FROM  [dqm].[q_tblacctpropertyaddress] apa
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON apa.ACCOUNTNO = v.account_no
LEFT OUTER JOIN (SELECT ACCOUNTNO, MIN(ORDERNO) AS min_orderno
				 FROM [asr_staging].[s_tblacctpropertyaddress]
				 GROUP BY ACCOUNTNO ) pa
ON apa.ACCOUNTNO = pa.ACCOUNTNO
AND apa.ORDERNO = pa.min_orderno;







GO
/****** Object:  View [dqm].[q_tblacctnbhd]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dqm].[q_tblacctnbhd] as 
select -- all columns
VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, 
ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID, ETL_RUN_TIME
from [asr_staging].[s_tblacctnbhd]
WHERE ACCOUNTNO NOT IN
(SELECT ACCOUNTNO FROM [dqm].[S_TBLACCTNBHD_ERR]);





GO
/****** Object:  View [trn].[v_etl_account_neighborhood]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [trn].[v_etl_account_neighborhood]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/1/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for account_neighborhood
*************************************************************************************/
AS
SELECT 
   n.ACCOUNTNO AS account_no
  ,n.NBHDCODE AS neighborhood_code
  ,n.PROPERTYTYPE AS property_type
  ,n.NBHDEXTENSION AS neighborhood_extension
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
FROM [dqm].[q_tblacctnbhd] n
INNER JOIN [dqm].[valid_account] a
ON n.ACCOUNTNO = a.account_no;






GO
/****** Object:  View [dqm].[bad_account]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- 
*/

CREATE VIEW [dqm].[bad_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/27/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all accountnos from all *_err tables that have an accountno column
Mod #:  2
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      added tables for parcel details
*************************************************************************************/
AS
SELECT DISTINCT accountno
FROM (	
		SELECT accountno FROM [dqm].[s_tblacct_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblacctnbhd_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblacctowneraddress_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblacctpropertyaddress_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblsubaccount_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimps_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimpsbltas_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimpsdetail_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimpsocc_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblsaleacct_err]
      ) l





GO
/****** Object:  View [dqm].[q_tblacct]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dqm].[q_tblacct] as 
select -- all columns
VERSTART, VEREND, ACCOUNTNO, PARCELNO, LOCALNO, MAPNO, ACCTSTATUSCODE, ACCTTYPE, ASSIGNEDTO, VALUEAREACODE, 
ASSOCIATEDACCT, APPRAISALTYPE, ECONOMICAREACODE, ACCTDATECREATED, DEFAULTAPPROACHTYPE, DEFAULTTAXDISTRICT, 
BUSINESSLICENSE, MAPGROUP, CONTROLMAP, PROPERTYIDENTIFIER, SPECIALINTERESTNUMBER, ACCTON0, ACCTON1, ACCTON2, 
PRIMARYUSECODE, WARD, ACCTOD0, ACCTOD1, ACCTOM0, ACCTOM1, STRIPPEDACCOUNTNO, JURISDICTIONID, ACCTOT0, 
ACCTOT1, WRITEDATE, CENSUSTRACT, CENSUSBLOCK, MOBILEHOMESPACE, EFILEFLAG, BUSINESSNAME, COSTHYBRIDPERCENT, 
MARKETHYBRIDPERCENT, INCOMEHYBRIDPERCENT, RECONCILEDHYBRIDPERCENT, PARCELSEQUENCE, PROPERTYCLASSID, SEQID, DETAILEDREVIEWDATE, ETL_RUN_TIME
from [asr_staging].[s_tblacct]
where accountno not in (select accountno from [dqm].[s_tblacct_err]) 






GO
/****** Object:  View [dqm].[q_tblsubaccount]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dqm].[q_tblsubaccount] as 
select -- all columns 
VERSTART, VEREND, SUBNO, FILINGNO, ACCOUNTNO, BLOCK, LOT, TRACT, SUBACCOUNTON0, SUBACCOUNTON1, 
SUBACCOUNTON2, SUBACCOUNTOD0, SUBACCOUNTOD1, SUBACCOUNTOM0, SUBACCOUNTOM1, SUBACCOUNTOT0, 
SUBACCOUNTOT1, JURISDICTIONID, WRITEDATE, SEQID, PRIORSUBNO, PRIORFILINGNO, ETL_RUN_TIME
from [asr_staging].[s_tblsubaccount]
WHERE ACCOUNTNO NOT IN
(SELECT ACCOUNTNO FROM [dqm].[S_TBLSUBACCOUNT_ERR]);





GO
/****** Object:  View [trn].[v_etl_account]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [trn].[v_etl_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/27/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all accounts
*************************************************************************************/
AS
SELECT 
	a.ACCOUNTNO AS account_no
   ,a.PARCELNO AS state_parcel_no
   ,a.DEFAULTTAXDISTRICT AS tax_district_no
   ,sa.SUBNO AS sub_filing_recording_no
   ,t.ACCTTYPE AS account_type
   ,t.APPRAISALTYPE AS appraisal_type
   ,s.ACCTSTATUSCODE AS account_status
   ,s.ACCTSTATUSDESCRIPTION AS account_status_description
   ,al.LEGAL AS legal_description
   ,gis.longitude_x AS longitude_x
   ,gis.latitude_y AS latitude_y
   ,gis.elevation_z AS elevation_z
   ,gis.location AS location
   ,GETDATE() AS create_datetime
   ,SUSER_NAME () AS create_user_id
   ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(a.ACCOUNTNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(a.PARCELNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(a.DEFAULTTAXDISTRICT), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sa.SUBNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(t.ACCTTYPE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(t.APPRAISALTYPE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.ACCTSTATUSCODE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.ACCTSTATUSDESCRIPTION), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(al.LEGAL), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(gis.longitude_x), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.latitude_y), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.elevation_z), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.location), 'DBNULL_TEXT')
				) AS rowhash						
FROM 
	[dqm].[q_tblacct] a  
	INNER JOIN [asr_staging].[s_tlkpaccttype] t
	ON t.ACCTTYPE = a.ACCTTYPE AND t.APPRAISALTYPE = a.APPRAISALTYPE
	INNER JOIN [asr_staging].[s_tlkpstatusacct] s
	ON s.ACCTSTATUSCODE = a.ACCTSTATUSCODE
	INNER JOIN [asr_staging].[s_tlkptaxdistrict] td
	ON td.TAXDISTRICT = a.DEFAULTTAXDISTRICT
	LEFT OUTER JOIN [dqm].[q_tblsubaccount] sa
	ON sa.ACCOUNTNO = a.ACCOUNTNO
	LEFT OUTER JOIN (SELECT l1.accountno, l1.legal
					 FROM [asr_staging].[s_tblacctlegal] l1
					 INNER JOIN (
								SELECT accountno, max(seqid) as max_seqid
								FROM  [asr_staging].[s_tblacctlegal]
								GROUP BY accountno ) l2
					 ON l1.accountno = l2.accountno
					 AND l1.seqid = l2.max_seqid ) al   
	ON al.ACCOUNTNO = a.ACCOUNTNO
	LEFT OUTER JOIN [asr_staging].[s_account_location] gis
	ON gis.Account_Number = a.ACCOUNTNO
	LEFT OUTER JOIN [dqm].[bad_account] b  --exclude accounts that have DQM rule violations
	ON a.ACCOUNTNO = b.accountno
WHERE b.accountno IS NULL;









GO
/****** Object:  View [dqm].[q_tbnsubfiling]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dqm].[q_tbnsubfiling] as 
select -- all columns
SUBNO, FILINGNO, SUBFILINGDESCRIPTION, SUBFILINGRECORDINGNO, SUBFILINGCITY, DEFAULTSECTION, DEFAULTTOWNSHIP, 
DEFAULTRANGE, DEFAULTQTR, DEFAULTQTRQTR, SUBFILINGDATERECORDED, DEFAULTLEA, DEFAULTTAXDISTRICT, MAPNO, 
ECONOMICAREACODE, ACCOUNTTYPE, LANDCERTIFICATIONCODE, FLAGTYPE, SUBFILINGSTATUS, DEFAULTAPPROACHTYPE, 
VALUEAREACODE, ZONINGCODE, BLOCKCOUNT, LOTCOUNT, TRACTCOUNT, SUBFILINGMHTITLEFLAG, SUBFILINGNOTESFLAG, 
SUBFILINGNEWCONSTFLAG, SUBFILINGPHOTOSFLAG, SUBFILINGSKETCHESFLAG, SUBFILINGTAXYEAR, SUBFILINGON0, 
SUBFILINGON1, SUBFILINGON2, ASSIGNEDTO, SUBFILINGOD0, SUBFILINGOD1, SUBFILINGOM0, SUBFILINGOM1, SUBFILINGOT0, 
SUBFILINGOT1, JURISDICTIONID, DEFAULTLEGAL, LASTUPDATED, PRIMARYUSECODE, APPRAISALTYPE, ETL_RUN_TIME
from [asr_staging].[s_tbnsubfiling]
WHERE SUBNO NOT IN (SELECT SUBNO FROM [dqm].[S_TBNSUBFILING_ERR]);





GO
/****** Object:  View [trn].[v_etl_sub_filing]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [trn].[v_etl_sub_filing]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/27/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all subdivision filings
*************************************************************************************/
AS
SELECT sf.SUBNO AS sub_filing_recording_no
      ,sf.SUBFILINGRECORDINGNO AS subdivision_no
	  ,s.SUBNAME AS subdivision_name
	  ,sf.FILINGNO AS filing_no
	  ,sf.SUBFILINGDESCRIPTION AS filing_description
	  ,NULL AS dedicated_sub_filing_name
	  ,GETDATE() AS create_datetime
	  ,SUSER_NAME () AS create_user_id
	  ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(sf.SUBNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sf.SUBFILINGRECORDINGNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.SUBNAME), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sf.FILINGNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sf.SUBFILINGDESCRIPTION), 'DBNULL_TEXT') 
				) AS rowhash
  FROM dqm.q_tbnsubfiling sf
  INNER JOIN asr_staging.s_tbnsubdivision s 
        ON sf.SUBNO = s.SUBNO;










GO
/****** Object:  View [dqm].[q_tblimps]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dqm].[q_tblimps] as 
select  VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
from [asr_staging].[s_tblimps]
WHERE ACCOUNTNO NOT IN (SELECT ACCOUNTNO FROM [dqm].[S_TBLIMPS_ERR]);



GO
/****** Object:  View [trn].[v_etl_improvement]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [trn].[v_etl_improvement]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement table
*************************************************************************************/
AS
SELECT
   i.ACCOUNTNO AS account_no
  ,i.IMPNO AS improvement_no
  ,i.IMPCOMPLETEDPCT AS completed_percent
  ,i.IMPQUALITY AS improvement_quality
  ,i.IMPPERIMETER AS improvement_perimeter
  ,i.IMPSF AS improvement_sf
  ,i.IMPNETSF AS improvement_net_sf
  ,i.PROPERTYTYPE AS property_type
  ,i.IMPCONDITIONTYPE AS condition_type
  ,i.APPROACHTYPE AS approach_type
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(i.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPCOMPLETEDPCT), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPQUALITY), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPPERIMETER), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPSF), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(i.IMPNETSF), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(i.PROPERTYTYPE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(i.IMPCONDITIONTYPE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(i.APPROACHTYPE), 'DBNULL_TEXT')
			) AS rowhash
FROM  [dqm].[q_tblimps] i
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON i.ACCOUNTNO = v.account_no;








GO
/****** Object:  View [dqm].[q_tblimpsdetail]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dqm].[q_tblimpsdetail] as 
select -- all columns
DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDETAILTYPE, IMPDETAILDESCRIPTION, DETAILUNITCOUNT, DETAILYEARBUILT, ADDONCODE, JURISDICTIONID, APEXLINKFLAG, IMPSDETAILOT0, IMPSDETAILOT1, IMPSDETAILOM0, IMPSDETAILOM1, IMPSDETAILOD0, IMPSDETAILOD1, IMPSDETAILON0, IMPSDETAILON1, IMPSDETAILON2, WRITEDATE, SEQID, IMPDETAILTYPEID
from [asr_staging].[s_tblimpsdetail]
WHERE ACCOUNTNO NOT IN 
(SELECT ACCOUNTNO FROM [dqm].[S_TBLIMPSDETAIL_ERR]);




GO
/****** Object:  View [trn].[v_etl_improvement_detail]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [trn].[v_etl_improvement_detail]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement_detail table
*************************************************************************************/
AS
SELECT
   i.ACCOUNTNO AS account_no
  ,i.IMPNO AS improvement_no
  ,i.DETAILID AS improvement_detail_id
  ,i.IMPDETAILTYPE AS improvement_detail_type
  ,i.IMPDETAILDESCRIPTION AS improvement_detail_type_description
  ,i.DETAILUNITCOUNT AS detail_unit_count
  ,i.ADDONCODE AS addon_code
  ,c.ADDONDESCRIPTION AS addon_code_description
  ,i.DETAILYEARBUILT AS detail_built_year
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
             ISNULL(RTRIM(i.ACCOUNTNO), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.IMPNO), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.DETAILID), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.IMPDETAILTYPE), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.IMPDETAILDESCRIPTION), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.DETAILUNITCOUNT), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.ADDONCODE), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(c.ADDONDESCRIPTION), 'DBNULL_TEXT') 
           + ISNULL(RTRIM(i.DETAILYEARBUILT), 'DBNULL_TEXT') 
			) AS rowhash
FROM  [dqm].[q_tblimpsdetail] i
--LEFT OUTER JOIN [dqm].[q_tlkpimpsaddons] c
LEFT OUTER JOIN (SELECT c1.ADDONCODE, c1.ADDONDESCRIPTION FROM [asr_staging].[s_tlkpimpsaddons] c1
                 INNER JOIN [asr_staging].[etl_parameter] p
                 ON c1.TAXYEAR = p.PARAMETER_VALUE AND p.PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) c
ON i.ADDONCODE = c.ADDONCODE 
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON i.ACCOUNTNO = v.account_no;










GO
/****** Object:  View [dqm].[q_tlkpabstractcode]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dqm].[q_tlkpabstractcode] as 
select -- all columns
ABSTRACTCODE, ABSTRACTDESCRIPTION, EQUIVALENCEABSTRACTCODE, ROLLABSTRACTVALUEFLAG, VALUEGROUPCODE, ACTUALPRECISION, ACTUALMINIMUMVALUE, ASSESSEDPRECISION, ASSESSEDMINIMUMVALUE, ACTUALROUNDTYPE, ASSESSEDROUNDTYPE, USEVALUEFLAG, ADJACTUALPRECISION, ADJACTUALMINIMUMVALUE, ADJACTUALROUNDTYPE, ADJASSESSEDPRECISION, ADJASSESSEDMINIMUMVALUE, ADJASSESSEDROUNDTYPE, ADJALTACTUALPRECISION, ADJALTACTUALMINVALUE, ADJALTACTUALROUNDTYPE, ADJALTASSESSEDPRECISION, ADJALTASSESSEDMINVALUE, ADJALTASSESSEDDROUNDTYPE, ALTASSESSEDPRECISION, ALTASSESSEDMINIMUMVALUE, ALTASSESSEDROUNDTYPE, SHOWADMINFLAG, CLASSIFICATIONID, LOCALGROWTHEXEMPTFLAG, EXPORTCNTGROUPEXCLUSIONFLAG, SORTORDER, ACTIVEFLAG, LIMITTOABSTTYPE, JURISDICTIONID, LASTUPDATED, ABSTRACTCATEGORYCODE
from [asr_staging].[s_tlkpabstractcode]
where ABSTRACTCODE not in (select ABSTRACTCODE from [dqm].[s_tlkpabstractcode_err]);


GO
/****** Object:  View [dqm].[q_tlkpimpsaddons]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dqm].[q_tlkpimpsaddons] as 
select -- all columns
ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR
from [asr_staging].[s_tlkpimpsaddons]
WHERE ADDONCODE NOT IN
(SELECT ADDONCODE FROM [dqm].[S_TLKPIMPSADDONS_ERR]);



GO
/****** Object:  View [dqm].[q_tlkpimpsocctype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dqm].[q_tlkpimpsocctype] as 
select -- all columns
OCCCODE, OCCCODEDESCRIPTION, ABSTRACTCODE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED
from [asr_staging].[s_tlkpimpsocctype]
WHERE OCCCODE NOT IN 
(SELECT OCCCODE FROM [dqm].[S_TLKPIMPSOCCTYPE_ERR]);



GO
/****** Object:  View [trn].[v_etl_etl_parameter]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
-- 
*/

CREATE VIEW [trn].[v_etl_etl_parameter]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/17/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all ETL parameters
*************************************************************************************/
AS
SELECT
   PARAMETER_NAME AS parameter_name
  ,PARAMETER_VALUE AS parameter_value
  ,PARAMETER_DESCR AS parameter_description
  ,CREATE_DTM AS create_datetime
  ,CREATE_USER_ID AS create_user_id
  ,UPDATE_DTM AS update_datetime
  ,UPDATE_USER_ID AS update_user_id
FROM
    asr_staging.etl_parameter;





GO
/****** Object:  View [trn].[v_etl_land_abstract]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_land_abstract]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/29/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the land_abstract table
*************************************************************************************/
AS
SELECT 
   s.ACCOUNTNO AS account_no
  ,s.ABSTRACTCODE AS abstract_code
  ,s.DETAILID AS land_abstract_detail_id
  ,s.LANDTYPE AS land_type
  ,s.LANDACRES AS land_acres
  ,s.LANDSF AS land_sf
  ,s.LANDUNITCOUNT AS land_unit_count
  ,s.LANDVALUEPER AS land_value_per
  ,s.LANDVALUE AS land_value
  ,s.LANDOVERRIDEFLAG AS land_override_flag
  ,s.LANDOVERRIDETOTAL AS land_override_total
  ,s.LANDACTUALTOTAL AS land_actual_value
  ,s.LANDCLASS AS land_class
  ,s.LANDSUBCLASS AS land_subclass
  ,s.LANDVALUEBY AS land_valued_by
  ,s.LANDVALUEMEASURE AS land_value_measure
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(s.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.ABSTRACTCODE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.DETAILID), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDTYPE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDACRES), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDSF), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDUNITCOUNT), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDVALUEPER), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDVALUE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(s.LANDOVERRIDEFLAG), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDOVERRIDETOTAL), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDACTUALTOTAL), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDCLASS), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDSUBCLASS), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDVALUEBY), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(s.LANDVALUEMEASURE), 'DBNULL_TEXT')
			) AS rowhash 
FROM asr_staging.s_tbllandabstract s
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON s.ACCOUNTNO = v.account_no;


GO
/****** Object:  View [trn].[v_etl_tax_authority]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*
-- 
*/

CREATE VIEW [trn].[v_etl_tax_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all tax authorities
*************************************************************************************/
AS
SELECT
  ta.taxauthority AS tax_authority_no,
  ta.authorityname AS tax_authority_name,
  ta.authoritytype AS authority_type,
  ta.CONTACTPERSON AS contact_person,
  ta.CONTACTADDRESS1 AS contact_address_line_1,
  ta.CONTACTADDRESS2 AS contact_address_line_2,
  ta.CONTACTCITY AS contact_city_name,
  ta.CONTACTSTATE AS contact_state,
  ta.CONTACTZIPCODE AS contact_zip_code,
  ta.ACTIVEFLAG AS active_flag,
  GETDATE() AS create_datetime,
  SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
              ISNULL(RTRIM(ta.taxauthority), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.authorityname), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.authoritytype), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.CONTACTPERSON), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.CONTACTADDRESS1), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.CONTACTADDRESS2), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.CONTACTCITY), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.CONTACTSTATE), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.CONTACTZIPCODE), 'DBNULL_TEXT')
            + ISNULL(RTRIM(ta.ACTIVEFLAG), 'DBNULL_TEXT')
            ) AS rowhash 
FROM
    asr_staging.s_tlkptaxauthority ta







GO
/****** Object:  View [trn].[v_etl_tax_district]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
-- 
*/

CREATE VIEW [trn].[v_etl_tax_district]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all tax districts
*************************************************************************************/
AS
SELECT
  td.taxdistrict AS tax_district_no,
  td.taxdistrictname AS tax_district_name,
  GETDATE() AS create_datetime,
  SUSER_NAME() AS create_user_id
FROM
    asr_staging.s_tlkptaxdistrict td 




GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-CITY]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-CITY] ON [asr_staging].[s_tbladdresssecure]
(
	[CITY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE] ON [asr_staging].[s_tbladdresssecure]
(
	[STATECODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE] ON [asr_staging].[s_tbladdresssecure]
(
	[ZIPCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ix_tbladdresssecure]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [ix_tbladdresssecure] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESSCODE] ASC,
	[PERSONCODE] ASC
)
INCLUDE ( 	[ADDRESS1],
	[ADDRESS2],
	[CITY],
	[STATECODE],
	[ZIPCODE],
	[COUNTRY]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tblimpsbltas_ACCOUNTNO]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_ACCOUNTNO] ON [asr_staging].[s_tblimpsbltas]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_s_tblimpsbltas_IMPNO]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_IMPNO] ON [asr_staging].[s_tblimpsbltas]
(
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_s_tblimpsocc_impno]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tblimpsocc_impno] ON [asr_staging].[s_tblimpsocc]
(
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tblpersonsecure_NonClusteredIndex-NAME1]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tblpersonsecure_NonClusteredIndex-NAME2]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ix_tblpersonsecure]    Script Date: 4/14/2016 11:01:38 AM ******/
CREATE NONCLUSTERED INDEX [ix_tblpersonsecure] ON [asr_staging].[s_tblpersonsecure]
(
	[PERSONCODE] ASC
)
INCLUDE ( 	[NAME1],
	[NAME2],
	[FEDERALIDNO]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dqm].[s_tblacct_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblacctnbhd_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblacctpropertyaddress_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblacctreal_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tbladdresssecure_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblimps_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblimpsbltas_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblimpsdetail_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblimpsocc_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblpersonsecure_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblsale_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblsaleacct_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblsubaccount_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tbnsubfiling_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tmaptaxauthoritydetailfund_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tmaptaxdistrictauthority_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
/****** Object:  StoredProcedure [asr_staging].[select_count_dqm_err_tables]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [asr_staging].[select_count_dqm_err_tables]
as
begin

select count(*) from dqm.s_tblacct_err;
select count(*) from dqm.s_tblacctnbhd_err;
select count(*) from dqm.s_tblacctowneraddress_err;
select count(*) from dqm.s_tblacctpropertyaddress_err;
select count(*) from dqm.s_tblacctreal_err;
select count(*) from dqm.s_tbladdresssecure_err;
select count(*) from dqm.s_tblimps_err;
select count(*) from dqm.s_tblimpsbltas_err;
select count(*) from dqm.s_tblimpsdetail_err;
select count(*) from dqm.s_tblimpsocc_err;
select count(*) from dqm.s_tblpersonsecure_err;
select count(*) from dqm.s_tblsale_err;
select count(*) from dqm.s_tblsaleacct_err;
select count(*) from dqm.s_tblsubaccount_err;
select count(*) from dqm.s_tbnsubfiling_err;
select count(*) from dqm.s_tlkpabstractcode_err;
select count(*) from dqm.s_tlkpimpsaddons_err;
select count(*) from dqm.s_tlkpimpsocctype_err;
select count(*) from dqm.s_tlkpleatype_err;
select count(*) from dqm.s_tmaptaxauthoritydetailfund_err;
select count(*) from dqm.s_tmaptaxdistrictauthority_err;

end;



GO
/****** Object:  StoredProcedure [asr_staging].[select_count_staging_tables]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [asr_staging].[select_count_staging_tables]
as
begin

select count(*) from asr_staging.s_account_location;

select count(*) from asr_staging.s_tblacct;
select count(*) from asr_staging.s_tblacctlegal;
select count(*) from asr_staging.s_tblacctnbhd;
select count(*) from asr_staging.s_tblacctowneraddress;
select count(*) from asr_staging.s_tblacctpropertyaddress;
select count(*) from asr_staging.s_tblacctreal;
select count(*) from asr_staging.s_tbladdresssecure;
select count(*) from asr_staging.s_tblimps;
select count(*) from asr_staging.s_tblimpsbltas;
select count(*) from asr_staging.s_tblimpsdetail;
select count(*) from asr_staging.s_tblimpsocc;
select count(*) from asr_staging.s_tbllandabstract;
select count(*) from asr_staging.s_tblpersonsecure;
select count(*) from asr_staging.s_tblsale;
select count(*) from asr_staging.s_tblsaleacct;
select count(*) from asr_staging.s_tblsubaccount;

select count(*) from asr_staging.s_tbnsubdivision;
select count(*) from asr_staging.s_tbnsubfiling;
select count(*) from asr_staging.s_tlkpabstractcode;
select count(*) from asr_staging.s_tlkpaccttype;
select count(*) from asr_staging.s_tlkpdeedtype;
select count(*) from asr_staging.s_tlkpimpsaddons;
select count(*) from asr_staging.s_tlkpimpsbltastype;
select count(*) from asr_staging.s_tlkpimpscomclasstype;
select count(*) from asr_staging.s_tlkpimpsocctype;
select count(*) from asr_staging.s_tlkpleatype;
select count(*) from asr_staging.s_tlkpsaleexclude;
select count(*) from asr_staging.s_tlkpstatusacct;
select count(*) from asr_staging.s_tlkptaxauthority;
select count(*) from asr_staging.s_tlkptaxauthoritydetail;
select count(*) from asr_staging.s_tlkptaxdistrict;
select count(*) from asr_staging.s_tlkptaxfund;
select count(*) from asr_staging.s_tlkpzoning;

select count(*) from asr_staging.s_tmaptaxauthoritydetailfund;
select count(*) from asr_staging.s_tmaptaxdistrictauthority;
select count(*) from asr_staging.s_tsylevytype;




end;


GO
/****** Object:  StoredProcedure [asr_staging].[trunc_dqm_err_tables]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [asr_staging].[trunc_dqm_err_tables]
as
begin

truncate table dqm.s_tblacct_err;
truncate table dqm.s_tblacctnbhd_err;
truncate table dqm.s_tblacctowneraddress_err;
truncate table dqm.s_tblacctpropertyaddress_err;
truncate table dqm.s_tblacctreal_err;
truncate table dqm.s_tbladdresssecure_err;
truncate table dqm.s_tblimps_err;
truncate table dqm.s_tblimpsbltas_err;
truncate table dqm.s_tblimpsdetail_err;
truncate table dqm.s_tblimpsocc_err;
truncate table dqm.s_tblpersonsecure_err;
truncate table dqm.s_tblsale_err;
truncate table dqm.s_tblsaleacct_err;
truncate table dqm.s_tblsubaccount_err;
truncate table dqm.s_tbnsubfiling_err;
truncate table dqm.s_tlkpabstractcode_err;
truncate table dqm.s_tlkpimpsaddons_err;
truncate table dqm.s_tlkpimpsocctype_err;
truncate table dqm.s_tlkpleatype_err;
truncate table dqm.s_tmaptaxauthoritydetailfund_err;
truncate table dqm.s_tmaptaxdistrictauthority_err;


end




GO
/****** Object:  StoredProcedure [asr_staging].[trunc_staging_tables]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [asr_staging].[trunc_staging_tables]
as
begin

truncate table asr_staging.s_account_location;

truncate table asr_staging.s_tblacct;
truncate table asr_staging.s_tblacctlegal;
truncate table asr_staging.s_tblacctnbhd;
truncate table asr_staging.s_tblacctowneraddress;
truncate table asr_staging.s_tblacctpropertyaddress;
truncate table asr_staging.s_tblacctreal;
truncate table asr_staging.s_tbladdresssecure;
truncate table asr_staging.s_tblimps;
truncate table asr_staging.s_tblimpsbltas;
truncate table asr_staging.s_tblimpsdetail;
truncate table asr_staging.s_tblimpsocc;
truncate table asr_staging.s_tbllandabstract;
truncate table asr_staging.s_tblpersonsecure;
truncate table asr_staging.s_tblsale;
truncate table asr_staging.s_tblsaleacct;
truncate table asr_staging.s_tblsubaccount;

truncate table asr_staging.s_tbnsubdivision;
truncate table asr_staging.s_tbnsubfiling;
truncate table asr_staging.s_tlkpabstractcode;
truncate table asr_staging.s_tlkpaccttype;
truncate table asr_staging.s_tlkpdeedtype;
truncate table asr_staging.s_tlkpimpsaddons;
truncate table asr_staging.s_tlkpimpsbltastype;
truncate table asr_staging.s_tlkpimpscomclasstype;
truncate table asr_staging.s_tlkpimpsocctype;
truncate table asr_staging.s_tlkpleatype;
truncate table asr_staging.s_tlkpsaleexclude;
truncate table asr_staging.s_tlkpstatusacct;
truncate table asr_staging.s_tlkptaxauthority;
truncate table asr_staging.s_tlkptaxauthoritydetail;
truncate table asr_staging.s_tlkptaxdistrict;
truncate table asr_staging.s_tlkptaxfund;
truncate table asr_staging.s_tlkpzoning;

truncate table asr_staging.s_tmaptaxauthoritydetailfund;
truncate table asr_staging.s_tmaptaxdistrictauthority;
truncate table asr_staging.s_tsylevytype;



end



GO
/****** Object:  StoredProcedure [asr_staging].[update_etl_parameter_table]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ======================================================================================
-- Author:		David Guillen
-- Create date: 1/28/2016
-- Description:	udpate etl parameter table extract version start and end date
-- =====================================================================================

CREATE PROCEDURE [asr_staging].[update_etl_parameter_table]
	
	
AS
BEGIN

	DECLARE @v_ext_date_as_text  VARCHAR(12)

    SELECT @v_ext_date_as_text = CAST(YEAR(GETDATE()) AS VARCHAR)+RIGHT('0' + RTRIM(MONTH(getdate())), 2)+RIGHT('0' + RTRIM(DAY(getdate())), 2)+'999'


    UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE'
	UPDATE [asr_staging].[etl_parameter] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE'


END




GO
/****** Object:  StoredProcedure [dqm].[create_dqm_indexes]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dqm].[create_dqm_indexes]
as
begin

-- indexes for s_tblacct

CREATE CLUSTERED INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 


-- indexes for s_tblacctpropertyaddress


CREATE CLUSTERED INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tbladdresssecure


CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-CITY] ON [asr_staging].[s_tbladdresssecure]
(
	[CITY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE] ON [asr_staging].[s_tbladdresssecure]
(
	[STATECODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE] ON [asr_staging].[s_tbladdresssecure]
(
	[ZIPCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


CREATE NONCLUSTERED INDEX [ix_tbladdresssecure] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESSCODE] ASC,
	[PERSONCODE] ASC
)
INCLUDE ( 	[ADDRESS1],
	[ADDRESS2],
	[CITY],
	[STATECODE],
	[ZIPCODE],
	[COUNTRY]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimps

CREATE CLUSTERED INDEX [s_tblimps_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimps]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimpsbltas

CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_ACCOUNTNO] ON [asr_staging].[s_tblimpsbltas]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_IMPNO] ON [asr_staging].[s_tblimpsbltas]
(
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimpsdetail

CREATE CLUSTERED INDEX [s_tblimpsdetail_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsdetail]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimpsocc

CREATE CLUSTERED INDEX [s_tblimpsocc_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsocc]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

CREATE NONCLUSTERED INDEX [IX_s_tblimpsocc_impno] ON [asr_staging].[s_tblimpsocc]
(
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


-- indexes for 

CREATE CLUSTERED INDEX [s_tbllandabstract_ClusteredIndex-accountno] ON [asr_staging].[s_tbllandabstract]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblpersecure

CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


CREATE NONCLUSTERED INDEX [ix_tblpersonsecure] ON [asr_staging].[s_tblpersonsecure]
(
	[PERSONCODE] ASC
)
INCLUDE ( 	[NAME1],
	[NAME2],
	[FEDERALIDNO]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblsale

CREATE CLUSTERED INDEX [s_tblsale_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsale]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblsaleacct

CREATE CLUSTERED INDEX [s_tblsaleacct_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsaleacct]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblsubaccount


CREATE CLUSTERED INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 




end






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacct]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- ===============================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblacct
-- ===============================================


/*
DQM RULES FOR:
TABLE:  S_TBLACCT

1.	ACCOUNTNO must be in a specific format
	the first character must be one of the following: R M P C
	the second through eighth character must be a number >=0 and <=9

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacct]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	
	-- ACCOUNTNO must be in the format ^[RMPC]{1}[0-9]{7}$

	INSERT INTO [dqm].[s_tblacct_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PARCELNO, LOCALNO, MAPNO, ACCTSTATUSCODE, ACCTTYPE, ASSIGNEDTO, VALUEAREACODE, ASSOCIATEDACCT, APPRAISALTYPE, ECONOMICAREACODE, ACCTDATECREATED, DEFAULTAPPROACHTYPE, DEFAULTTAXDISTRICT, BUSINESSLICENSE, MAPGROUP, CONTROLMAP, PROPERTYIDENTIFIER, SPECIALINTERESTNUMBER, ACCTON0, ACCTON1, ACCTON2, PRIMARYUSECODE, WARD, ACCTOD0, ACCTOD1, ACCTOM0, ACCTOM1, STRIPPEDACCOUNTNO, JURISDICTIONID, ACCTOT0, ACCTOT1, WRITEDATE, CENSUSTRACT, CENSUSBLOCK, MOBILEHOMESPACE, EFILEFLAG, BUSINESSNAME, COSTHYBRIDPERCENT, MARKETHYBRIDPERCENT, INCOMEHYBRIDPERCENT, RECONCILEDHYBRIDPERCENT, PARCELSEQUENCE, PROPERTYCLASSID, SEQID, DETAILEDREVIEWDATE)
	    SELECT 
				'ACCOUNTNO',
				'ACCOUNTNO MUST BE IN A SPECIFIED FORMAT',
				'ACCOUNT NUMBER MUST BE IN FORMAT -- [RMPC]{1}[0-9]{7}',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PARCELNO, LOCALNO, MAPNO, ACCTSTATUSCODE, ACCTTYPE, ASSIGNEDTO, VALUEAREACODE, ASSOCIATEDACCT, APPRAISALTYPE, ECONOMICAREACODE, ACCTDATECREATED, DEFAULTAPPROACHTYPE, DEFAULTTAXDISTRICT, BUSINESSLICENSE, MAPGROUP, CONTROLMAP, PROPERTYIDENTIFIER, SPECIALINTERESTNUMBER, ACCTON0, ACCTON1, ACCTON2, PRIMARYUSECODE, WARD, ACCTOD0, ACCTOD1, ACCTOM0, ACCTOM1, STRIPPEDACCOUNTNO, JURISDICTIONID, ACCTOT0, ACCTOT1, WRITEDATE, CENSUSTRACT, CENSUSBLOCK, MOBILEHOMESPACE, EFILEFLAG, BUSINESSNAME, COSTHYBRIDPERCENT, MARKETHYBRIDPERCENT, INCOMEHYBRIDPERCENT, RECONCILEDHYBRIDPERCENT, PARCELSEQUENCE, PROPERTYCLASSID, SEQID, DETAILEDREVIEWDATE
			FROM [asr_staging].[S_TBLACCT]
			WHERE substring(ACCOUNTNO,1,1) not in ('R','M','P','C')
			  or cast(substring(ACCOUNTNO,2,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,3,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,4,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
		      or cast(substring(ACCOUNTNO,5,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,6,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,7,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')
			  or cast(substring(ACCOUNTNO,8,1) as varchar(1)) not in ('0','1','2','3','4','5','6','7','8','9')

--------------------------------------------------------------------------------
	END 

END









GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacct_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacct DQM rules
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLACCT

1.	ACCOUNTNO must be in a specific format
	the first character must be one of the following: R M P C
	the second through eighth character must be a number >=0 and <=9

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacct_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCT'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacct]
	TRUNCATE TABLE [dqm].[s_tblacct_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process
	

	-- ACCOUNTNO must be in the format ^[RMPC]{1}[0-9]{7}$	

	INSERT INTO [asr_staging].[s_tblacct]
		( 
		ACCOUNTNO
		)	
			VALUES 
				(
				'f3920123'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'RR920123'
				);


	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R9R20123'
				);


	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R92R0123'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R920R123'
				);


	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R9201R23'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R92012R3'
				);

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R920123R'
				);

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacct]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacct])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacct_err])

select @ROW_COUNT_DIFF = @COUNT_TABLE - @COUNT_ERR_TABLE

delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO must be in a specific format');





	 



 

END






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctnbhd]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- ===================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblacctnbhd
-- ===================================================


/*
DQM RULES FOR:
TABLE:  tblacctnbhd

1.	Fields accountno + nbhdcode + proptype + nbhdext have to be unique and can not be null 

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctnbhd]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	
	-- ACCOUNTNO – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'FIELD CANNOT BE NULL',
				'ACCOUNTNO CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE ACCOUNTNO IS NULL
			 OR ACCOUNTNO = '';

--------------------------------------------------------------------------------

	-- NBHDCODE – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'NBHDCODE',
				'FIELD CANNOT BE NULL',
				'NBHD CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE NBHDCODE IS NULL
			OR NBHDCODE = '';

------------------------------------------------------------------------------

	-- PROPERTYTYPE – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'PROPERTYTYPE',
				'FIELD CANNOT BE NULL',
				'PROPERTYTYPE CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE PROPERTYTYPE IS NULL
			OR PROPERTYTYPE = '';

-------------------------------------------------------------------------------

	-- NBHDEXTENSION – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'NBHDEXTENSION',
				'FIELD CANNOT BE NULL',
				'NBHDEXT CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctnbhd]
			WHERE NBHDEXTENSION IS NULL
			OR NBHDEXTENSION = '';

-------------------------------------------------------------------------------

	-- The combination of ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION  FROM [asr_staging].[s_tblacctnbhd] GROUP BY ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblacctnbhd_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, NBHDCODE, NBHDEXTENSION, PROPERTYTYPE, NBHDADJUSTMENTVALUE, ACCTNBHDON0, ACCTNBHDON1, ACCTNBHDON2, ACCTNBHDOD0, ACCTNBHDOD1, ACCTNBHDOM0, ACCTNBHDOM1, ACCTNBHDOT0, ACCTNBHDOT1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION',
				'COMBINATION OF FOUR FIELDS MUST BE UNIQUE',
				'ACCOUNTNO, PROPERTYTYPE, NBHDCODE, NBHDEXTENSION MUST BE UNIQUE', 
				@lv_RUNTIME, 
				VERSTART, VEREND, n.ACCOUNTNO, n.NBHDCODE, n.NBHDEXTENSION, n.PROPERTYTYPE, n.NBHDADJUSTMENTVALUE, n.ACCTNBHDON0, n.ACCTNBHDON1, n.ACCTNBHDON2, n.ACCTNBHDOD0, n.ACCTNBHDOD1, n.ACCTNBHDOM0, n.ACCTNBHDOM1, n.ACCTNBHDOT0, n.ACCTNBHDOT1, n.JURISDICTIONID,n. WRITEDATE, n.SEQID
			FROM [asr_staging].[s_tblacctnbhd] n
			INNER JOIN DUPE_VALUES DV 
			ON n.ACCOUNTNO = DV.ACCOUNTNO
			and n.PROPERTYTYPE = DV.PROPERTYTYPE
			and n.NBHDCODE = DV.NBHDCODE
			and n.NBHDEXTENSION = DV.NBHDEXTENSION;


--------------------------------------------------------------------------------


	END 

END










GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctnbhd_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacctnbhd DQM rules
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblacctnbhd

1.	Fields accountno + nbhd + proptype + nbhdext have to be unique and can not be null 


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctnbhd_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTNBHD'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctnbhd]
	TRUNCATE TABLE [dqm].[s_tblacctnbhd_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process
	
	-- Fields accountno + nbhd + proptype + nbhdext have to be unique and can not be null 
		
	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		ACCOUNTNO
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		ACCOUNTNO
		)	
			VALUES 
				(
				''
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDCODE
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDCODE
		)	
			VALUES 
				(
				''
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		PROPERTYTYPE
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		PROPERTYTYPE
		)	
			VALUES 
				(
				''
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDEXTENSION
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		( 
		NBHDEXTENSION
		)	
			VALUES 
				(
				''
				);


	INSERT INTO [asr_staging].[s_tblacctnbhd]
		(
		ACCOUNTNO,NBHDCODE,PROPERTYTYPE,NBHDEXTENSION
		)	
			VALUES 
				(
				'R1234567','NBHDCODE','PROPTYPE','NBHDEXT'
				);

	INSERT INTO [asr_staging].[s_tblacctnbhd]
		(
		ACCOUNTNO,NBHDCODE,PROPERTYTYPE, NBHDEXTENSION
		)	
			VALUES 
				(
				'R1234567','NBHDCODE','PROPTYPE','NBHDEXT'
				);

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacctnbhd]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctnbhd])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctnbhd_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 24 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO,NBHDCODE,PROPERTYTYPE,and NBHDEXTENSION must not be NULL. Combination of ACCOUNTNO,NBHDCODE,PROPERTYTYPE,NBHDEXTENSION must be unique.');





	 



 

END






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctowneraddress]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =================================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblacctowneraddress table
-- =================================================================


/*
DQM RULES FOR:
TABLE:  tblacctowneraddress

1.	PRIMARYOWNERFLAG must be 0 or -1 or 1

2.	ACCOUNTNO must exist in the account table			

3.	PERSONCODE must exist in the person table lookup

4.	ADDRESSCODE must exist in the address table


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctowneraddress]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	-- PRIMARYOWNERFLAG must be 0 or -1 or 1
	
	INSERT INTO [dqm].[s_tblacctowneraddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE)
	    SELECT 
				'PRIMARYOWNERFLAG',
				'VALUE MUST BE -1 or 0 or 1',
				'PRIMARYOWNERFLAG must be -1, 0, or 1',
				--getdate(),
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE
			FROM [asr_staging].[s_tblacctowneraddress]
			WHERE primaryownerflag not in(-1,0,1)



----------------------------------------------------------------------------------

	-- ACCOUNTNO must exist in the account table

	
	INSERT INTO [dqm].[s_tblacctowneraddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE)
	    SELECT 
				'ACCOUNTNO',
				'FOREIGN KEY CHECK',
				'ACCOUNTNO MUST BE IN s_tblacct',
				getdate(),
				--@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE
			FROM [asr_staging].[s_tblacctowneraddress] addr
			WHERE not exists
			(SELECT 1 FROM [asr_staging].[s_tblacct] a 
			 WHERE a.ACCOUNTNO = addr.ACCOUNTNO)


----------------------------------------------------------------------------------

	-- PERSONCODE must exist in the person table lookup

	INSERT INTO [dqm].[s_tblacctowneraddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE)
	    SELECT 
				'PERSONCODE',
				'FOREIGN KEY CHECK',
				'PERSONCODE MUST BE IN s_tblacctowneraddress',
				getdate(),
				--@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE
			FROM [asr_staging].[s_tblacctowneraddress] addr
			WHERE not exists
			(SELECT 1 FROM [asr_staging].[s_tblpersonsecure] p 
			 WHERE p.PERSONCODE = addr.PERSONCODE)


--------------------------------------------------------------------------------

	-- ADDRESSCODE must exist in the address table

	INSERT INTO [dqm].[s_tblacctowneraddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE)
	    SELECT 
				'ADDRESSCODE',
				'FOREIGN KEY CHECK',
				'ADDRESSCODE MUST BE IN s_tbladdresssecure',
				getdate(),
				--@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE
			FROM [asr_staging].[s_tblacctowneraddress] addr
			WHERE not exists
			(SELECT 1 FROM [asr_staging].[s_tbladdresssecure] a
			 WHERE a.ADDRESSCODE = addr.ADDRESSCODE)
			-- AND primaryownerflag = 1


--------------------------------------------------------------------------------


	END 

END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctowneraddress_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacctowneraddress DQM rules
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblacctowneraddress

TABLE:  tblacctowneraddress

1.	PRIMARYOWNERFLAG must be 0 or -1 or 1

2.	ACCOUNTNO must exist in the account table

3.	PERSONCODE must exist in the person table lookup

4.	ADDRESSCODE must exist in the address table


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctowneraddress_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTOWNERADDRESS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctowneraddress]
	TRUNCATE TABLE [dqm].[s_tblacctowneraddress_err]
	TRUNCATE TABLE [asr_staging].[s_tblacct]			-- for FK check
	TRUNCATE TABLE [asr_staging].[s_tblpersonsecure]	-- for FK check
	TRUNCATE TABLE [asr_staging].[s_tbladdresssecure]	-- for FK check		

	

----------------------------------------------------------------------------------

	-- PRIMARYOWNERFLAG must be 0 or -1 or 1

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		PRIMARYOWNERFLAG
		)	
			VALUES 
				(
				2
				);

	-- ACCOUNTNO must exist in the account table

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R1234567'
				);

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'TESTACCT'
				);


	-- PERSONCODE must exist in the person table lookup

	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE
		)	
			VALUES 
				(
				123456
				);

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				999999
				);

	-- ADDRESSCODE must exist in the address table

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				123456
				);

	INSERT INTO [asr_staging].[s_tblacctowneraddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				999999
				);
	
	
   

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacctowneraddress]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctowneraddress])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctowneraddress_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 9 then 'PASS' else 'FAIL' end,getdate(),'Primary owner not null and equal to -1 0 or 1, FK checks on accountno, personcode, and addresscode');


END






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctpropertyaddress]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ====================================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblacctpropertyaddress table
-- ====================================================================


/*
DQM RULES FOR:
TABLE:  tblacctpropertyaddress

ACCOUNTNO must exist in the account table

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctpropertyaddress]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

	-- Begin DQM checks for the table for each row.

	-- ACCOUNTNO must exist in the account table

	INSERT INTO [dqm].[s_tblacctpropertyaddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, BUILDINGID, PREDIRECTION, STREETNO, UNITNAME, POSTDIRECTION, STREETTYPE, STREETNAME, PROPERTYZIPCODE, PROPERTYCITY, ORDERNO, ACCTPROPERTYADDRESSON0, ACCTPROPERTYADDRESSON1, ACCTPROPERTYADDRESSON2, BUSINESSNAME, ACCTPROPERTYADDRESSOD0, ACCTPROPERTYADDRESSOD1, ACCTPROPERTYADDRESSOM0, ACCTPROPERTYADDRESSOM1, ACCTPROPERTYADDRESSOT0, ACCTPROPERTYADDRESSOT1, JURISDICTIONID, PROPERTYADDRESSCODE, WRITEDATE, LOCATIONID, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'FIELD MUST EXIST IN PARENT TABLE',
				'ACCOUNTNO MUST EXIST IN S_TBLACCTPP',
				--getdate(),
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, BUILDINGID, PREDIRECTION, STREETNO, UNITNAME, POSTDIRECTION, STREETTYPE, STREETNAME, PROPERTYZIPCODE, PROPERTYCITY, ORDERNO, ACCTPROPERTYADDRESSON0, ACCTPROPERTYADDRESSON1, ACCTPROPERTYADDRESSON2, BUSINESSNAME, ACCTPROPERTYADDRESSOD0, ACCTPROPERTYADDRESSOD1, ACCTPROPERTYADDRESSOM0, ACCTPROPERTYADDRESSOM1, ACCTPROPERTYADDRESSOT0, ACCTPROPERTYADDRESSOT1, JURISDICTIONID, PROPERTYADDRESSCODE, WRITEDATE, LOCATIONID, SEQID
			FROM [asr_staging].[s_tblacctpropertyaddress]
			WHERE accountno not in (select accountno from [asr_staging].[s_tblacct])


	END	

END









GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctpropertyaddress_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tblacctpropertyaddress DQM rule
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblacctpropertyaddress

ACCOUNTNO must exist in the account table

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctpropertyaddress_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTPROPERTYADDRESS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctpropertyaddress]
	TRUNCATE TABLE [dqm].[s_tblacctpropertyaddress_err]
	TRUNCATE TABLE [asr_staging].[s_tblacct]				-- for FK check		

	

----------------------------------------------------------------------------------

	-- ACCOUNTNO must exist in the account table

	INSERT INTO [asr_staging].[s_tblacct]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R1234567'
				);

	INSERT INTO [asr_staging].[s_tblacctpropertyaddress]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'TESTACCT'
				);

	
	
   

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblacctpropertyaddress]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctpropertyaddress])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctpropertyaddress_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO must exist in the account table');


END






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctreal]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for s_tblacctreal
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  tblacctreal



IS_0_OR_POSITIVE_NUMBER_1	vacantflag needs to be 0 or 1
IS_0_OR_POSITIVE_NUMBER		imponlyflag needs to be 0 or 1

*/


CREATE PROCEDURE [dqm].[dqm_s_tblacctreal]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	
	INSERT INTO [dqm].[s_tblacctreal_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPONLYFLAG, TIFFLAG, VACANTFLAG, LANDWIDTH, LANDDEPTH, LANDEASEMENTSF, LANDEXCESSSF, TRAFFICCOUNT, PARKINGSPACES, ZONINGCODE, FLOODFRINGE, FLOODWAY, TAPFEE, PLATTEDFLAG, LANDCERTIFICATIONCODE, LANDAPPRAISER, LANDAPPRAISALDATE, LANDOVERRIDESIZEADJ, LANDSIZEADJ, LANDGROSSSF, LANDGROSSACRES, LANDGROSSFF, LANDGROSSUNITCOUNT, ACCTREALON0, ACCTREALON1, ACCTREALON2, ACCTREALOD0, ACCTREALOD1, ACCTREALOM0, ACCTREALOM1, ACCTREALOT0, ACCTREALOT1, JURISDICTIONID, DEFAULTLEA, TOTALACCTIMPINTERESTPCT, TOTALACCTLANDINTERESTPCT, WRITEDATE, SEQID)
	    SELECT 
				'VACANTFLAG',
				'FIELD MUST BE 1 OR 0',
				'VACANTFLAG MUST BE 1 OR 0',
				--getdate(),
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, IMPONLYFLAG, TIFFLAG, VACANTFLAG, LANDWIDTH, LANDDEPTH, LANDEASEMENTSF, LANDEXCESSSF, TRAFFICCOUNT, PARKINGSPACES, ZONINGCODE, FLOODFRINGE, FLOODWAY, TAPFEE, PLATTEDFLAG, LANDCERTIFICATIONCODE, LANDAPPRAISER, LANDAPPRAISALDATE, LANDOVERRIDESIZEADJ, LANDSIZEADJ, LANDGROSSSF, LANDGROSSACRES, LANDGROSSFF, LANDGROSSUNITCOUNT, ACCTREALON0, ACCTREALON1, ACCTREALON2, ACCTREALOD0, ACCTREALOD1, ACCTREALOM0, ACCTREALOM1, ACCTREALOT0, ACCTREALOT1, JURISDICTIONID, DEFAULTLEA, TOTALACCTIMPINTERESTPCT, TOTALACCTLANDINTERESTPCT, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctreal]
			WHERE vacantflag not in (0,1) 


----------------------------------------------------------------------------------

	
	INSERT INTO [dqm].[s_tblacctreal_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPONLYFLAG, TIFFLAG, VACANTFLAG, LANDWIDTH, LANDDEPTH, LANDEASEMENTSF, LANDEXCESSSF, TRAFFICCOUNT, PARKINGSPACES, ZONINGCODE, FLOODFRINGE, FLOODWAY, TAPFEE, PLATTEDFLAG, LANDCERTIFICATIONCODE, LANDAPPRAISER, LANDAPPRAISALDATE, LANDOVERRIDESIZEADJ, LANDSIZEADJ, LANDGROSSSF, LANDGROSSACRES, LANDGROSSFF, LANDGROSSUNITCOUNT, ACCTREALON0, ACCTREALON1, ACCTREALON2, ACCTREALOD0, ACCTREALOD1, ACCTREALOM0, ACCTREALOM1, ACCTREALOT0, ACCTREALOT1, JURISDICTIONID, DEFAULTLEA, TOTALACCTIMPINTERESTPCT, TOTALACCTLANDINTERESTPCT, WRITEDATE, SEQID)
	    SELECT 
				'IMPONLYFLAG',
				'FIELD MUST BE 1 OR 0',
				'IMPONLYFLAG MUST BE 1 OR 0',
				--getdate(),
				@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, IMPONLYFLAG, TIFFLAG, VACANTFLAG, LANDWIDTH, LANDDEPTH, LANDEASEMENTSF, LANDEXCESSSF, TRAFFICCOUNT, PARKINGSPACES, ZONINGCODE, FLOODFRINGE, FLOODWAY, TAPFEE, PLATTEDFLAG, LANDCERTIFICATIONCODE, LANDAPPRAISER, LANDAPPRAISALDATE, LANDOVERRIDESIZEADJ, LANDSIZEADJ, LANDGROSSSF, LANDGROSSACRES, LANDGROSSFF, LANDGROSSUNITCOUNT, ACCTREALON0, ACCTREALON1, ACCTREALON2, ACCTREALOD0, ACCTREALOD1, ACCTREALOM0, ACCTREALOM1, ACCTREALOT0, ACCTREALOT1, JURISDICTIONID, DEFAULTLEA, TOTALACCTIMPINTERESTPCT, TOTALACCTLANDINTERESTPCT, WRITEDATE, SEQID
			FROM [asr_staging].[s_tblacctreal]
			WHERE imponlyflag not in (0,1) 


----------------------------------------------------------------------------------

	END	

END








GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctreal_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for s_tblacctreal
-- =====================================================================================


/*
DQM RULES FOR:

1.	VACANTFLAG must be 0 or 1
2.	IMPONLYFLAG must be 0 or 1


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctreal_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLACCTREAL'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblacctreal]
	TRUNCATE TABLE [dqm].[s_tblacctreal_err]

----------------------------------------------------------------------------------


	
	INSERT INTO [asr_staging].[s_tblacctreal]
		(
		VACANTFLAG
		)	
			VALUES 
				(
				2
				);

	
	INSERT INTO [asr_staging].[s_tblacctreal]
		(
		IMPONLYFLAG
		)	
			VALUES 
				(
				3
				);

	

--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblacctreal]

--------------------------------------------------------------------------------
-- compare record counts 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblacctreal])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblacctreal_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'VACANTFLAG and IMPONLYFLAG must be 0 or 1');




END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbladdresssecure]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==============================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tbladdresssecure table
-- ==============================================================


/*
DQM RULES FOR:
TABLE:  tbladdresssecure

1.	ADDRESSCODE must be unique and can not be null

2.	ADDRESS1 must not contain '|' or non printable characters

3.	ADDRESS2 must not contain '|' or non printable characters

4.	CITY must not contain '|' or non printable characters

5.	STATECODE must not contain '|' or non printable characters

6.	ZIPCODE must not contain '|' or non printable characters

7.	STATECODE must be 2 characters long

*/

CREATE PROCEDURE [dqm].[dqm_s_tbladdresssecure]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.


----------------------------------------------------------------------------------

	-- ADDRESSCODE must be unique and can not be null
	
	INSERT INTO [dqm].[s_tbladdresssecure_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
	    SELECT 
				'ADDRESSCODE',
				'FIELD CANNOT BE NULL',
				'ADDRESSCODE CANNOT BE NULL',
				--getdate(),
				@lv_RUNTIME,
				VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
			FROM  [asr_staging].[s_tbladdresssecure]
			WHERE addresscode is NULL;



    WITH DUPE_VALUES AS (SELECT distinct ADDRESSCODE  FROM [asr_staging].[s_tbladdresssecure] GROUP BY ADDRESSCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tbladdresssecure_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
	    SELECT 
					'ADDRESSCODE',
					'FIELD MUST BE UNIQUE',
					'ADDRESSCODE MUST BE UNIQUE',
					--getdate(),
					@lv_RUNTIME,
					VERSTART, VEREND, aa.ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
				FROM [asr_staging].[s_tbladdresssecure] aa
			INNER JOIN DUPE_VALUES DV 
			ON aa.ADDRESSCODE = DV.ADDRESSCODE
			;


----------------------------------------------------------------------------------

	-- ADDRESS1 must not contain '|' or non printable characters


	-- DECLARE variables for use in the next several DQM checks

	DECLARE @tablename VARCHAR(1000) ='asr_staging.s_tbladdresssecure'
	DECLARE @columnname VARCHAR(100)='ADDRESS1'
	DECLARE @counter INT = 0
	DECLARE @sql VARCHAR(MAX)


	-- create two temp tables for use in the next several DQM checks

	create table #tempBADCHAR1
	(BADCHAR varchar(MAX));

	create table #tempBADCHAR2
	(BADCHAR varchar(MAX));



	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2
	
	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;

	

	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124
	

	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;



	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err

		INSERT INTO [dqm].[s_tbladdresssecure_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
			SELECT 
					'ADDRESS1',
					'FIELD CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
					'ADDRESS1 CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
					--getdate(),
					@lv_RUNTIME,
					VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
				FROM [asr_staging].[s_tbladdresssecure] a
				JOIN #tempBADCHAR2 t
				on a.ADDRESS1 = t.BADCHAR
				

	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2
	
		 

----------------------------------------------------------------------------------

	-- ADDRESS2 must not contain '|' or non printable characters

	-- SET @columnname to ADDRESS2 table
	-- SET @counter to 0

	SET @columnname='ADDRESS2'
	SET @counter = 0
	

	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;

	

	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1



	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124
	
	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END


	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1
	


	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;
		
		
		
	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err		
		
	INSERT INTO [dqm].[s_tbladdresssecure_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'ADDRESS2',
						'FIELD CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
						'ADDRESS2 CANNOT CONTAIN | OR ANY NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure] a
					JOIN #tempBADCHAR2 t
					on a.ADDRESS2 = t.BADCHAR


	
	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2




----------------------------------------------------------------------------------
	
	-- CITY must not contain '|' or non printable characters
	
	-- SET @columnname to CITY table
	-- SET @counter to 0	
		
	SET @columnname='CITY'
	SET @counter = 0
	

	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;

	
	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124
	
	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2


	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END


	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err
		
		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'CITY',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'CITY CANNOT CONTAIN NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure] a
					JOIN #tempBADCHAR2 t
					on a.CITY = t.BADCHAR


	-- truncate temp tables in preparation for the next check

		truncate table #tempBADCHAR1
		truncate table #tempBADCHAR2

----------------------------------------------------------------------------------
 
	-- STATECODE must not contain '|' or non printable characters

	-- SET @columnname to STATECODE table
	-- SET @counter to 0

	SET @columnname='STATECODE'
	SET @counter = 0
	

	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;

	
	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124
	
	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2


	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;



	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err

		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'STATECODE',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'STATECODE CANNOT CONTAIN NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure] a
					JOIN #tempBADCHAR2 t
					on a.STATECODE = t.BADCHAR

	-- truncate temp tables in preparation for the next check

		truncate table #tempBADCHAR1
		truncate table #tempBADCHAR2

----------------------------------------------------------------------------------

	-- ZIPCODE must not contain '|' or non printable characters

	-- SET @columnname to ZIPCODE table
	-- SET @counter to 0

	SET @columnname='ZIPCODE'
	SET @counter = 0
	

	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;

	
	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124
	
	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- join s_tbladdresssecure to #tempBADCHAR2 and insert error records into s_tbladdresssecure_err

		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'ZIPCODE',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'ZIPCODE CANNOT CONTAIN NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure] a
					JOIN #tempBADCHAR2 t
					on a.ZIPCODE = t.BADCHAR


	-- drop temp tables no longer needed for DQM checks

	drop table #tempBADCHAR1
	drop table #tempBADCHAR2

----------------------------------------------------------------------------------

	-- STATECODE must be 2 characters long


		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
			  SELECT 
				'STATECODE',
				'FIELD MUST BE 2 CHARS',
				'STATECODE MUST BE 2 CHARS',
				--getdate(),
				@lv_RUNTIME,
				VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
			FROM [asr_staging].[s_tbladdresssecure]
			WHERE len(statecode) <> 2

----------------------------------------------------------------------------------

	END	

END









GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbladdresssecure_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for s_tbladdresssecure DQM rule
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tbladdresssecure

1.	ADDRESSCODE must be unique and can not be null

2.	ADDRESS1 can not contain '|' or non printable characters

3.	ADDRESS2 can not contain '|' or non printable characters

4.	CITY can not contain '|' or non printable characters

5.	STATECODE can not contain '|' or non printable characters

6.	ZIPCODE can not contain '|' or non printable characters

7.	STATECODE must be 2 characters long

*/

CREATE PROCEDURE [dqm].[dqm_s_tbladdresssecure_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLADDRESSSECURE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tbladdresssecure]
	TRUNCATE TABLE [dqm].[s_tbladdresssecure_err]
	
----------------------------------------------------------------------------------

	-- 	ADDRESSCODE must be unique and can not be null

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				123456
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				123456
				);
	
	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE
		)	
			VALUES 
				(
				NULL
				);


	-- ADDRESS1 can not contain '|' or non printable characters
				
	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS1
		)	
			VALUES 
				(
				111111,'BA'+char(182)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS1
		)	
			VALUES 
				(
				111112,'|'
				);


	-- ADDRESS2 can not contain '|' or non printable characters

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS2
		)	
			VALUES 
				(
				111113,'BA'+char(183)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ADDRESS2
		)	
			VALUES 
				(
				111114,'|'
				);


	-- CITY can not contain '|' or non printable characters

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, CITY
		)	
			VALUES 
				(
				111115,'BA'+char(11)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, CITY
		)	
			VALUES 
				(
		        111116,'|'
				);


	-- STATECODE can not contain '|' or non printable characters

		INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, STATECODE
		)	
			VALUES 
				(
				111117,char(19)
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, STATECODE
		)	
			VALUES 
				(
				111118,'|'
				);


	-- ZIPCODE can not contain '|' or non printable characters

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ZIPCODE
		)	
			VALUES 
				(
				111119,'BA'+char(12)+'D'
				);

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, ZIPCODE
		)	
			VALUES 
				(
				111120,'|'
				);



	-- STATECODE must be 2 characters long

	INSERT INTO [asr_staging].[s_tbladdresssecure]
		(
		ADDRESSCODE, STATECODE
		)	
			VALUES 
				(
				111121,'C'
				);

--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tbladdresssecure]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tbladdresssecure])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tbladdresssecure_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'ADDRESSCODE must be unique and not null. ADDRESS1,ADDRESS2,CITY,STATECODE,ZIPCODE can not contain | or non printable characters. STATECODE must be 2 characters long');


END






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimps]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:	David Guillen
-- Create date: 3/3/2016
-- Description:	DQM stored procedure for s_tblimps
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  tblimps


1.	IMPCOMPLETEDPCT cannot be null
	
2.	ACCOUNTNO must be in table s_tblimpsocc - FK Check

3.	IMPNO must be in table s_tblimpsocc - FK Check

4.	ACCOUNTNO must be in table s_tblimpsbltas - FK Check

5.	IMPNO must be in table s_tblimpsbltas - FK Check

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimps]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

-- IMPCOMPLETEDPCT cannot be null

	INSERT INTO [dqm].[s_tblimps_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
					'IMPSCOMPLETEDPCT',
					'FIELD CANNOT BE NULL',
					'IMPSCOMPLETEDPCT CANNOT BE NULL',
					--getdate(),
					@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps]
				WHERE impcompletedpct is null

----------------------------------------------------------------------------------

-- ACCOUNTNO must be in table s_tblimpsocc - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'ACCOUNTNO',
				'MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps]
				WHERE ACCOUNTNO not in (select distinct ACCOUNTNO from [asr_staging].[s_tblimpsocc])

--------------------------------------------------------------------------------------------

-- IMPNO must be in table s_tblimpsocc - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'IMPNO',
				'MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				'IMPNO MUST EXIST IN TABLE S_TBLIMPSOCC - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps]
				WHERE IMPNO not in (select distinct IMPNO from [asr_staging].[s_tblimpsocc])



----------------------------------------------------------------------------------

-- ACCOUNTNO must be in table s_tblimpsbltas - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'ACCOUNTNO',
				'MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps]
				WHERE ACCOUNTNO not in (select distinct ACCOUNTNO from [asr_staging].[s_tblimpsbltas])

--------------------------------------------------------------------------------------------

-- IMPNO must be in table s_tblimpsbltas - FK Check

	INSERT INTO [dqm].[s_tblimps_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID)
			SELECT 
				'IMPNO',
				'MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				'IMPNO MUST EXIST IN TABLE S_TBLIMPSBLTAS - FK CHECK',
				@lv_RUNTIME,
					VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDESCRIPTION, COSTVALUEBY, MARKETVALUEBY, INCOMEVALUEBY, LANDATTRIBUTEDPCT, IMPCOMPLETEDPCT, IMPQUALITY, IMPUNITTYPE, IMPDESIGNADJPCT, IMPEXTERIORADJPCT, IMPPHYSICALDEPRPCT, FUNCTIONALOBSOLESCEPCT, ECONOMICOBSOLESCEPCT, IMPOTHERADJPCT, MHTITLENO, MHSERIALNO, MHTOTALLENGTH, MHDECALNO, MHTAGNO, APPRAISER, APPRAISALDATE, OWNEROCCUPIEDFLAG, COSTMETHOD, MARKETMETHOD, INCOMEMETHOD, IMPCONDITIONTYPE, CONDOLANDPERCENT, IMPSF, CONDOIMPPERCENT, IMPPERIMETER, IMPINTERIORADJPCT, CONDOIMPSF, IMPAMATEURADJPCT, IMPNETSF, PROPERTYTYPE, APPROACHTYPE, JURISDICTIONID, IMPSOT0, IMPSOT1, IMPSOM0, IMPSOM1, IMPSOD0, IMPSOD1, IMPSON0, IMPSON1, IMPSON2, WRITEDATE, SEQID
				FROM [asr_staging].[s_tblimps]
				WHERE IMPNO not in (select distinct IMPNO from [asr_staging].[s_tblimpsbltas])



----------------------------------------------------------------------------------

	END	

END








GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimps_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/14/2016
-- Description:	Unit testing stored procedure for s_tblimps
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblimps

1.	IMPCOMPLETEDPCT cannot be null
	
2.	ACCOUNTNO must be in table s_tblimpsocc - FK Check

3.	IMPNO must be in table s_tblimpsocc - FK Check

4.	ACCOUNTNO must be in table s_tblimpsbltas - FK Check

5.	IMPNO must be in table s_tblimpsbltas - FK Check

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimps_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLIMPS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblimps]
	TRUNCATE TABLE [asr_staging].[s_tblimpsocc]
	TRUNCATE TABLE [asr_staging].[s_tblimpsbltas]
	TRUNCATE TABLE [dqm].[s_tblimps_err]
	
----------------------------------------------------------------------------------
	
-- This will test IMPCOMPLETEDPCT cannot be null

	INSERT INTO [asr_staging].[s_tblimps]
		(
		IMPCOMPLETEDPCT
		)	
			VALUES 
				(
				NULL
				);


-----------------------------------------------------------------------------------

-- TRUNCATE TABLE [asr_staging].[s_tblimpsbltas] 
-- and 
-- TRUNCATE TABLE [asr_staging].[s_tblimpsocc]
-- was run prior to this point.
-- this allows the following DQM unit tests to work


-- This will test ACCOUNTNO must be in table s_tblimpsocc and ACCOUNTNO must be in table s_tblimpsbltas 


	INSERT INTO [asr_staging].[s_tblimps]
		(
		 ACCOUNTNO
		 ,IMPCOMPLETEDPCT
		)	
			VALUES 
				(
				'R0003295',
				1.0000
				);


-- This will test IMPNO must be in table s_tblimpsocc and IMPNO must be in table s_tblimpsbltas

		INSERT INTO [asr_staging].[s_tblimps]
		(
		  IMPNO
		 ,IMPCOMPLETEDPCT
		)	
			VALUES 
				(
				1.00,
				1.0000
				);
	

--------------------------------------------------------------------------------

--run DQM stored procedure

	exec [dqm].[dqm_s_tblimps]

--------------------------------------------------------------------------------
-- compare record counts 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblimps])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblimps_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 10 then 'PASS' else 'FAIL' end,getdate(),'1 not null, ACCOUNTNO and IMPNO FK checks to s_tblimpsocc and s_tblimpsbltas  ');

END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimpsbltas]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for s_tblimpsbltas
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  tblimpsbltas


1.	Effective age has to be between 0 and 999.99

2.	Year is <= system year

3.	The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimpsbltas]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------


	INSERT INTO [dqm].[s_tblimpsbltas_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, BLTASCODE, IMPEXTERIOR, IMPINTERIOR, BLTASSTORIES, BLTASSTORYHEIGHT, ROOFTYPE, ROOFCOVER, FLOORCOVER, ROOMCOUNT, BEDROOMCOUNT, BLTASTOTALUNITCOUNT, IMPBLTASOTHER, CLASSCODE, BLTASHEIGHT, BLTASYEARBUILT, YEARREMODELED, REMODELEDPERCENT, EFFECTIVEAGE, BLTASLENGTH, BLTASWIDTH, MHTAGLENGTH, MHTAGWIDTH, BLTASSF, SPRINKLERSF, BATHCOUNT, PRIMARYBLTASORDERNO, JURISDICTIONID, HVACTYPE, WRITEDATE, SEQID, APEXID)
			SELECT 
					'EFFECTIVEAGE',
					'FIELD MUST BE BETWEEN 0 AND 999',
					'EFFECTIVEAGE MUST BE BETWEEN 0 AND 999',
					--getdate(),
					@lv_RUNTIME,
					DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, BLTASCODE, IMPEXTERIOR, IMPINTERIOR, BLTASSTORIES, BLTASSTORYHEIGHT, ROOFTYPE, ROOFCOVER, FLOORCOVER, ROOMCOUNT, BEDROOMCOUNT, BLTASTOTALUNITCOUNT, IMPBLTASOTHER, CLASSCODE, BLTASHEIGHT, BLTASYEARBUILT, YEARREMODELED, REMODELEDPERCENT, EFFECTIVEAGE, BLTASLENGTH, BLTASWIDTH, MHTAGLENGTH, MHTAGWIDTH, BLTASSF, SPRINKLERSF, BATHCOUNT, PRIMARYBLTASORDERNO, JURISDICTIONID, HVACTYPE, WRITEDATE, SEQID, APEXID
				FROM [asr_staging].[s_tblimpsbltas]
				WHERE effectiveage not between 0 and 999;

----------------------------------------------------------------------------------



	INSERT INTO [dqm].[s_tblimpsbltas_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, BLTASCODE, IMPEXTERIOR, IMPINTERIOR, BLTASSTORIES, BLTASSTORYHEIGHT, ROOFTYPE, ROOFCOVER, FLOORCOVER, ROOMCOUNT, BEDROOMCOUNT, BLTASTOTALUNITCOUNT, IMPBLTASOTHER, CLASSCODE, BLTASHEIGHT, BLTASYEARBUILT, YEARREMODELED, REMODELEDPERCENT, EFFECTIVEAGE, BLTASLENGTH, BLTASWIDTH, MHTAGLENGTH, MHTAGWIDTH, BLTASSF, SPRINKLERSF, BATHCOUNT, PRIMARYBLTASORDERNO, JURISDICTIONID, HVACTYPE, WRITEDATE, SEQID, APEXID)
			SELECT 
					'BLTASYEARBUILT',
					'FIELD MUST BE LESS THAN OR EQUAL TO CURRENT YEAR ',
					'BLTASYEARBUILT MUST BE EQUAL OR LESS THAN CURRENT YEAR',
					--getdate(),
					@lv_RUNTIME,
					DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, BLTASCODE, IMPEXTERIOR, IMPINTERIOR, BLTASSTORIES, BLTASSTORYHEIGHT, ROOFTYPE, ROOFCOVER, FLOORCOVER, ROOMCOUNT, BEDROOMCOUNT, BLTASTOTALUNITCOUNT, IMPBLTASOTHER, CLASSCODE, BLTASHEIGHT, BLTASYEARBUILT, YEARREMODELED, REMODELEDPERCENT, EFFECTIVEAGE, BLTASLENGTH, BLTASWIDTH, MHTAGLENGTH, MHTAGWIDTH, BLTASSF, SPRINKLERSF, BATHCOUNT, PRIMARYBLTASORDERNO, JURISDICTIONID, HVACTYPE, WRITEDATE, SEQID, APEXID
				FROM [asr_staging].[s_tblimpsbltas]
				WHERE bltasyearbuilt > year( getdate() );

----------------------------------------------------------------------------------

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO, IMPNO, DETAILID  FROM [asr_staging].[s_tblimpsbltas] GROUP BY ACCOUNTNO, IMPNO, DETAILID HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblimpsbltas_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, BLTASCODE, IMPEXTERIOR, IMPINTERIOR, BLTASSTORIES, BLTASSTORYHEIGHT, ROOFTYPE, ROOFCOVER, FLOORCOVER, ROOMCOUNT, BEDROOMCOUNT, BLTASTOTALUNITCOUNT, IMPBLTASOTHER, CLASSCODE, BLTASHEIGHT, BLTASYEARBUILT, YEARREMODELED, REMODELEDPERCENT, EFFECTIVEAGE, BLTASLENGTH, BLTASWIDTH, MHTAGLENGTH, MHTAGWIDTH, BLTASSF, SPRINKLERSF, BATHCOUNT, PRIMARYBLTASORDERNO, JURISDICTIONID, HVACTYPE, WRITEDATE, SEQID, APEXID)
			SELECT 
					'MULTIPLE COLUMN UNIQUE',
				'UNIQUE VALUES CHECK',
				'ACCOUNTNO, IMPNO, and DETAILID must be unique',
					@lv_RUNTIME,
					ib.DETAILID, VERSTART, VEREND, ib.ACCOUNTNO, ib.IMPNO, BLTASCODE, IMPEXTERIOR, IMPINTERIOR, BLTASSTORIES, BLTASSTORYHEIGHT, ROOFTYPE, ROOFCOVER, FLOORCOVER, ROOMCOUNT, BEDROOMCOUNT, BLTASTOTALUNITCOUNT, IMPBLTASOTHER, CLASSCODE, BLTASHEIGHT, BLTASYEARBUILT, YEARREMODELED, REMODELEDPERCENT, EFFECTIVEAGE, BLTASLENGTH, BLTASWIDTH, MHTAGLENGTH, MHTAGWIDTH, BLTASSF, SPRINKLERSF, BATHCOUNT, PRIMARYBLTASORDERNO, JURISDICTIONID, HVACTYPE, WRITEDATE, SEQID, APEXID
				FROM [asr_staging].[s_tblimpsbltas] ib
				INNER JOIN DUPE_VALUES DV 
				ON ib.ACCOUNTNO = DV.ACCOUNTNO
				and ib.IMPNO = DV.IMPNO
				and ib.DETAILID = DV.DETAILID;



----------------------------------------------------------------------------------

	END	

END








GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimpsbltas_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for s_tblimpsbltas
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  s_tblimpsbltas

1.	Effective age has to be between 0 and 999.99

2.	Year is <= system year

3.	The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimpsbltas_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLIMPSBLTAS'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblimpsbltas]
	TRUNCATE TABLE [dqm].[s_tblimpsbltas_err]
	
----------------------------------------------------------------------------------
	
	-- for Effective age has to be between 0 and 999.99

	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		EFFECTIVEAGE
		)	
			VALUES 
				(
				9999
				);


 -- for Year is <= system year

	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		BLTASYEARBUILT
		)	
			VALUES 
				(
				2027
				);

	

	-- for The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		ACCOUNTNO,IMPNO, DETAILID
		)	
			VALUES 
				(
				'R0096604',1.00,49
				);


	INSERT INTO [asr_staging].[s_tblimpsbltas]
		(
		ACCOUNTNO,IMPNO, DETAILID
		)	
			VALUES 
				(
				'R0096604',1.00,49
				);
	
	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblimpsbltas]

--------------------------------------------------------------------------------
-- compare record counts 

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblimpsbltas])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblimpsbltas_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'check on EFFECTIVEAGE and BLTASYEARBUILT. combination of ACCOUNTNO, IMPNO, and DETAILID must be unique.');

END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimpsdetail]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- ===========================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TBLIMPSDETAIL table
-- ===========================================================


/*
DQM RULES FOR:
TABLE:  S_TBLIMPSDETAIL

1.		ACCOUNTNO must be in table s_tblimps - FK Check

2.		IMPNO must be in table s_tblimps - FK Check

3.		IMPDETAILDESCRIPTION cannot be null

4.		IMPDETAILTYPE cannot be null

5.		The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimpsdetail]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------


	-- ACCOUNTNO must be in table s_tblimps - FK Check -- DQM check

INSERT INTO [dqm].[s_tblimpsdetail_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDETAILTYPE, IMPDETAILDESCRIPTION, DETAILUNITCOUNT, DETAILYEARBUILT, ADDONCODE, JURISDICTIONID, APEXLINKFLAG, IMPSDETAILOT0, IMPSDETAILOT1, IMPSDETAILOM0, IMPSDETAILOM1, IMPSDETAILOD0, IMPSDETAILOD1, IMPSDETAILON0, IMPSDETAILON1, IMPSDETAILON2, WRITEDATE, SEQID, IMPDETAILTYPEID)
	    SELECT 
				'ACCOUNTNO',
				'FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLIMPS - FK CHECK',
				@lv_RUNTIME,
				DETAILID, 
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				IMPNO, 
				IMPDETAILTYPE, 
				IMPDETAILDESCRIPTION, 
				DETAILUNITCOUNT, 
				DETAILYEARBUILT, 
				ADDONCODE, 
				JURISDICTIONID, 
				APEXLINKFLAG, 
				IMPSDETAILOT0, 
				IMPSDETAILOT1, 
				IMPSDETAILOM0, 
				IMPSDETAILOM1, 
				IMPSDETAILOD0, 
				IMPSDETAILOD1, 
				IMPSDETAILON0, 
				IMPSDETAILON1, 
				IMPSDETAILON2, 
				WRITEDATE, 
				SEQID, 
				IMPDETAILTYPEID
			FROM [asr_staging].[s_tblimpsdetail]
			WHERE ACCOUNTNO not in (select distinct ACCOUNTNO from [asr_staging].[s_tblimps])


--------------------------------------------------------------------------------

	-- IMPNO must be in table s_tblimps - FK Check -- DQM check

INSERT INTO [dqm].[s_tblimpsdetail_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDETAILTYPE, IMPDETAILDESCRIPTION, DETAILUNITCOUNT, DETAILYEARBUILT, ADDONCODE, JURISDICTIONID, APEXLINKFLAG, IMPSDETAILOT0, IMPSDETAILOT1, IMPSDETAILOM0, IMPSDETAILOM1, IMPSDETAILOD0, IMPSDETAILOD1, IMPSDETAILON0, IMPSDETAILON1, IMPSDETAILON2, WRITEDATE, SEQID, IMPDETAILTYPEID)
	    SELECT 
				'IMPNO',
				'FK CHECK',
				'IMPNO MUST EXIST IN TABLE S_TBLIMPS - FK CHECK',
				@lv_RUNTIME,
				DETAILID, 
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				IMPNO, 
				IMPDETAILTYPE, 
				IMPDETAILDESCRIPTION, 
				DETAILUNITCOUNT, 
				DETAILYEARBUILT, 
				ADDONCODE, 
				JURISDICTIONID, 
				APEXLINKFLAG, 
				IMPSDETAILOT0, 
				IMPSDETAILOT1, 
				IMPSDETAILOM0, 
				IMPSDETAILOM1, 
				IMPSDETAILOD0, 
				IMPSDETAILOD1, 
				IMPSDETAILON0, 
				IMPSDETAILON1, 
				IMPSDETAILON2, 
				WRITEDATE, 
				SEQID, 
				IMPDETAILTYPEID
			FROM [asr_staging].[s_tblimpsdetail]
			WHERE IMPNO not in (select distinct IMPNO from [asr_staging].[s_tblimps])

--------------------------------------------------------------------------------

	-- IMPDETAILDESCRIPTION cannot be null


	INSERT INTO [dqm].[s_tblimpsdetail_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDETAILTYPE, IMPDETAILDESCRIPTION, DETAILUNITCOUNT, DETAILYEARBUILT, ADDONCODE, JURISDICTIONID, APEXLINKFLAG, IMPSDETAILOT0, IMPSDETAILOT1, IMPSDETAILOM0, IMPSDETAILOM1, IMPSDETAILOD0, IMPSDETAILOD1, IMPSDETAILON0, IMPSDETAILON1, IMPSDETAILON2, WRITEDATE, SEQID, IMPDETAILTYPEID)
	    SELECT 
				'IMPDETAILDESCRIPTION',
				'NOT NULL CHECK',
				'IMPDETAILDESCRIPTION NOT NULL CHECK',
				@lv_RUNTIME,
				DETAILID, 
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				IMPNO, 
				IMPDETAILTYPE, 
				IMPDETAILDESCRIPTION, 
				DETAILUNITCOUNT, 
				DETAILYEARBUILT, 
				ADDONCODE, 
				JURISDICTIONID, 
				APEXLINKFLAG, 
				IMPSDETAILOT0, 
				IMPSDETAILOT1, 
				IMPSDETAILOM0, 
				IMPSDETAILOM1, 
				IMPSDETAILOD0, 
				IMPSDETAILOD1, 
				IMPSDETAILON0, 
				IMPSDETAILON1, 
				IMPSDETAILON2, 
				WRITEDATE, 
				SEQID, 
				IMPDETAILTYPEID
			FROM [asr_staging].[s_tblimpsdetail]
			WHERE IMPDETAILDESCRIPTION is null
			or IMPDETAILDESCRIPTION = '';


--------------------------------------------------------------------------------

	-- IMPDETAILTYPE cannot be null

	INSERT INTO [dqm].[s_tblimpsdetail_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDETAILTYPE, IMPDETAILDESCRIPTION, DETAILUNITCOUNT, DETAILYEARBUILT, ADDONCODE, JURISDICTIONID, APEXLINKFLAG, IMPSDETAILOT0, IMPSDETAILOT1, IMPSDETAILOM0, IMPSDETAILOM1, IMPSDETAILOD0, IMPSDETAILOD1, IMPSDETAILON0, IMPSDETAILON1, IMPSDETAILON2, WRITEDATE, SEQID, IMPDETAILTYPEID)
	    SELECT 
				'IMPDETAILTYPE',
				'NOT NULL CHECK',
				'IMPDETAILTYPE NOT NULL CHECK',
				@lv_RUNTIME,
				DETAILID, 
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				IMPNO, 
				IMPDETAILTYPE, 
				IMPDETAILDESCRIPTION, 
				DETAILUNITCOUNT, 
				DETAILYEARBUILT, 
				ADDONCODE, 
				JURISDICTIONID, 
				APEXLINKFLAG, 
				IMPSDETAILOT0, 
				IMPSDETAILOT1, 
				IMPSDETAILOM0, 
				IMPSDETAILOM1, 
				IMPSDETAILOD0, 
				IMPSDETAILOD1, 
				IMPSDETAILON0, 
				IMPSDETAILON1, 
				IMPSDETAILON2, 
				WRITEDATE, 
				SEQID, 
				IMPDETAILTYPEID
			FROM [asr_staging].[s_tblimpsdetail]
			WHERE IMPDETAILTYPE IS NULL
			or IMPDETAILTYPE = '';


-------------------------------------------------------------------------------

-- The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO, IMPNO, DETAILID  FROM [asr_staging].[s_tblimpsdetail] GROUP BY ACCOUNTNO, IMPNO, DETAILID HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblimpsdetail_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, IMPDETAILTYPE, IMPDETAILDESCRIPTION, DETAILUNITCOUNT, DETAILYEARBUILT, ADDONCODE, JURISDICTIONID, APEXLINKFLAG, IMPSDETAILOT0, IMPSDETAILOT1, IMPSDETAILOM0, IMPSDETAILOM1, IMPSDETAILOD0, IMPSDETAILOD1, IMPSDETAILON0, IMPSDETAILON1, IMPSDETAILON2, WRITEDATE, SEQID, IMPDETAILTYPEID)
	    SELECT 
				'MULTIPLE COLUMN UNIQUE',
				'UNIQUE VALUES CHECK',
				'ACCOUNTNO, IMPNO, and DETAILID must be unique',
				@lv_RUNTIME,
				id.DETAILID, 
				VERSTART, 
				VEREND, 
				id.ACCOUNTNO, 
				id.IMPNO, 
				IMPDETAILTYPE, 
				IMPDETAILDESCRIPTION, 
				DETAILUNITCOUNT, 
				DETAILYEARBUILT, 
				ADDONCODE, 
				JURISDICTIONID, 
				APEXLINKFLAG, 
				IMPSDETAILOT0, 
				IMPSDETAILOT1, 
				IMPSDETAILOM0, 
				IMPSDETAILOM1, 
				IMPSDETAILOD0, 
				IMPSDETAILOD1, 
				IMPSDETAILON0, 
				IMPSDETAILON1, 
				IMPSDETAILON2, 
				WRITEDATE, 
				SEQID, 
				IMPDETAILTYPEID		
			FROM [asr_staging].[s_tblimpsdetail] id
			INNER JOIN DUPE_VALUES DV 
			ON id.ACCOUNTNO = DV.ACCOUNTNO
			and id.IMPNO = DV.IMPNO
			and id.DETAILID = DV.DETAILID;

-------------------------------------------------------------------------------


            END

	END
	


GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimpsdetail_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TBLIMPSDETAIL
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TBLIMPSDETAIL

1.		ACCOUNTNO must be in table s_tblimps - FK Check

2.		IMPNO must be in table s_tblimps - FK Check

3.		IMPDETAILDESCRIPTION cannot be null

4.		IMPDETAILTYPE cannot be null

5.		The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tblimpsdetail_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLIMPSDETAIL'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblimpsdetail]
	TRUNCATE TABLE [dqm].[s_tblimpsdetail_err]
	TRUNCATE TABLE [asr_staging].[s_tblimps]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	
	-- for ACCOUNTNO must be in table s_tblimps - FK Check
    -- and
	-- for IMPNO must be in table s_tblimps - FK Check

	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		ACCOUNTNO,IMPNO
		)	
			VALUES 
				(
				'R0346636',19.00
				);


	-- for not null checks
	
	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILDESCRIPTION
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILTYPE
		)	
			VALUES 
				(
				NULL
				);





	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILDESCRIPTION
		)	
			VALUES 
				(
				''
				);

		INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		IMPDETAILTYPE
		)	
			VALUES 
				(
				''
				);


	-- for The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique


	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		ACCOUNTNO,IMPNO,DETAILID
		)	
			VALUES 
				(
				'R0100765',1.00,27457925
				);

	INSERT INTO [asr_staging].[s_tblimpsdetail]
		(
		ACCOUNTNO,IMPNO,DETAILID
		)	
			VALUES 
				(
				'R0100765',1.00,27457925
				);


	

--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblimpsdetail]

--------------------------------------------------------------------------------
-- compare record counts in s_tblimpsdetail and s_tblimpsdetail_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblimpsdetail])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblimpsdetail_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 23 then 'PASS' else 'FAIL' end,getdate(),'FK check ACCOUNTNO and IMPNO must be in table s_tblimps.  IMPDETAILDESCRIPTION and IMPDETAILTYPE cannot be null. The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique.');


END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimpsocc]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- ========================================================
-- Author:	David Guillen
-- Create date: 3/3/2016
-- Description:	DQM stored procedure for S_TBLIMPSOCC table
-- ========================================================


/*
DQM RULES FOR:
TABLE:  S_TBLIMPSOCC

1.	ACCOUNTNO must be in table s_tblimps - FK Check

2.	IMPNO must be in table s_tblimps - FK Check

3.	The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tblimpsocc]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------


	-- ACCOUNTNO must be in table s_tblimps - FK Check -- DQM check

INSERT INTO [dqm].[s_tblimpsocc_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, OCCCODE, OCCPERCENT, ABSTRACTCODE, IMPABSTRACTVALUE, ABSTRACTINDATE, ABSTRACTOUTDATE, ABSTRACTADJCODE, PRORATETYPE, TAXDISTRICT, JURISDICTIONID, IMPSOCCOT0, IMPSOCCOT1, IMPSOCCOM0, IMPSOCCOM1, IMPSOCCOD0, IMPSOCCOD1, IMPSOCCON0, IMPSOCCON1, IMPSOCCON2, WRITEDATE, OCCCOMPLETEDPCT, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLIMPS - FK CHECK',
				@lv_RUNTIME,
				DETAILID, 
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				IMPNO, 
				OCCCODE, 
				OCCPERCENT, 
				ABSTRACTCODE, 
				IMPABSTRACTVALUE,
				ABSTRACTINDATE, 
				ABSTRACTOUTDATE, 
				ABSTRACTADJCODE, 
				PRORATETYPE, 
				TAXDISTRICT, 
				JURISDICTIONID, 
				IMPSOCCOT0, 
				IMPSOCCOT1, 
				IMPSOCCOM0, 
				IMPSOCCOM1, 
				IMPSOCCOD0, 
				IMPSOCCOD1, 
				IMPSOCCON0, 
				IMPSOCCON1, 
				IMPSOCCON2, 
				WRITEDATE, 
				OCCCOMPLETEDPCT, 
				SEQID
			FROM [asr_staging].[s_tblimpsocc]
			WHERE ACCOUNTNO not in (select distinct ACCOUNTNO from [asr_staging].[s_tblimps])


--------------------------------------------------------------------------------

	-- IMPNO must be in table s_tblimps - FK Check -- DQM check

INSERT INTO [dqm].[s_tblimpsocc_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, OCCCODE, OCCPERCENT, ABSTRACTCODE, IMPABSTRACTVALUE, ABSTRACTINDATE, ABSTRACTOUTDATE, ABSTRACTADJCODE, PRORATETYPE, TAXDISTRICT, JURISDICTIONID, IMPSOCCOT0, IMPSOCCOT1, IMPSOCCOM0, IMPSOCCOM1, IMPSOCCOD0, IMPSOCCOD1, IMPSOCCON0, IMPSOCCON1, IMPSOCCON2, WRITEDATE, OCCCOMPLETEDPCT, SEQID)
	    SELECT 
				'IMPNO',
				'FK CHECK',
				'IMPNO MUST EXIST IN TABLE S_TBLIMPS - FK CHECK',
				@lv_RUNTIME,
				DETAILID, 
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				IMPNO, 
				OCCCODE, 
				OCCPERCENT, 
				ABSTRACTCODE, 
				IMPABSTRACTVALUE,
				ABSTRACTINDATE, 
				ABSTRACTOUTDATE, 
				ABSTRACTADJCODE, 
				PRORATETYPE, 
				TAXDISTRICT, 
				JURISDICTIONID, 
				IMPSOCCOT0, 
				IMPSOCCOT1, 
				IMPSOCCOM0, 
				IMPSOCCOM1, 
				IMPSOCCOD0, 
				IMPSOCCOD1, 
				IMPSOCCON0, 
				IMPSOCCON1, 
				IMPSOCCON2, 
				WRITEDATE, 
				OCCCOMPLETEDPCT, 
				SEQID
			FROM [asr_staging].[s_tblimpsocc]
			WHERE IMPNO not in (select distinct IMPNO from [asr_staging].[s_tblimps]);

--------------------------------------------------------------------------------


-- The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO, IMPNO, DETAILID  FROM [asr_staging].[s_tblimpsocc] GROUP BY ACCOUNTNO, IMPNO, DETAILID HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblimpsocc_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, DETAILID, VERSTART, VEREND, ACCOUNTNO, IMPNO, OCCCODE, OCCPERCENT, ABSTRACTCODE, IMPABSTRACTVALUE, ABSTRACTINDATE, ABSTRACTOUTDATE, ABSTRACTADJCODE, PRORATETYPE, TAXDISTRICT, JURISDICTIONID, IMPSOCCOT0, IMPSOCCOT1, IMPSOCCOM0, IMPSOCCOM1, IMPSOCCOD0, IMPSOCCOD1, IMPSOCCON0, IMPSOCCON1, IMPSOCCON2, WRITEDATE, OCCCOMPLETEDPCT, SEQID)
	    SELECT 
				'MULTIPLE COLUMN UNIQUE',
				'UNIQUE VALUES CHECK',
				'ACCOUNTNO, IMPNO, and DETAILID must be unique',
				@lv_RUNTIME,
				io.DETAILID, 
				VERSTART, 
				VEREND, 
				io.ACCOUNTNO, 
				io.IMPNO, 
				OCCCODE, 
				OCCPERCENT, 
				ABSTRACTCODE, 
				IMPABSTRACTVALUE,
				ABSTRACTINDATE, 
				ABSTRACTOUTDATE, 
				ABSTRACTADJCODE, 
				PRORATETYPE, 
				TAXDISTRICT, 
				JURISDICTIONID, 
				IMPSOCCOT0, 
				IMPSOCCOT1, 
				IMPSOCCOM0, 
				IMPSOCCOM1, 
				IMPSOCCOD0, 
				IMPSOCCOD1, 
				IMPSOCCON0, 
				IMPSOCCON1, 
				IMPSOCCON2, 
				WRITEDATE, 
				OCCCOMPLETEDPCT, 
				SEQID
			FROM [asr_staging].[s_tblimpsocc] io
			INNER JOIN DUPE_VALUES DV 
			ON io.ACCOUNTNO = DV.ACCOUNTNO
			and io.IMPNO = DV.IMPNO
			and io.DETAILID = DV.DETAILID;


--------------------------------------------------------------------------------

            END


	END
	


GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblimpsocc_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TBLIMPSOCC
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLIMPSOCC

1.		ACCOUNTNO must be in table s_tblimps - FK Check

2.		IMPNO must be in table s_tblimps - FK Check

3.		The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tblimpsocc_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLIMPSOCC'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblimpsocc]
	TRUNCATE TABLE [dqm].[s_tblimpsocc_err]
	TRUNCATE TABLE [asr_staging].[s_tblimps]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	
	-- for ACCOUNTNO must be in table s_tblimps - FK Check
    -- and
	-- for IMPNO must be in table s_tblimps - FK Check

	INSERT INTO [asr_staging].[s_tblimpsocc]
		(
		ACCOUNTNO,IMPNO
		)	
			VALUES 
				(
				'R0346636',19.00
				);
	


--------------------------------------------------------------------------------

-- The combination of ACCOUNTNO, IMPNO, and DETAILID – must be unique DQM check

	INSERT INTO [asr_staging].[s_tblimpsocc]
		(
		ACCOUNTNO,IMPNO, DETAILID
		)	
			VALUES 
				(
				'R0003181',1.00,3619188
				);


	INSERT INTO [asr_staging].[s_tblimpsocc]
		(
		ACCOUNTNO,IMPNO, DETAILID
		)	
			VALUES 
				(
				'R0003181',1.00,3619188
				);



--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblimpsocc]

--------------------------------------------------------------------------------
-- compare record counts in s_tblimpsocc and s_tblimpsocc_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblimpsocc])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblimpsocc_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 5 then 'PASS' else 'FAIL' end,getdate(),'FK check ACCOUNTNO and IMPNO must be in table s_tblimps. The combination of ACCOUNTNO, IMPNO, and DETAILID must be unique.');



	 



 

END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbllandattribute]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==============================================================
-- Author:		David Guillen
-- Create date: 4/6/2016
-- Description:	DQM stored procedure for S_TBLLANDATTRIBUTE table
-- ==============================================================


/*
DQM RULES FOR:
TABLE:  S_TBLLANDATTRIBUTE

1.		ACCOUNTNO must be in table s_tbllandabstract - FK Check

2.		ATTRIBUTETYPE must be in table s_tlkplandattributetype - FK Check

*/

CREATE PROCEDURE [dqm].[dqm_s_tbllandattribute]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------


	-- ACCOUNTNO must be in table s_tbllandabstract - FK Check -- DQM check

INSERT INTO [dqm].[s_tbllandattribute_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, DETAILID, ATTRIBUTETYPE, ATTRIBUTESUBTYPE, ATTRIBUTEADJUSTMENT, FILTERTYPE, LANDATTRIBUTEOT0, LANDATTRIBUTEOT1, LANDATTRIBUTEON0, LANDATTRIBUTEON1, LANDATTRIBUTEON2, LANDATTRIBUTEOD0, LANDATTRIBUTEOD1, LANDATTRIBUTEOM0, LANDATTRIBUTEOM1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'ACCOUNTNO',
				'FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLLANDABSTRACT - FK CHECK',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				DETAILID,
				ATTRIBUTETYPE, 
				ATTRIBUTESUBTYPE, 
				ATTRIBUTEADJUSTMENT, 
				FILTERTYPE, 
				LANDATTRIBUTEOT0, 
				LANDATTRIBUTEOT1, 
				LANDATTRIBUTEON0, 
				LANDATTRIBUTEON1, 
				LANDATTRIBUTEON2, 
				LANDATTRIBUTEOD0, 
				LANDATTRIBUTEOD1, 
				LANDATTRIBUTEOM0, 
				LANDATTRIBUTEOM1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tbllandattribute]
			WHERE ACCOUNTNO not in (select distinct ACCOUNTNO from [asr_staging].[s_tbllandabstract])



----------------------------------------------------------------------------------


	-- ATTRIBUTETYPE must be in table s_tlkplandattributetype - FK Check -- DQM check

INSERT INTO [dqm].[s_tbllandattribute_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, DETAILID, ATTRIBUTETYPE, ATTRIBUTESUBTYPE, ATTRIBUTEADJUSTMENT, FILTERTYPE, LANDATTRIBUTEOT0, LANDATTRIBUTEOT1, LANDATTRIBUTEON0, LANDATTRIBUTEON1, LANDATTRIBUTEON2, LANDATTRIBUTEOD0, LANDATTRIBUTEOD1, LANDATTRIBUTEOM0, LANDATTRIBUTEOM1, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'ATTRIBUTETYPE',
				'FK CHECK',
				'ATTRIBUTETYPE MUST EXIST IN TABLE S_TLKPLANDATTRIBUTETYPE - FK CHECK',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				ACCOUNTNO, 
				DETAILID,
				ATTRIBUTETYPE, 
				ATTRIBUTESUBTYPE, 
				ATTRIBUTEADJUSTMENT, 
				FILTERTYPE, 
				LANDATTRIBUTEOT0, 
				LANDATTRIBUTEOT1, 
				LANDATTRIBUTEON0, 
				LANDATTRIBUTEON1, 
				LANDATTRIBUTEON2, 
				LANDATTRIBUTEOD0, 
				LANDATTRIBUTEOD1, 
				LANDATTRIBUTEOM0, 
				LANDATTRIBUTEOM1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tbllandattribute]
			WHERE ATTRIBUTETYPE not in (select distinct ATTRIBUTETYPE from [asr_staging].[s_tlkplandattributetype])

--------------------------------------------------------------------------------

            END




		END
	












GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbllandattribute_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 4/6/2016
-- Description:	Unit testing stored procedure for S_TBLLANDATTRIBUTE
-- =====================================================================================



/*
DQM RULES FOR:
TABLE:  S_TBLLANDATTRIBUTE

1.		ACCOUNTNO must be in table s_tbllandabstract - FK Check

2.		ATTRIBUTETYPE must be in table s_tlkplandattributetype - FK Check

*/



CREATE PROCEDURE [dqm].[dqm_s_tbllandattribute_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLLANDATTRIBUTE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tbllandattribute]
	TRUNCATE TABLE [dqm].[s_tbllandattribute_err]
	TRUNCATE TABLE [asr_staging].[s_tbllandabstract]
	TRUNCATE TABLE [asr_staging].[s_tlkplandattributetype]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	
	-- for ACCOUNTNO must be in table s_tbllandabstract - FK Check
    -- and
	-- for ATTRIBUTETYPE must be in table s_tlkplandattributetype - FK Check

	INSERT INTO [asr_staging].[s_tbllandattribute]
		(
		ACCOUNTNO,ATTRIBUTETYPE
		)	
			VALUES 
				(
				'R0367063','CDS'
				);
	

--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tbllandattribute]

--------------------------------------------------------------------------------
-- compare record counts in s_tbllandattribute and s_tbllandattribute_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tbllandattribute])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tbllandattribute_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result]
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result]
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 1 then 'PASS' else 'FAIL' end,getdate(),'ACCOUNTNO must be in table s_tbllandabstract AND ATTRIBUTETYPE must be in table s_tlkplandattributetype');


END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblpersonsecure]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for s_tblpersonsecure table
-- =============================================================


/*
DQM RULES FOR:
TABLE:  S_TBLPERSONSECURE

1.	NAME1 cannot contain "|" or any non-printable characters

2.	NAME2 cannot contain "|" or any non-printable characters

3.	PERSONCODE must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tblpersonsecure]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	-- NAME1 cannot contain "|" or any non-printable characters


	-- DECLARE variables for use in the next several DQM checks

	DECLARE @tablename VARCHAR(1000) ='asr_staging.s_tblpersonsecure'
	DECLARE @columnname VARCHAR(100)='NAME1'
	DECLARE @counter INT = 0
	DECLARE @sql VARCHAR(MAX)


	-- create two temp tables for use in the next several DQM checks

	create table #tempBADCHAR1
	(BADCHAR varchar(MAX));

	create table #tempBADCHAR2
	(BADCHAR varchar(MAX));



	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2
	
	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;

	
	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	

	SET @counter = 124

	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1
	

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	
	-- join s_tblpersonsecure to #tempBADCHAR2 and insert error records into s_tblpersonsecure_err
	
	INSERT INTO [dqm].[s_tblpersonsecure_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, PERSONCODE, NAME1, NAME2, PHONE, FAX, MOBILE, PAGER, EMAILADDRESS, FEDERALIDNO, PRIVATEFLAG, PERSONON0, PERSONON1, PERSONON2, ALTNAME1, PERSONTYPEID, JURISDICTIONID, PERSONOD0, PERSONOD1, PERSONOM0, PERSONOM1, PERSONOT0, PERSONOT1, WRITEDATE, SEQID)
			SELECT 
					'NAME1',
					'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
					'NAME1 CANNOT CONTAIN NONPRINTABLE CHARS',
					@lv_RUNTIME,
					VERSTART, 
					VEREND, 
					PERSONCODE, 
					NAME1, 
					NAME2, 
					PHONE, 
					FAX, 
					MOBILE, 
					PAGER, 
					EMAILADDRESS, 
					FEDERALIDNO, 
					PRIVATEFLAG, 
					PERSONON0, 
					PERSONON1, 
					PERSONON2, 
					ALTNAME1, 
					PERSONTYPEID, 
					JURISDICTIONID, 
					PERSONOD0, 
					PERSONOD1, 
					PERSONOM0, 
					PERSONOM1, 
					PERSONOT0, 
					PERSONOT1, 
					WRITEDATE, 
					SEQID
				FROM [asr_staging].[s_tblpersonsecure] p
				JOIN #tempBADCHAR2 t
				on p.NAME1 = t.BADCHAR;


	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2

----------------------------------------------------------------------------------

	-- NAME2 cannot contain "|" or any non-printable characters

	-- SET @columnname to NAME2 table
	-- SET @counter to 0	

	SET @columnname='NAME2'
	SET @counter = 0
	

	-- begin check for ASCII character codes 0 through 31
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	WHILE @counter <=31
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check

	truncate table #tempBADCHAR1
	

	

	-- begin check for ASCII character code 124.  ASCII 124 is |
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2 

	SET @counter = 124

	WHILE @counter =124
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;


	-- truncate #tempBADCHAR1 in preparation for the next check
	
	truncate table #tempBADCHAR1
	



	-- begin check for ASCII character codes 127 through 255
	-- insert found records into #tempBADCHAR1
	-- insert distinct records into #tempBADCHAR2

	SET @counter = 127
	
	WHILE @counter <=255
	BEGIN

	SET @sql=

		'insert into #tempBADCHAR1
		SELECT '+@columnname+'
		FROM '+@tablename+'
		WHERE CHARINDEX(CHAR('+CAST(@counter AS VARCHAR(3))+'),'+@columnname+') <> 0'

	EXEC (@sql)
	SET @counter = @counter + 1
	END

	insert into #tempBADCHAR2 select distinct(BADCHAR) from #tempBADCHAR1;



	-- join s_tblpersonsecure to #tempBADCHAR2 and insert error records into s_tblpersonsecure_err

	INSERT INTO [dqm].[s_tblpersonsecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, PERSONCODE, NAME1, NAME2, PHONE, FAX, MOBILE, PAGER, EMAILADDRESS, FEDERALIDNO, PRIVATEFLAG, PERSONON0, PERSONON1, PERSONON2, ALTNAME1, PERSONTYPEID, JURISDICTIONID, PERSONOD0, PERSONOD1, PERSONOM0, PERSONOM1, PERSONOT0, PERSONOT1, WRITEDATE, SEQID)
				SELECT 
						'NAME2',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'NAME2 CANNOT CONTAIN NONPRINTABLE CHARS',
						@lv_RUNTIME,
						VERSTART, 
					VEREND, 
					PERSONCODE, 
					NAME1, 
					NAME2, 
					PHONE, 
					FAX, 
					MOBILE, 
					PAGER, 
					EMAILADDRESS, 
					FEDERALIDNO, 
					PRIVATEFLAG, 
					PERSONON0, 
					PERSONON1, 
					PERSONON2, 
					ALTNAME1, 
					PERSONTYPEID, 
					JURISDICTIONID, 
					PERSONOD0, 
					PERSONOD1, 
					PERSONOM0, 
					PERSONOM1, 
					PERSONOT0, 
					PERSONOT1, 
					WRITEDATE, 
					SEQID
					FROM [asr_staging].[s_tblpersonsecure] p
					JOIN #tempBADCHAR2 t
					on p.NAME2 = t.BADCHAR;


	-- drop temp tables no longer needed for DQM checks
	
	drop table #tempBADCHAR1;
	drop table #tempBADCHAR2;


----------------------------------------------------------------------------------

	-- PERSONCODE must be unique

    WITH DUPE_VALUES AS (SELECT distinct PERSONCODE  FROM [asr_staging].[s_tblpersonsecure] GROUP BY PERSONCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblpersonsecure_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, PERSONCODE, NAME1, NAME2, PHONE, FAX, MOBILE, PAGER, EMAILADDRESS, FEDERALIDNO, PRIVATEFLAG, PERSONON0, PERSONON1, PERSONON2, ALTNAME1, PERSONTYPEID, JURISDICTIONID, PERSONOD0, PERSONOD1, PERSONOM0, PERSONOM1, PERSONOT0, PERSONOT1, WRITEDATE, SEQID)
	    SELECT 
					'PERSONCODE',
					'FIELD MUST BE UNIQUE',
					'PERSONCODE MUST BE UNIQUE',
					@lv_RUNTIME,
					VERSTART, 
					VEREND, 
					ps.PERSONCODE, 
					NAME1, 
					NAME2, 
					PHONE, 
					FAX, 
					MOBILE, 
					PAGER, 
					EMAILADDRESS, 
					FEDERALIDNO, 
					PRIVATEFLAG, 
					PERSONON0, 
					PERSONON1, 
					PERSONON2, 
					ALTNAME1, 
					PERSONTYPEID, 
					JURISDICTIONID, 
					PERSONOD0, 
					PERSONOD1, 
					PERSONOM0, 
					PERSONOM1, 
					PERSONOT0, 
					PERSONOT1, 
					WRITEDATE, 
					SEQID
				FROM [asr_staging].[s_tblpersonsecure] ps
			INNER JOIN DUPE_VALUES DV 
			ON ps.PERSONCODE = DV.PERSONCODE;


----------------------------------------------------------------------------------




	END	

END









GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblpersonsecure_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/27/2016
-- Description:	Unit testing stored procedure for S_TBLPERSONSECURE DQM rule
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLPERSONSECURE

1.	NAME1 must not contain "|" or any non-printable characters

2.	NAME2 must not contain "|" or any non-printable characters

3.	PERSONCODE must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tblpersonsecure_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLPERSONSECURE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------
	
	-- truncate table and error table
	TRUNCATE TABLE [asr_staging].[s_tblpersonsecure]
	TRUNCATE TABLE [dqm].[s_tblpersonsecure_err]
	
----------------------------------------------------------------------------------

	-- insert records into table to test DQM process


	-- NAME1 must not contain "|" or any non-printable characters


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME1
		)	
			VALUES 
				(
				111113,'BA'+char(184)+'D'
				);


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME1
		)	
			VALUES 
				(
				111114,'|'
				);

	-- NAME2 must not contain "|" or any non-printable characters


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME2
		)	
			VALUES 
				(
				111115,'BA'+char(185)+'D'
				);


	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE, NAME2
		)	
			VALUES 
				(
				111116,'|'
				);


	-- PERSONCODE must be unique 

	INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE
		)	
			VALUES 
				(
				413421
				);

		INSERT INTO [asr_staging].[s_tblpersonsecure]
		(
		PERSONCODE
		)	
			VALUES 
				(
				413421
				);


--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblpersonsecure]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblpersonsecure])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblpersonsecure_err])

select @ROW_COUNT_DIFF = @COUNT_ERR_TABLE - @COUNT_TABLE 


delete from [dqm].[assessor_unit_test_result]
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result]
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'NAME1 and NAME2 must not contain "|" or any non-printable characters. PERSONCODE must be unique.');


END






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsale]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================================
-- Author:		    David Guillen
-- Create date: 	3/1/2016
-- Description:		DQM stored procedure for S_TBLSALE table
-- =============================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSALE

1.	GRANTOR – cannot be NULL

3.  GRANTEE - cannot be NULL

4	SALEPRICE – must be gt or = to zero

4	RECEPTIONNO – must be 10 or less charaters

5.  DOCUMENTDATE - must be a valid date in sql server

6.  SALEDATE - must be a valid date in sql server

*/

CREATE PROCEDURE [dqm].[dqm_s_tblsale]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	-- GRANTOR – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblsale_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, BOOK, PAGE, GRANTOR, GRANTEE, DOCUMENTDATE, SALEDATE, DEEDCODE, SALEPRICE, PPADJAMOUNT, GOODWILLADJAMOUNT, OTHERADJAMOUNT, TIMEADJ, NONSALEFLAG, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'GRANTOR',
				'FIELD CANNOT BE NULL',
				'GRANTOR CANNOT BE NULL',
				@lv_RUNTIME,
			        VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				BOOK, 
				PAGE, 
				GRANTOR, 
				GRANTEE, 
				DOCUMENTDATE, 
				SALEDATE, 
				DEEDCODE, 
				SALEPRICE,
				PPADJAMOUNT, 
				GOODWILLADJAMOUNT, 
				OTHERADJAMOUNT, 
				TIMEADJ, 
				NONSALEFLAG, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tblsale]
			WHERE GRANTOR IS NULL
			OR GRANTOR = '';

--------------------------------------------------------------------------------

	-- GRANTEE – cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tblsale_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, BOOK, PAGE, GRANTOR, GRANTEE, DOCUMENTDATE, SALEDATE, DEEDCODE, SALEPRICE,PPADJAMOUNT, GOODWILLADJAMOUNT, OTHERADJAMOUNT, TIMEADJ, NONSALEFLAG, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'GRANTEE',
				'FIELD CANNOT BE NULL',
				'GRANTEE CANNOT BE NULL',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				BOOK, 
				PAGE, 
				GRANTOR, 
				GRANTEE, 
				DOCUMENTDATE, 
				SALEDATE, 
				DEEDCODE, 
				SALEPRICE,
				PPADJAMOUNT, 
				GOODWILLADJAMOUNT, 
				OTHERADJAMOUNT, 
				TIMEADJ, 
				NONSALEFLAG, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tblsale]
			WHERE GRANTEE IS NULL
			OR GRANTEE = '';

------------------------------------------------------------------------------

	-- SALEPRICE – must be gt or = to zero

		INSERT INTO [dqm].[s_tblsale_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, BOOK, PAGE, GRANTOR, GRANTEE, DOCUMENTDATE, SALEDATE, DEEDCODE, SALEPRICE, PPADJAMOUNT, GOODWILLADJAMOUNT, OTHERADJAMOUNT, TIMEADJ, NONSALEFLAG, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'SALEPRICE',
				'FIELD DOES NOT ALLOW NEGATIVE NUMBER',
				'SALEPRICE MUST BE GREATER THAN OR EQUAL TO ZERO',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				BOOK, 
				PAGE, 
				GRANTOR, 
				GRANTEE, 
				DOCUMENTDATE, 
				SALEDATE, 
				DEEDCODE, 
				SALEPRICE, 
				PPADJAMOUNT, 
				GOODWILLADJAMOUNT, 
				OTHERADJAMOUNT, 
				TIMEADJ,
				NONSALEFLAG, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tblsale]
			WHERE SALEPRICE < 0;


--------------------------------------------------------------------------------

	-- RECEPTIONNO – must be 10 or less charaters

		INSERT INTO [dqm].[s_tblsale_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, BOOK, PAGE, GRANTOR, GRANTEE, DOCUMENTDATE, SALEDATE, DEEDCODE, SALEPRICE,PPADJAMOUNT, GOODWILLADJAMOUNT, OTHERADJAMOUNT, TIMEADJ, NONSALEFLAG, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'RECEPTIONNO',
				'FIELD LENGTH RESTRICTION',
				'RECEPTIONNO MUST BE 10 CHARACTERS OR LESS',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				BOOK, 
				PAGE, 
				GRANTOR, 
				GRANTEE, 
				DOCUMENTDATE, 
				SALEDATE, 
				DEEDCODE, 
				SALEPRICE, 
				PPADJAMOUNT, 
				GOODWILLADJAMOUNT, 
				OTHERADJAMOUNT, 
				TIMEADJ,
				NONSALEFLAG, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tblsale]
			WHERE LEN(RECEPTIONNO) > 10;


--------------------------------------------------------------------------------

	-- DOCUMENTDATE must be a valid date

		INSERT INTO [dqm].[s_tblsale_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, BOOK, PAGE, GRANTOR, GRANTEE, DOCUMENTDATE, SALEDATE, DEEDCODE, SALEPRICE, PPADJAMOUNT, GOODWILLADJAMOUNT, OTHERADJAMOUNT, TIMEADJ, NONSALEFLAG, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'DOCUMENTDATE',
				'MUST BE A VALID DATE',
				'DOCUMENT DATE MUST BE A VALID SQL SERVER DATE',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				BOOK, 
				PAGE, 
				GRANTOR, 
				GRANTEE, 
				DOCUMENTDATE, 
				SALEDATE, 
				DEEDCODE, 
				SALEPRICE, 
				PPADJAMOUNT, 
				GOODWILLADJAMOUNT, 
				OTHERADJAMOUNT, 
				TIMEADJ,
				NONSALEFLAG, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tblsale]
			 WHERE DOCUMENTDATE IS NOT NULL
			 AND CAST(DOCUMENTDATE AS DATE) NOT BETWEEN '1850-01-01' AND '2020-01-01'

--------------------------------------------------------------------------------

-- SALEDATE must be a valid date

		INSERT INTO [dqm].[s_tblsale_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, BOOK, PAGE, GRANTOR, GRANTEE, DOCUMENTDATE, SALEDATE, DEEDCODE, SALEPRICE,PPADJAMOUNT, GOODWILLADJAMOUNT, OTHERADJAMOUNT, TIMEADJ, NONSALEFLAG, JURISDICTIONID, WRITEDATE, SEQID)
	    SELECT 
				'SALEDATE',
				'MUST BE A VALID DATE',
				'SALE DATE MUST BE A VALID SQL SERVER DATE',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				BOOK, 
				PAGE, 
				GRANTOR, 
				GRANTEE, 
				DOCUMENTDATE, 
				SALEDATE, 
				DEEDCODE, 
				SALEPRICE, 
				PPADJAMOUNT, 
				GOODWILLADJAMOUNT, 
				OTHERADJAMOUNT, 
				TIMEADJ,
				NONSALEFLAG, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID
			FROM [asr_staging].[s_tblsale]
			WHERE SALEDATE IS NOT NULL
			AND CAST(SALEDATE AS DATE) NOT BETWEEN '1850-01-01' AND '2020-01-01'

--------------------------------------------------------------------------------

            END

	END



GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsale_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TBLSALE
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSALE

1.	GRANTOR – cannot be NULL

3.  GRANTEE - cannot be NULL

4	SALEPRICE – must be gt or = to zero

4	RECEPTIONNO – must be lt or = 10 charaters

5.  DOCUMENTDATE - must be a valid date in sql server

6.  SALEDATE - must be a valid date in sql server

*/

CREATE PROCEDURE [dqm].[dqm_s_tblsale_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLSALE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblsale]
	TRUNCATE TABLE [dqm].[s_tblsale_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for GRANTOR – cannot be NULL and also checking for empty string

	INSERT INTO [asr_staging].[s_tblsale]
		( 
		GRANTOR
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblsale]
		( 
		GRANTOR
		)	
			VALUES 
				(
				''
				);


	-- for GRANTEE - cannot be NULL and also checking for empty string

	INSERT INTO [asr_staging].[s_tblsale]
		(
		GRANTEE
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tblsale]
		(
		GRANTEE
		)	
			VALUES 
				(
				''
				);



	-- SALEPRICE – must be gt or = to zero

	INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEPRICE
		)	
			VALUES 
				(
				0
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEPRICE
		)	
			VALUES 
				(
				-100
				);


	-- RECEPTIONNO – must be lt or = 10 charaters

	INSERT INTO [asr_staging].[s_tblsale]
		(
		RECEPTIONNO
		)	
			VALUES 
				(
				'0005717012'
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		RECEPTIONNO
		)	
			VALUES 
				(
				'00057170123'
				);


	-- DOCUMENTDATE - must be a valid date in sql server

		INSERT INTO [asr_staging].[s_tblsale]
		(
		DOCUMENTDATE
		)	
			VALUES 
				(
				'1750-08-03 00:00:00'
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		DOCUMENTDATE
		)	
			VALUES 
				(
				'2050-08-03 00:00:00'
				);



	-- SALEDATE - must be a valid date in sql server

			INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEDATE
		)	
			VALUES 
				(
				'1750-08-03 00:00:00'
				);


	INSERT INTO [asr_staging].[s_tblsale]
		(
		SALEDATE
		)	
			VALUES 
				(
				'2050-08-03 00:00:00'
				);


	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblsale]

--------------------------------------------------------------------------------
-- compare record counts in s_tblsale and s_tblsale_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblsale])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblsale_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE



delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME 

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 18 then 'PASS' else 'FAIL' end,getdate(),'GRANTOR and GRANTEE cannot be NULL. SALEPRICE must be gt or = to zero. RECEPTIONNO must be lt or = 10 charaters. DOCUMENTDATE and SALEDATE must be a valid date in sql server.');


 

END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsaleacct]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =========================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TBLSALEACCT table
-- =========================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSALEACCT

1.	ACCOUNTNO and RECEPTIONNO must be unique

2.	RECEPTIONNO must be in table s_tblsale - FK Check

*/

CREATE PROCEDURE [dqm].[dqm_s_tblsaleacct]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.


--------------------------------------------------------------------------------


	-- ACCOUNTNO and RECEPTIONNO – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO, RECEPTIONNO FROM [asr_staging].[s_tblsaleacct] GROUP BY ACCOUNTNO, RECEPTIONNO HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblsaleacct_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, ACCOUNTNO, INVENTORYEFFECTIVEDATE, ACCTADJSALEPRICE, GROUPPRIMARYACCTFLAG, SALEACCTON0, SALEACCTON1, SALEACCTON2, SALEACCTOD0, SALEACCTOD1, SALEACCTOM0, SALEACCTOM1, SALEACCTOT0, SALEACCTOT1, JURISDICTIONID, WRITEDATE, SALEACCTPENALTYDATE, SALEACCTPENALTYFLAG, SEQID)
	    SELECT 
				'ACCOUNTNO AND RECEPTIONNO',
				'FIELD MUST BE UNIQUE',
				'ACCOUNTNO AND RECEPTIONNO MUST BE UNIQUE',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				sa.RECEPTIONNO, 
				sa.ACCOUNTNO, 
				INVENTORYEFFECTIVEDATE, 
				ACCTADJSALEPRICE, 
				GROUPPRIMARYACCTFLAG, 
				SALEACCTON0, 
				SALEACCTON1,
				SALEACCTON2, 
				SALEACCTOD0, 
				SALEACCTOD1, 
				SALEACCTOM0, 
				SALEACCTOM1, 
				SALEACCTOT0, 
				SALEACCTOT1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SALEACCTPENALTYDATE, 
				SALEACCTPENALTYFLAG, 
				SEQID
			FROM [asr_staging].[s_tblsaleacct] sa
			INNER JOIN DUPE_VALUES DV 
			ON sa.RECEPTIONNO = DV.RECEPTIONNO
			and sa.ACCOUNTNO = DV.ACCOUNTNO;



--------------------------------------------------------------------------------


	-- RECEPTIONNO must be in table s_tblsale - FK Check -- DQM check

	INSERT INTO [dqm].[s_tblsaleacct_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, RECEPTIONNO, ACCOUNTNO, INVENTORYEFFECTIVEDATE, ACCTADJSALEPRICE, GROUPPRIMARYACCTFLAG, SALEACCTON0, SALEACCTON1, SALEACCTON2, SALEACCTOD0, SALEACCTOD1, SALEACCTOM0, SALEACCTOM1, SALEACCTOT0, SALEACCTOT1, JURISDICTIONID, WRITEDATE, SALEACCTPENALTYDATE, SALEACCTPENALTYFLAG, SEQID)
	    SELECT 
				'RECEPTIONNO',
				'MUST EXIST IN TABLE S_TLKPTAXDISTRICT - FK CHECK',
				'RECEPTIONNO MUST EXIST IN TABLE S_TBLSALE - FK CHECK',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				RECEPTIONNO, 
				ACCOUNTNO, 
				INVENTORYEFFECTIVEDATE, 
				ACCTADJSALEPRICE, 
				GROUPPRIMARYACCTFLAG, 
				SALEACCTON0, 
				SALEACCTON1,
				SALEACCTON2, 
				SALEACCTOD0, 
				SALEACCTOD1, 
				SALEACCTOM0, 
				SALEACCTOM1, 
				SALEACCTOT0, 
				SALEACCTOT1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SALEACCTPENALTYDATE, 
				SALEACCTPENALTYFLAG, 
				SEQID
			FROM [asr_staging].[s_tblsaleacct]
			WHERE RECEPTIONNO not in (select distinct RECEPTIONNO from [asr_staging].[s_tblsale])


--------------------------------------------------------------------------------

            END


	END
	


GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsaleacct_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TBLSALEACCT
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSALEACCT

1.	Combination of ACCOUNTNO and RECEPTIONNO must be unique

2.	RECEPTIONNO must be in table s_tblsale - FK Check

*/


CREATE PROCEDURE [dqm].[dqm_s_tblsaleacct_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLSALEACCT'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblsaleacct]
	TRUNCATE TABLE [dqm].[s_tblsaleacct_err]
	TRUNCATE TABLE [asr_staging].[s_tblsale]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for Combination of ACCOUNTNO and RECEPTIONNO must be unique

	INSERT INTO [asr_staging].[s_tblsaleacct]
		(
		ACCOUNTNO,RECEPTIONNO
		)	
			VALUES 
				(
				'R0421535','00000935'
				);


	INSERT INTO [asr_staging].[s_tblsaleacct]
		(
		ACCOUNTNO,RECEPTIONNO
		)	
			VALUES 
				(
				'R0421535','00000935'
				);

	INSERT INTO [asr_staging].[s_tblsaleacct]
		(
		RECEPTIONNO
		)	
			VALUES 
				(
				'00000936'
				);


	-- for RECEPTIONNO must be in table s_tblsale - FK Check
    -- no specific condition needs to be created
	-- s_tblsale has been truncated
	-- and several records with values for RECEPTIONNO have been added to s_tblsaleacct

	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tblsaleacct]

--------------------------------------------------------------------------------
-- compare record counts in s_tblsaleacct and s_tblsaleacct_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblsaleacct])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblsaleacct_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'Combination of ACCOUNTNO and RECEPTIONNO must be unique. FK check RECEPTIONNO must be in table s_tblsale.');


 

END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsubaccount]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- ===========================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for S_TBLSUBACCOUNT table
-- ===========================================================


/*
DQM RULES FOR:
TABLE:  S_TBLSUBACCOUNT

1.	    ACCOUNTNO must be in table s_tblacct - FK Check

2.		ACCOUNTNO – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tblsubaccount]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	

	-- ACCOUNTNO must be in table s_tblacct - FK Check

INSERT INTO [dqm].[s_tblsubaccount_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, SUBNO, FILINGNO, ACCOUNTNO, BLOCK, LOT, TRACT, SUBACCOUNTON0, SUBACCOUNTON1, SUBACCOUNTON2, SUBACCOUNTOD0, SUBACCOUNTOD1, SUBACCOUNTOM0, SUBACCOUNTOM1, SUBACCOUNTOT0, SUBACCOUNTOT1, JURISDICTIONID, WRITEDATE, SEQID, PRIORSUBNO, PRIORFILINGNO)
	    SELECT 
				'ACCOUNTNO',
				'FK CHECK',
				'ACCOUNTNO MUST EXIST IN TABLE S_TBLSUBACCOUNT - FK CHECK',
				@lv_RUNTIME,
				VERSTART, 
				VEREND, 
				SUBNO, 
				FILINGNO, 
				ACCOUNTNO, 
				BLOCK, 
				LOT, 
				TRACT, 
				SUBACCOUNTON0, 
				SUBACCOUNTON1, 
				SUBACCOUNTON2, 
				SUBACCOUNTOD0, 
				SUBACCOUNTOD1, 
				SUBACCOUNTOM0, 
				SUBACCOUNTOM1, 
				SUBACCOUNTOT0, 
				SUBACCOUNTOT1, 
				JURISDICTIONID, 
				WRITEDATE, 
				SEQID, 
				PRIORSUBNO, 
				PRIORFILINGNO
			FROM [asr_staging].[s_tblsubaccount]
			WHERE ACCOUNTNO not in (select distinct ACCOUNTNO from [asr_staging].[s_tblacct]);


-----------------------------------------------------------------------------------

	-- ACCOUNTNO – must be unique

	WITH DUPE_VALUES AS (SELECT distinct ACCOUNTNO  FROM [asr_staging].[s_tblsubaccount] GROUP BY ACCOUNTNO HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tblsubaccount_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, SUBNO, FILINGNO, ACCOUNTNO, BLOCK, LOT, TRACT, SUBACCOUNTON0, SUBACCOUNTON1, SUBACCOUNTON2, SUBACCOUNTOD0, SUBACCOUNTOD1, SUBACCOUNTOM0, SUBACCOUNTOM1, SUBACCOUNTOT0, SUBACCOUNTOT1, JURISDICTIONID, WRITEDATE, SEQID, PRIORSUBNO, PRIORFILINGNO)
	   SELECT 
				'ACCOUNTNO',
				'FIELD MUST BE UNIQUE',
				'ACCOUNTNO MUST BE UNIQUE',
				@lv_RUNTIME, 
				VERSTART, VEREND, SUBNO, FILINGNO, sa.ACCOUNTNO, BLOCK, LOT, TRACT, SUBACCOUNTON0, SUBACCOUNTON1, SUBACCOUNTON2, SUBACCOUNTOD0, SUBACCOUNTOD1, SUBACCOUNTOM0, SUBACCOUNTOM1, SUBACCOUNTOT0, SUBACCOUNTOT1, JURISDICTIONID, WRITEDATE, SEQID, PRIORSUBNO, PRIORFILINGNO
			FROM [asr_staging].[s_tblsubaccount] sa
			INNER JOIN DUPE_VALUES DV 
			ON sa.ACCOUNTNO = DV.ACCOUNTNO;


     END

END

-----------------------------------------------------------------------------------
	















GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsubaccount_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 1/26/2016
-- Description:	Unit testing stored procedure for S_TBLSUBACCOUNT DQM rule
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TBLSUBACCOUNT

1.	    ACCOUNTNO must be in table s_tblacct - FK Check

2.		ACCOUNTNO must be unique

*/



CREATE PROCEDURE [dqm].[dqm_s_tblsubaccount_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBLSUBACCOUNT'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tblsubaccount]
	TRUNCATE TABLE [dqm].[s_tblsubaccount_err]
	TRUNCATE TABLE [asr_staging].[s_tblacct]

----------------------------------------------------------------------------------

	-- ACCOUNTNO must be in table s_tblacct - FK Check


	INSERT INTO [asr_staging].[s_tblsubaccount]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R0000036'
				);


	-- ACCOUNTNO must be unique

	INSERT INTO [asr_staging].[s_tblsubaccount]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R0000037'
				);

	INSERT INTO [asr_staging].[s_tblsubaccount]
		(
		ACCOUNTNO
		)	
			VALUES 
				(
				'R0000037'
				);

	
--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tblsubaccount]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tblsubaccount])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tblsubaccount_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME


insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'FK check ACCOUNTNO must be in table s_tblacct, ACCOUNTNO must be unique.');





	 



 

END






GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbnsubfiling]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- ==========================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for S_TBNSUBFILING table
-- ==========================================================


/*
DQM RULES FOR:
TABLE:  S_TBNSUBFILING

1.	    SUBFILINGRECORDINGNO – cannot be NULL

*/

CREATE PROCEDURE [dqm].[dqm_s_tbnsubfiling]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	
	-- SUBFILINGRECORDINGNO – cannot be NULL DQM check and also check for empty string
	
	INSERT INTO [dqm].[s_tbnsubfiling_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, SUBNO, FILINGNO, SUBFILINGDESCRIPTION, SUBFILINGRECORDINGNO, SUBFILINGCITY, DEFAULTSECTION, DEFAULTTOWNSHIP, DEFAULTRANGE, DEFAULTQTR, DEFAULTQTRQTR, SUBFILINGDATERECORDED, DEFAULTLEA, DEFAULTTAXDISTRICT, MAPNO, ECONOMICAREACODE, ACCOUNTTYPE, LANDCERTIFICATIONCODE, FLAGTYPE, SUBFILINGSTATUS, DEFAULTAPPROACHTYPE, VALUEAREACODE, ZONINGCODE, BLOCKCOUNT, LOTCOUNT, TRACTCOUNT, SUBFILINGMHTITLEFLAG, SUBFILINGNOTESFLAG, SUBFILINGNEWCONSTFLAG, SUBFILINGPHOTOSFLAG, SUBFILINGSKETCHESFLAG, SUBFILINGTAXYEAR, SUBFILINGON0, SUBFILINGON1, SUBFILINGON2, ASSIGNEDTO, SUBFILINGOD0, SUBFILINGOD1, SUBFILINGOM0, SUBFILINGOM1, SUBFILINGOT0, SUBFILINGOT1, JURISDICTIONID, DEFAULTLEGAL, LASTUPDATED, PRIMARYUSECODE, APPRAISALTYPE)
	    SELECT 
				'SUBFILINGRECORDINGNO',
				'FIELD CANNOT BE NULL',
				'SUBFILINGRECORDINGNO CANNOT BE NULL',
				@lv_RUNTIME,
				SUBNO, 
				FILINGNO, 
				SUBFILINGDESCRIPTION, 
				SUBFILINGRECORDINGNO, 
				SUBFILINGCITY, 
				DEFAULTSECTION, 
				DEFAULTTOWNSHIP, 
				DEFAULTRANGE, 
				DEFAULTQTR, 
				DEFAULTQTRQTR, 
				SUBFILINGDATERECORDED, 
				DEFAULTLEA, 
				DEFAULTTAXDISTRICT, 
				MAPNO, 
				ECONOMICAREACODE, 
				ACCOUNTTYPE, 
				LANDCERTIFICATIONCODE, 
				FLAGTYPE, 
				SUBFILINGSTATUS, 
				DEFAULTAPPROACHTYPE, 
				VALUEAREACODE, 
				ZONINGCODE, 
				BLOCKCOUNT, 
				LOTCOUNT, 
				TRACTCOUNT, 
				SUBFILINGMHTITLEFLAG, 
				SUBFILINGNOTESFLAG, 
				SUBFILINGNEWCONSTFLAG, 
				SUBFILINGPHOTOSFLAG, 
				SUBFILINGSKETCHESFLAG, 
				SUBFILINGTAXYEAR, 
				SUBFILINGON0, 
				SUBFILINGON1, 
				SUBFILINGON2, 
				ASSIGNEDTO, 
				SUBFILINGOD0, 
				SUBFILINGOD1, 
				SUBFILINGOM0, 
				SUBFILINGOM1, 
				SUBFILINGOT0, 
				SUBFILINGOT1, 
				JURISDICTIONID, 
				DEFAULTLEGAL, 
				LASTUPDATED, 
				PRIMARYUSECODE, 
				APPRAISALTYPE
			FROM [asr_staging].[s_tbnsubfiling]
			WHERE SUBFILINGRECORDINGNO IS NULL
			or SUBFILINGRECORDINGNO = '';

--------------------------------------------------------------------------------

            END




		END
	














GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbnsubfiling_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =====================================================================================
-- Author:		David Guillen
-- Create date: 9/17/2014
-- Description:	Unit testing stored procedure for S_TBNSUBFILING
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TBNSUBFILING

1.	    SUBFILINGRECORDINGNO – cannot be NULL

*/

CREATE PROCEDURE [dqm].[dqm_s_tbnsubfiling_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TBNSUBFILING'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tbnsubfiling]
	TRUNCATE TABLE [dqm].[s_tbnsubfiling_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- SUBFILINGRECORDINGNO – cannot be NULL and also test for null string

	INSERT INTO [asr_staging].[s_tbnsubfiling]
		( 
		SUBFILINGRECORDINGNO
		)	
			VALUES 
				(
				NULL
				);


	INSERT INTO [asr_staging].[s_tbnsubfiling]
		( 
		SUBFILINGRECORDINGNO
		)	
			VALUES 
				(
				''
				);
	
	
--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tbnsubfiling]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tbnsubfiling])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tbnsubfiling_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME


insert into [dqm].[assessor_unit_test_result]
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'SUBFILINGRECORDINGNO – cannot be NULL');





	 



 

END







GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkpabstractcode]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==============================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TLKPABSTRACTCODE table
-- ==============================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPABSTRACTCODE

1.	    ABSTRACTDESCRIPTION – must be 256 characters or less

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpabstractcode]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table.

----------------------------------------------------------------------------------
	-- ABSTRACTDESCRIPTION – must be 256 characters or less DQM check
	
	INSERT INTO [dqm].[s_tlkpabstractcode_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ABSTRACTCODE, ABSTRACTDESCRIPTION, EQUIVALENCEABSTRACTCODE, ROLLABSTRACTVALUEFLAG, VALUEGROUPCODE, ACTUALPRECISION, ACTUALMINIMUMVALUE, ASSESSEDPRECISION, ASSESSEDMINIMUMVALUE, ACTUALROUNDTYPE, ASSESSEDROUNDTYPE, USEVALUEFLAG, ADJACTUALPRECISION, ADJACTUALMINIMUMVALUE, ADJACTUALROUNDTYPE, ADJASSESSEDPRECISION, ADJASSESSEDMINIMUMVALUE, ADJASSESSEDROUNDTYPE, ADJALTACTUALPRECISION, ADJALTACTUALMINVALUE, ADJALTACTUALROUNDTYPE, ADJALTASSESSEDPRECISION, ADJALTASSESSEDMINVALUE, ADJALTASSESSEDDROUNDTYPE, ALTASSESSEDPRECISION, ALTASSESSEDMINIMUMVALUE, ALTASSESSEDROUNDTYPE, SHOWADMINFLAG, CLASSIFICATIONID, LOCALGROWTHEXEMPTFLAG, EXPORTCNTGROUPEXCLUSIONFLAG, SORTORDER, ACTIVEFLAG, LIMITTOABSTTYPE, JURISDICTIONID, LASTUPDATED, ABSTRACTCATEGORYCODE)
	    SELECT 
				'ABSTRACTDESCRIPTION',
				'FIELD LENGTH CONSTRAINT',
				'ABSTRACTDESCRIPTION MUST BE 256 CHARACTERS OR LESS',
				@lv_RUNTIME,
				ABSTRACTCODE, 
				ABSTRACTDESCRIPTION, 
				EQUIVALENCEABSTRACTCODE, 
				ROLLABSTRACTVALUEFLAG, 
				VALUEGROUPCODE, 
				ACTUALPRECISION, 
				ACTUALMINIMUMVALUE, 
				ASSESSEDPRECISION, 
				ASSESSEDMINIMUMVALUE, 
				ACTUALROUNDTYPE, 
				ASSESSEDROUNDTYPE, 
				USEVALUEFLAG, 
				ADJACTUALPRECISION, 
				ADJACTUALMINIMUMVALUE, 
				ADJACTUALROUNDTYPE, 
				ADJASSESSEDPRECISION, 
				ADJASSESSEDMINIMUMVALUE, 
				ADJASSESSEDROUNDTYPE, 
				ADJALTACTUALPRECISION,
				ADJALTACTUALMINVALUE, 
				ADJALTACTUALROUNDTYPE, 
				ADJALTASSESSEDPRECISION, 
				ADJALTASSESSEDMINVALUE, 
				ADJALTASSESSEDDROUNDTYPE, 
				ALTASSESSEDPRECISION, 
				ALTASSESSEDMINIMUMVALUE, 
				ALTASSESSEDROUNDTYPE, 
				SHOWADMINFLAG, 
				CLASSIFICATIONID, 
				LOCALGROWTHEXEMPTFLAG, 
				EXPORTCNTGROUPEXCLUSIONFLAG, 
				SORTORDER, 
				ACTIVEFLAG, 
				LIMITTOABSTTYPE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				ABSTRACTCATEGORYCODE
			FROM [asr_staging].[s_tlkpabstractcode]
			WHERE LEN(ABSTRACTDESCRIPTION) > 256



--------------------------------------------------------------------------------

            END


	END
	


GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkpabstractcode_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TLKPABSTRACTCODE
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TLKPABSTRACTCODE

1.	    ABSTRACTDESCRIPTION – must be 256 characters or less

*/


CREATE PROCEDURE [dqm].[dqm_s_tlkpabstractcode_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TLKPABSTRACTCODE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tlkpabstractcode]
	TRUNCATE TABLE [dqm].[s_tlkpabstractcode_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for ABSTRACTDESCRIPTION – must be 256 characters or less

	INSERT INTO [asr_staging].[s_tlkpabstractcode]
		( 
		ABSTRACTDESCRIPTION
		)	
			VALUES 
				(
				'This string needs to be a max of 256 characters but under 500.  I will make this one 256 characters long -------------------------------------------------------------------------------------------------------------------------------------------------------'
				);

	INSERT INTO [asr_staging].[s_tlkpabstractcode]
		( 
		ABSTRACTDESCRIPTION
		)	
			VALUES 
				(
				'This string needs to be a max of 256 characters but under 500.  I will make this one 257 characters long --------------------------------------------------------------------------------------------------------------------------------------------------------'
				);
	

	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tlkpabstractcode]

--------------------------------------------------------------------------------
-- compare record counts in s_tlkpabstractcode and s_tlkpabstractcode_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tlkpabstractcode])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tlkpabstractcode_err])

select @ROW_COUNT_DIFF =  @COUNT_TABLE - @COUNT_ERR_TABLE 



delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 1 then 'PASS' else 'FAIL' end,getdate(),'ABSTRACTDESCRIPTION must be 256 characters or less');


END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkpimpsaddons]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================
-- Author:		David Guillen
-- Create date: 9/17/2014
-- Description:	DQM stored procedure for S_TLKPIMPSADDONS table in Realware_ODS
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPIMPSADDONS

1.	    ADDONCODE – cannot be NULL

2.      ADDONDESCRIPTION - cannot be NULL

3.      ADDONCODE - must be unique

4	    ADDONDESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpimpsaddons]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	-- ADDONCODE – cannot be NULL DQM check
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)    
		SELECT 
				'ADDONCODE',
				'FIELD CANNOT BE NULL',
				'ADDONCODE CANNOT BE NULL',
				@lv_RUNTIME,
				ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
			FROM [dbo].[s_tlkpimpsaddons]
			WHERE ADDONCODE IS NULL;

--------------------------------------------------------------------------------

-- ADDONDESCRIPTION – cannot be NULL DQM check
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)
	    SELECT 
				'ADDONDESCRIPTION',
				'FIELD CANNOT BE NULL',
				'ADDONDESCRIPTION CANNOT BE NULL',
				@lv_RUNTIME,
				ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
				FROM [dbo].[s_tlkpimpsaddons]
			WHERE ADDONDESCRIPTION IS NULL
			or ADDONDESCRIPTION = '';

-----------------------------------------------------------------------------------

	-- ADDONCODE – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ADDONCODE  FROM [dbo].[s_tlkpimpsaddons] GROUP BY ADDONCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)
	   SELECT 
				'ADDONCODE',
				'FIELD MUST BE UNIQUE',
				'ADDONCODE MUST BE UNIQUE',
				@lv_RUNTIME, 
				ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				iao.ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
				FROM [dbo].[s_tlkpimpsaddons] iao
			INNER JOIN DUPE_VALUES DV 
			ON iao.ADDONCODE = DV.ADDONCODE;
			
--------------------------------------------------------------------------------

-- ADDONDESCRIPTION – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct ADDONDESCRIPTION  FROM [dbo].[s_tlkpimpsaddons] GROUP BY ADDONDESCRIPTION HAVING COUNT(*) > 1)
	
	INSERT INTO [dbo].[s_tlkpimpsaddons_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, ADDONDESCRIPTION, ADDONVALUE, ADDONFILTERTYPE, DEPRTYPE, OVERRIDELIFEEXPECTANCY, SORTORDER, ACTIVEFLAG, USEINANALYSISFLAG, IMPDETAILTYPE, ADDONCODE, JURISDICTIONID, LASTUPDATED, APEXLINKFLAG, TAXYEAR)
	   SELECT 
				'ADDONDESCRIPTION',
				'FIELD MUST BE UNIQUE',
				'ADDONDESCRIPTION MUST BE UNIQUE',
				@lv_RUNTIME, 
				iao.ADDONDESCRIPTION, 
				ADDONVALUE, 
				ADDONFILTERTYPE, 
				DEPRTYPE, 
				OVERRIDELIFEEXPECTANCY, 
				SORTORDER, 
				ACTIVEFLAG, 
				USEINANALYSISFLAG, 
				IMPDETAILTYPE, 
				ADDONCODE, 
				JURISDICTIONID, 
				LASTUPDATED, 
				APEXLINKFLAG, 
				TAXYEAR
				FROM [dbo].[s_tlkpimpsaddons] iao
			INNER JOIN DUPE_VALUES DV 
			ON iao.ADDONDESCRIPTION = DV.ADDONDESCRIPTION;
			

--------------------------------------------------------------------------------


            END




		END
	



GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkpimpsocctype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ==============================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TLKPIMPSOCCTYPE table
-- ==============================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPLEATYPE

1.  OCCCODE – must be unique
     
2.	OCCCODEDESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpimpsocctype]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	--  OCCCODE – must be unique
	
	WITH DUPE_VALUES AS (SELECT distinct OCCCODE FROM [asr_staging].[s_tlkpimpsocctype] GROUP BY OCCCODE HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpimpsocctype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, OCCCODE, OCCCODEDESCRIPTION, ABSTRACTCODE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'OCCCODE',
				'FIELD MUST BE UNIQUE',
				'OCCCODE MUST BE UNIQUE',
				@lv_RUNTIME, 
				ioc.OCCCODE, 
				OCCCODEDESCRIPTION, 
				ABSTRACTCODE, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpimpsocctype] ioc
			INNER JOIN DUPE_VALUES DV 
			ON  ioc.OCCCODE = DV.OCCCODE;
	

-------------------------------------------------------------------------------


	--  OCCCODEDESCRIPTION – must be unique

	WITH DUPE_VALUES AS (SELECT distinct OCCCODEDESCRIPTION FROM [asr_staging].[s_tlkpimpsocctype] GROUP BY OCCCODEDESCRIPTION HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpimpsocctype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, OCCCODE, OCCCODEDESCRIPTION, ABSTRACTCODE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'OCCCODEDESCRIPTION',
				'FIELD MUST BE UNIQUE',
				'OCCCODEDESCRIPTION MUST BE UNIQUE',
				@lv_RUNTIME,
				OCCCODE, 
				ioc.OCCCODEDESCRIPTION, 
				ABSTRACTCODE, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpimpsocctype] ioc
			INNER JOIN DUPE_VALUES DV 
			ON  ioc.OCCCODEDESCRIPTION = DV.OCCCODEDESCRIPTION;
			


--------------------------------------------------------------------------------

            END


	END	



GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkpimpsocctype_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TLKPIMPSOCCTYPE
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TLKPIMPSOCCTYPE

1.  OCCCODE – must be unique
     
2.	OCCCODEDESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpimpsocctype_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TLKPIMPSOCCTYPE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tlkpimpsocctype]
	TRUNCATE TABLE [dqm].[s_tlkpimpsocctype_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	


	-- for OCCCODE – must be unique

	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODE
		)	
			VALUES 
				(
				144
				);


	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODE
		)	
			VALUES 
				(
				144
				);



	-- for OCCCODEDESCRIPTION – must be unique

	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODEDESCRIPTION
		)	
			VALUES 
				(
				'Grain Hopper'
				);


	INSERT INTO [asr_staging].[s_tlkpimpsocctype]
		(
		OCCCODEDESCRIPTION
		)	
			VALUES 
				(
				'Grain Hopper'
				);


	
	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tlkpimpsocctype]

--------------------------------------------------------------------------------
-- compare record counts in s_tlkpimpsocctype and s_tlkpimpsocctype_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tlkpimpsocctype])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tlkpimpsocctype_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME
 
insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'OCCCODE and OCCCODEDESCRIPTION must be unique');




END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkpleatype]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =========================================================
-- Author:	David Guillen
-- Create date: 2/25/2016
-- Description:	DQM stored procedure for S_TLKPLEATYPE table
-- =========================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPLEATYPE

1.	LEADESCRIPTION - cannot be NULL

2.  LEA – must be unique
     
3.	The combination of LEA and LEADESCRIPTION – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tlkpleatype]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	-- LEADESCRIPTION - cannot be NULL DQM check
	
	INSERT INTO [dqm].[s_tlkpleatype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, LEA, LEADESCRIPTION, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'LEADESCRIPTION',
				'FIELD CANNOT BE NULL',
				'LEADESCRIPTION CANNOT BE NULL',
				@lv_RUNTIME,
				LEA, 
				LEADESCRIPTION, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpleatype]
			WHERE LEADESCRIPTION IS NULL
			OR LEADESCRIPTION = '';

------------------------------------------------------------------------------

	--  LEA – must be unique
	
	WITH DUPE_VALUES AS (SELECT distinct LEA FROM [asr_staging].[s_tlkpleatype] GROUP BY LEA HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpleatype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, LEA, LEADESCRIPTION, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'LEA',
				'FIELD MUST BE UNIQUE',
				'LEA MUST BE UNIQUE',
				@lv_RUNTIME, 
				lea.LEA, 
				LEADESCRIPTION, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpleatype] lea
			INNER JOIN DUPE_VALUES DV 
			ON  lea.LEA = DV.LEA;
	

-------------------------------------------------------------------------------


	-- The combination of LEA and LEADESCRIPTION – must be unique

	WITH DUPE_VALUES AS (SELECT distinct LEA,LEADESCRIPTION FROM [asr_staging].[s_tlkpleatype] GROUP BY LEA,LEADESCRIPTION HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tlkpleatype_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, LEA, LEADESCRIPTION, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED)
	    SELECT 
				'LEA and LEADESCRIPTION',
				'COMBINATION OF TWO FIELDS MUST BE UNIQUE',
				'LEA and LEADESCRIPTION MUST BE UNIQUE',
				@lv_RUNTIME,
				lea.LEA, 
				lea.LEADESCRIPTION, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED
			FROM [asr_staging].[s_tlkpleatype] lea
			INNER JOIN DUPE_VALUES DV 
			ON  lea.LEA = DV.LEA
			and lea.LEADESCRIPTION = DV.LEADESCRIPTION;


--------------------------------------------------------------------------------

            END


	END
	


GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkpleatype_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for S_TLKPLEATYPE
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TLKPLEATYPE

1.	LEADESCRIPTION - cannot be NULL

2.  LEA – must be unique
     
3.	The combination of LEA and LEADESCRIPTION – must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tlkpleatype_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TLKPLEATYPE'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tlkpleatype]
	TRUNCATE TABLE [dqm].[s_tlkpleatype_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- for LEADESCRIPTION - cannot be NULL and also checking for empty string

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEADESCRIPTION
		)	
			VALUES 
				(
				NULL
				);

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEADESCRIPTION
		)	
			VALUES 
				(
				''
				);


	-- for LEA – must be unique

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA
		)	
			VALUES 
				(
				'110013'
				);


	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA
		)	
			VALUES 
				(
				'110013'
				);



	-- for The combination of LEA and LEADESCRIPTION – must be unique

	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA,LEADESCRIPTION
		)	
			VALUES 
				(
				'110014','STONEGATE #34'
				);


	INSERT INTO [asr_staging].[s_tlkpleatype]
		(
		LEA,LEADESCRIPTION
		)	
			VALUES 
				(
				'110014','STONEGATE #34'
				);


	
	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tlkpleatype]

--------------------------------------------------------------------------------
-- compare record counts in s_tlkpleatype and s_tlkpleatype_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tlkpleatype])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tlkpleatype_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 4 then 'PASS' else 'FAIL' end,getdate(),'LEADESCRIPTION cannot be NULL. LEA must be unique. The combination of LEA and LEADESCRIPTION must be unique');



END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tlkptaxauthority]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dqm].[dqm_s_tlkptaxauthority]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table.

----------------------------------------------------------------------------------
	-- AUTHORITYTYPE – must be 50 characters or less DQM check
	
	INSERT INTO [dbo].[s_tlkptaxauthority_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, TAXAUTHORITY, STATEAUTHORITYCODE, AUTHORITYTYPE, AUTHORITYNAME, CREATIONDATE, CONTACTPERSON, CONTACTADDRESS1, CONTACTADDRESS2, CONTACTCITY, CONTACTSTATE, CONTACTZIPCODE, AFFILIATE, AUTHORITYSIZE, SORTORDER, ACTIVEFLAG, JURISDICTIONID, LASTUPDATED, CONTACTPHONE, AUTHORITYVALUETYPE, ISURBANRENEWALAUTHORIZERFLAG)
	    SELECT 
				'AUTHORITYTYPE',
				'FIELD MUST BE 50 CHARACTERS OR LESS',
				'AUTHORITYTYPE MUST BE 50 CHARACTERS OR LESS',
				@lv_RUNTIME,
				TAXAUTHORITY, 
				STATEAUTHORITYCODE, 
				AUTHORITYTYPE, 
				AUTHORITYNAME, 
				CREATIONDATE, 
				CONTACTPERSON, 
				CONTACTADDRESS1, 
				CONTACTADDRESS2, 
				CONTACTCITY, 
				CONTACTSTATE, 
				CONTACTZIPCODE, 
				AFFILIATE, 
				AUTHORITYSIZE, 
				SORTORDER, 
				ACTIVEFLAG, 
				JURISDICTIONID, 
				LASTUPDATED, 
				CONTACTPHONE, 
				AUTHORITYVALUETYPE, 
				ISURBANRENEWALAUTHORIZERFLAG
			FROM [dbo].[s_tlkptaxauthority]
			WHERE LEN(AUTHORITYTYPE) >= 50



--------------------------------------------------------------------------------

            END




		END
	












GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tmaptaxauthoritydetailfund]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ========================================================================
-- Author:	David Guillen
-- Create date: 2/26/2016
-- Description:	DQM stored procedure for S_TMAPTAXAUTHORITYDETAILFUND table 
-- ========================================================================


/*
DQM RULES FOR:
TABLE:  S_TMAPTAXAUTHORITYDETAILFUND

1.	    The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tmaptaxauthoritydetailfund]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	

	-- The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct TAXYEAR,FUNDCODE,LEVYTYPEID,TAXAUTHORITY FROM [asr_staging].[s_tmaptaxauthoritydetailfund] GROUP BY TAXYEAR,FUNDCODE,LEVYTYPEID,TAXAUTHORITY HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tmaptaxauthoritydetailfund_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, TAXAUTHORITY, TAXYEAR, FUNDCODE, PARENTFUNDCODE, ASSESSEDMILLLEVY, ALTERNATEMILLLEVY, REALFLAG, PPFLAG, MAXLEVYINCLUDEFLAG, SORTORDER, JURISDICTIONID, LASTUPDATED, LEVYTYPEID, TAXDISTRICTID, EXCLUDEREDUCEDRATEFLAG, INCLUDEONTAXBILLFLAG, PERMANENTRATE, BILLINGRATE, URDOTADJUSTMENTRATE, BUDGETEDTAXVALUE, BUDGETEDTAXRATE, TRUNCATIONLOSSVALUE, FUNDCATEGORYTYPEID)
	    SELECT 
				'TAXYEAR and FUNDCODE LEVYTYPEID, and TAXAUTHORITY',
				'COMBINATION OF THREE FIELDS MUST BE UNIQUE',
				'TAXYEAR and FUNDCODE LEVYTYPEID, and TAXAUTHORITY MUST BE UNIQUE',
				@lv_RUNTIME, 
				tadf.TAXAUTHORITY, 
				tadf.TAXYEAR, 
				tadf.FUNDCODE, 
				PARENTFUNDCODE, 
				ASSESSEDMILLLEVY, 
				ALTERNATEMILLLEVY, 
				REALFLAG, 
				PPFLAG, 
				MAXLEVYINCLUDEFLAG, 
				SORTORDER, 
				JURISDICTIONID, 
				LASTUPDATED, 
				tadf.LEVYTYPEID, 
				TAXDISTRICTID, 
				EXCLUDEREDUCEDRATEFLAG, 
				INCLUDEONTAXBILLFLAG, 
				PERMANENTRATE, 
				BILLINGRATE, 
				URDOTADJUSTMENTRATE, 
				BUDGETEDTAXVALUE, 
				BUDGETEDTAXRATE, 
				TRUNCATIONLOSSVALUE, 
				FUNDCATEGORYTYPEID
			FROM [asr_staging].[s_tmaptaxauthoritydetailfund] tadf
			INNER JOIN DUPE_VALUES DV 
			ON tadf.TAXYEAR = DV.TAXYEAR
			and tadf.TAXAUTHORITY = DV.TAXAUTHORITY
			and tadf.LEVYTYPEID = DV.LEVYTYPEID
			and tadf.FUNDCODE = DV.FUNDCODE;


--------------------------------------------------------------------------------


            END


	END



GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tmaptaxauthoritydetailfund_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================================================================================
-- Author:		David Guillen
-- Create date: 3/4/2016
-- Description:	Unit testing stored procedure for s_tmaptaxauthoritydetailfund
-- =====================================================================================

/*
DQM RULES FOR:
TABLE:  S_TMAPTAXAUTHORITYDETAILFUND

1.	    The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY – must be unique

*/


CREATE PROCEDURE [dqm].[dqm_s_tmaptaxauthoritydetailfund_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TMAPTAXAUTHORITYDETAILFUND'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tmaptaxauthoritydetailfund]
	TRUNCATE TABLE [dqm].[s_tmaptaxauthoritydetailfund_err]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY – must be unique


	INSERT INTO [asr_staging].[s_tmaptaxauthoritydetailfund]
		(
		TAXYEAR,FUNDCODE,LEVYTYPEID,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'GENERAL',1,'0001'
				);


	INSERT INTO [asr_staging].[s_tmaptaxauthoritydetailfund]
		(
		TAXYEAR,FUNDCODE,LEVYTYPEID,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'GENERAL',1,'0001'
				);


	
--------------------------------------------------------------------------------
--run DQM stored procedure

	exec [dqm].[dqm_s_tmaptaxauthoritydetailfund]

--------------------------------------------------------------------------------
-- compare record counts in s_tmaptaxauthoritydetailfund and s_tmaptaxauthoritydetailfund_err

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tmaptaxauthoritydetailfund])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tmaptaxauthoritydetailfund_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'The combination of TAXYEAR, FUNDCODE, LEVYTYPEID, and TAXAUTHORITY must be unique');



END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tmaptaxdistrictauthority]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =======================================================================
-- Author:		David Guillen
-- Create date: 1/22/2016
-- Description:	DQM stored procedure for S_TMAPTAXDISTRICTAUTHORITY table
-- =======================================================================


/*
DQM RULES FOR:
TABLE:  S_TMAPTAXDISTRICTAUTHORITY

1.	    The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tmaptaxdistrictauthority]
	

AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	  BEGIN
	

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	
	-- The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique DQM check

	WITH DUPE_VALUES AS (SELECT distinct TAXYEAR,TAXDISTRICT,TAXAUTHORITY  FROM [asr_staging].[s_tmaptaxdistrictauthority] GROUP BY TAXYEAR,TAXDISTRICT,TAXAUTHORITY HAVING COUNT(*) > 1)
	
	INSERT INTO [dqm].[s_tmaptaxdistrictauthority_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, TAXDISTRICT, TAXAUTHORITY, TAXYEAR, SORTORDER, JURISDICTIONID, LASTUPDATED, TIFAUTHORITY, TIFPERCENTAGE, EXCESSVALUE, EXCESSVALUENOTUSED)
	    SELECT 
				'TAXYEAR and TAXDISTRICT and TAXAUTHORITY',
				'COMBINATION OF THREE FIELDS MUST BE UNIQUE',
				'TAXYEAR and TAXDISTRICT and TAXAUTHORITY MUST BE UNIQUE',
				@lv_RUNTIME,
				tda.TAXDISTRICT, 
				tda.TAXAUTHORITY, 
				tda.TAXYEAR, 
				SORTORDER, 
				JURISDICTIONID,
				LASTUPDATED, 
				TIFAUTHORITY, 
				TIFPERCENTAGE, 
				EXCESSVALUE, 
				EXCESSVALUENOTUSED
			FROM [asr_staging].[s_tmaptaxdistrictauthority] tda
			INNER JOIN DUPE_VALUES DV 
			ON tda.TAXYEAR = DV.TAXYEAR
			and tda.TAXAUTHORITY = DV.TAXAUTHORITY
			and tda.TAXDISTRICT = DV.TAXDISTRICT;


--------------------------------------------------------------------------------



            END




		END
	














GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tmaptaxdistrictauthority_unit_test]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =====================================================================================
-- Author:		David Guillen
-- Create date: 9/16/2014
-- Description:	Unit testing stored procedure for s_tmaptaxdistrictauthority
-- =====================================================================================


/*
DQM RULES FOR:
TABLE:  S_TMAPTAXDISTRICTAUTHORITY

1	    The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique

*/

CREATE PROCEDURE [dqm].[dqm_s_tmaptaxdistrictauthority_unit_test]
	
AS
BEGIN

	DECLARE @COUNT_TABLE		int
	DECLARE @COUNT_ERR_TABLE	int
	DECLARE @TABLE_NAME			varchar(100) = 'S_TMAPTAXDISTRICTAUTHORITY'
	DECLARE @ROW_COUNT_DIFF     int

----------------------------------------------------------------------------------

	-- truncate table and error table

	TRUNCATE TABLE [asr_staging].[s_tmaptaxdistrictauthority]
	TRUNCATE TABLE [dqm].[s_tmaptaxdistrictauthority_err]
	TRUNCATE TABLE [asr_staging].[s_tlkptaxdistrict]

----------------------------------------------------------------------------------

	-- insert records into table to test DQM process	

	-- The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique

	INSERT INTO [asr_staging].[s_tmaptaxdistrictauthority]
		(
		TAXYEAR,TAXDISTRICT,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'0030','0001'
				);


	INSERT INTO [asr_staging].[s_tmaptaxdistrictauthority]
		(
		TAXYEAR,TAXDISTRICT,TAXAUTHORITY
		)	
			VALUES 
				(
				2014,'0030','0001'
				);

	
--------------------------------------------------------------------------------
--run DQM stored procedure to validate DQM checks against the data just inserted

	exec [dqm].[dqm_s_tmaptaxdistrictauthority]

--------------------------------------------------------------------------------
-- compare record counts and determine if DQM rule checks were successful

select @COUNT_TABLE = (select count(*) from [asr_staging].[s_tmaptaxdistrictauthority])

select @COUNT_ERR_TABLE = (select count(*) from [dqm].[s_tmaptaxdistrictauthority_err])

select @ROW_COUNT_DIFF =  @COUNT_ERR_TABLE - @COUNT_TABLE


delete from [dqm].[assessor_unit_test_result] 
where table_name = @TABLE_NAME

insert into [dqm].[assessor_unit_test_result] 
(table_name, table_count, error_table_count, unit_test_result,run_date,notes)
values
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'The combination of TAXYEAR, TAXDISTRICT, and TAXAUTHORITY – must be unique');





	 



 

END






GO
/****** Object:  StoredProcedure [dqm].[drop_dqm_indexes]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dqm].[drop_dqm_indexes]
as
begin


-- indexes for s_tblacct

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblacct_ClusteredIndex-accountno')
DROP INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct] WITH ( ONLINE = OFF )



-- indexes for s_tblacctpropertyaddress

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblacctpropertyaddress_accountno')
DROP INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress] WITH ( ONLINE = OFF )



-- indexes for s_tbladdresssecure

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-CITY')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-CITY] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-STATECODE')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ix_tbladdresssecure')
DROP INDEX [ix_tbladdresssecure] ON [asr_staging].[s_tbladdresssecure]





-- indexes for s_tblimps

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblimps_ClusteredIndex-accountno_impno')
DROP INDEX [s_tblimps_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimps] WITH ( ONLINE = OFF )



-- indexes for s_tblimpsbltas

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblimpsbltas_ACCOUNTNO')
DROP INDEX [IX_s_tblimpsbltas_ACCOUNTNO] ON [asr_staging].[s_tblimpsbltas]

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblimpsbltas_IMPNO')
DROP INDEX [IX_s_tblimpsbltas_IMPNO] ON [asr_staging].[s_tblimpsbltas]



-- indexes for s_tblimpsdetail

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblimpsdetail_ClusteredIndex-accountno_impno')
DROP INDEX [s_tblimpsdetail_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsdetail] WITH ( ONLINE = OFF )



-- indexes for s_tblimpsocc

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblimpsocc_ClusteredIndex-accountno_impno')
DROP INDEX [s_tblimpsocc_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsocc] WITH ( ONLINE = OFF )

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblimpsocc_impno')
DROP INDEX [IX_s_tblimpsocc_impno] ON [asr_staging].[s_tblimpsocc] WITH ( ONLINE = OFF )



-- indexes for s_tbllandabstract

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tbllandabstract_ClusteredIndex-accountno')
DROP INDEX [s_tbllandabstract_ClusteredIndex-accountno] ON [asr_staging].[s_tbllandabstract] WITH ( ONLINE = OFF )



-- indexes for s_tblpersonsecure

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblpersonsecure_NonClusteredIndex-NAME1')
DROP INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblpersonsecure_NonClusteredIndex-NAME2')
DROP INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ix_tblpersonsecure')
DROP INDEX [ix_tblpersonsecure] ON [asr_staging].[s_tblpersonsecure]



-- indexes for s_tblsale

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblsale_ClusteredIndex-receptionno')
DROP INDEX [s_tblsale_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsale] WITH ( ONLINE = OFF )



-- indexes for s_tblsaleacct

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblsaleacct_ClusteredIndex-receptionno')
DROP INDEX [s_tblsaleacct_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsaleacct] WITH ( ONLINE = OFF )



-- indexes for s_tblsubaccount

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblsubaccount_ClusteredIndex-accountno')
DROP INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount] WITH ( ONLINE = OFF )




end





GO
/****** Object:  StoredProcedure [dqm].[RUN_ALL_DQM_UNIT_TESTS]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dqm].[RUN_ALL_DQM_UNIT_TESTS]
as
begin

execute [dqm].[dqm_s_tblacct_unit_test]
execute [dqm].[dqm_s_tblacctnbhd_unit_test]
execute [dqm].[dqm_s_tblacctowneraddress_unit_test]
execute [dqm].[dqm_s_tblacctpropertyaddress_unit_test]
execute [dqm].[dqm_s_tblacctreal_unit_test]
execute [dqm].[dqm_s_tbladdresssecure_unit_test]
execute [dqm].[dqm_s_tblimps_unit_test]
execute [dqm].[dqm_s_tblimpsbltas_unit_test]
execute [dqm].[dqm_s_tblimpsdetail_unit_test]
execute [dqm].[dqm_s_tblimpsocc_unit_test]
execute [dqm].[dqm_s_tblpersonsecure_unit_test]
execute [dqm].[dqm_s_tblsale_unit_test]
execute [dqm].[dqm_s_tblsaleacct_unit_test]
execute [dqm].[dqm_s_tblsubaccount_unit_test]
execute [dqm].[dqm_s_tbnsubfiling_unit_test]
execute [dqm].[dqm_s_tlkpabstractcode_unit_test]
execute [dqm].[dqm_s_tlkpimpsocctype_unit_test]
execute [dqm].[dqm_s_tlkpleatype_unit_test]
execute [dqm].[dqm_s_tmaptaxauthoritydetailfund_unit_test]
execute [dqm].[dqm_s_tmaptaxdistrictauthority_unit_test]

end;




GO
/****** Object:  StoredProcedure [trn].[sp_account_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/27/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the account table
			  Update dqm.valid_account
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.account AS myTarget
USING trn.v_etl_account AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.state_parcel_no = mySource.state_parcel_no
		          ,myTarget.tax_district_no = mySource.tax_district_no
				  ,myTarget.sub_filing_recording_no = mySource.sub_filing_recording_no
				  ,myTarget.account_type = mySource.account_type
				  ,myTarget.appraisal_type = mySource.appraisal_type
				  ,myTarget.account_status = mySource.account_status
				  ,myTarget.account_status_description = mySource.account_status_description
				  ,myTarget.legal_description = mySource.legal_description
				  ,myTarget.longitude_x = mySource.longitude_x
				  ,myTarget.latitude_y = mySource.latitude_y
				  ,myTarget.elevation_z = mySource.elevation_z
				  ,myTarget.location = mySource.location
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,state_parcel_no
	        ,tax_district_no
	        ,sub_filing_recording_no
	        ,account_type
	        ,appraisal_type
	        ,account_status
	        ,account_status_description
	        ,legal_description
	        ,longitude_x
	        ,latitude_y
			,elevation_z
	        ,location
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.account_no 
            ,mySource.state_parcel_no
	        ,mySource.tax_district_no
	        ,mySource.sub_filing_recording_no
	        ,mySource.account_type
	        ,mySource.appraisal_type
	        ,mySource.account_status
	        ,mySource.account_status_description
	        ,mySource.legal_description
	        ,mySource.longitude_x
	        ,mySource.latitude_y
			,mySource.elevation_z
	        ,mySource.location
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

-- dqm.valid_account contains a list of accounts that are published to the assessor data store
-- trn views will join to this table to ensure that only valid accounts are published to the data store
TRUNCATE TABLE dqm.valid_account;
INSERT INTO dqm.valid_account
            (account_no, create_datetime, create_user_id )
SELECT a.account_no, GETDATE(), SUSER_NAME()
FROM assessor_datastore.asr_datastore.account a;




GO
/****** Object:  StoredProcedure [trn].[sp_account_neighborhood_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [trn].[sp_account_neighborhood_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/1/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the account_neighborhood table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.account_neighborhood AS myTarget
USING trn.v_etl_account_neighborhood AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.neighborhood_code = mySource.neighborhood_code
AND myTarget.property_type = mySource.property_type
AND myTarget.neighborhood_extension = mySource.neighborhood_extension

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,neighborhood_code
	        ,property_type
	        ,neighborhood_extension
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.account_no 
            ,mySource.neighborhood_code
	        ,mySource.property_type
	        ,mySource.neighborhood_extension	 
			,mySource.create_datetime
			,mySource.create_user_id			      
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





GO
/****** Object:  StoredProcedure [trn].[sp_account_owner_address_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [trn].[sp_account_owner_address_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/27/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the account_owner_address table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.account_owner_address AS myTarget
USING trn.v_etl_account_owner_address AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.person_code = mySource.person_code
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.primary_owner_flag = mySource.primary_owner_flag
		          ,myTarget.owner_name = mySource.owner_name
				  ,myTarget.ownership_percent = mySource.ownership_percent
				  ,myTarget.federal_id_no = mySource.federal_id_no
				  ,myTarget.address_line_1 = mySource.address_line_1
				  ,myTarget.address_line_2 = mySource.address_line_2
				  ,myTarget.city_name = mySource.city_name
				  ,myTarget.state = mySource.state
				  ,myTarget.zip_code = mySource.zip_code
				  ,myTarget.country = mySource.country
				  ,myTarget.private_flag = mySource.private_flag
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,person_code
	        ,primary_owner_flag
	        ,owner_name
	        ,ownership_percent
	        ,federal_id_no
	        ,address_line_1
	        ,address_line_2
	        ,city_name
	        ,state
	        ,zip_code
	        ,country
			,private_flag
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.account_no 
	        ,mySource.person_code
	        ,mySource.primary_owner_flag
	        ,mySource.owner_name
	        ,mySource.ownership_percent
	        ,mySource.federal_id_no
	        ,mySource.address_line_1
	        ,mySource.address_line_2
	        ,mySource.city_name
	        ,mySource.state
	        ,mySource.zip_code
	        ,mySource.country
			,mySource.private_flag
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




GO
/****** Object:  StoredProcedure [trn].[sp_account_property_address_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [trn].[sp_account_property_address_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/27/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the account_property_address table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.account_property_address AS myTarget
USING trn.v_etl_account_property_address AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.order_no = mySource.order_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.account_no = mySource.account_no
		          ,myTarget.order_no = mySource.order_no
			      ,myTarget.primary_address_flag = mySource.primary_address_flag
			      ,myTarget.building_no = mySource.building_no
			      ,myTarget.unit_no = mySource.unit_no
			      ,myTarget.unit_designator = mySource.unit_designator
			      ,myTarget.address_number = mySource.address_number
			      ,myTarget.address_number_suffix = mySource.address_number_suffix
			      ,myTarget.pre_direction_code = mySource.pre_direction_code
			      ,myTarget.street_name = mySource.street_name
			      ,myTarget.street_type_code = mySource.street_type_code
			      ,myTarget.post_direction_code = mySource.post_direction_code
			      ,myTarget.city_name = mySource.city_name
			      ,myTarget.location_zip_code = mySource.location_zip_code
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
		    ,order_no 
			,primary_address_flag 
			,building_no 
			,unit_no 
			,unit_designator 
			,address_number 
			,address_number_suffix 
			,pre_direction_code 
			,street_name 
			,street_type_code 
			,post_direction_code 
			,city_name 
			,location_zip_code 
	        ,create_datetime 
			,create_user_id 
	        ,rowhash 
            )
     VALUES (mySource.account_no 
		    ,mySource.order_no
			,mySource.primary_address_flag
			,mySource.building_no
			,mySource.unit_no
			,mySource.unit_designator
			,mySource.address_number
			,mySource.address_number_suffix
			,mySource.pre_direction_code
			,mySource.street_name
			,mySource.street_type_code
			,mySource.post_direction_code
			,mySource.city_name
			,mySource.location_zip_code
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




GO
/****** Object:  StoredProcedure [trn].[sp_etl_parameter_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_etl_parameter_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/17/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the etl_parameter table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.etl_parameter AS myTarget
USING trn.v_etl_etl_parameter AS mySource
ON myTarget.parameter_name = mySource.parameter_name
WHEN MATCHED 
	 THEN
        UPDATE SET myTarget.parameter_value = mySource.parameter_value
			      ,myTarget.parameter_description = mySource.parameter_description
				  ,myTarget.create_datetime = mySource.create_datetime
				  ,myTarget.create_user_id = mySource.create_user_id
				  ,myTarget.update_datetime = mySource.update_datetime
			      ,myTarget.update_user_id = mySource.update_user_id


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (parameter_name
	        ,parameter_value
			,parameter_description
			,create_datetime
			,create_user_id
			,update_datetime
			,update_user_id
            )
     VALUES (mySource.parameter_name 
            ,mySource.parameter_value
			,mySource.parameter_description
            ,mySource.create_datetime
            ,mySource.create_user_id
            ,mySource.update_datetime
            ,mySource.update_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





GO
/****** Object:  StoredProcedure [trn].[sp_improvement_built_as_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_improvement_built_as_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/3/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the improvement_build_as table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.improvement_built_as AS myTarget
USING trn.v_etl_improvement_built_as AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
AND myTarget.built_as_detail_id = mySource.built_as_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.built_as_detail_id = mySource.built_as_detail_id
                  ,myTarget.built_as_code = mySource.built_as_code 
                  ,myTarget.built_as_code_description = mySource.built_as_code_description
                  ,myTarget.hvac_percent = mySource.hvac_percent
                  ,myTarget.exterior_construction_type = mySource.exterior_construction_type
                  ,myTarget.interior_finish_type = mySource.interior_finish_type
                  ,myTarget.no_of_story = mySource.no_of_story
                  ,myTarget.typical_story_height = mySource.typical_story_height
                  ,myTarget.built_as_height = mySource.built_as_height
                  ,myTarget.roof_construction_type = mySource.roof_construction_type
                  ,myTarget.roof_material_type = mySource.roof_material_type
                  ,myTarget.floor_material_type = mySource.floor_material_type
                  ,myTarget.room_count = mySource.room_count
                  ,myTarget.bedroom_count = mySource.bedroom_count
                  ,myTarget.total_unit_count = mySource.total_unit_count
                  ,myTarget.class_code = mySource.class_code
                  ,myTarget.class_code_description = mySource.class_code_description
                  ,myTarget.built_year = mySource.built_year
                  ,myTarget.remodeled_year = mySource.remodeled_year
                  ,myTarget.remodeled_percent = mySource.remodeled_percent
                  ,myTarget.effective_age = mySource.effective_age
                  ,myTarget.built_as_sf = mySource.built_as_sf
                  ,myTarget.sprinkler_coverage_sf = mySource.sprinkler_coverage_sf
                  ,myTarget.bathroom_count = mySource.bathroom_count
                  ,myTarget.heat_type = mySource.heat_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             account_no
            ,improvement_no
            ,built_as_detail_id
            ,built_as_code 
            ,built_as_code_description
            ,hvac_percent
            ,exterior_construction_type
            ,interior_finish_type
            ,no_of_story
            ,typical_story_height
            ,built_as_height
            ,roof_construction_type
            ,roof_material_type
            ,floor_material_type
            ,room_count
            ,bedroom_count
            ,total_unit_count
            ,class_code
            ,class_code_description
            ,built_year
            ,remodeled_year
            ,remodeled_percent
            ,effective_age
            ,built_as_sf
            ,sprinkler_coverage_sf
            ,bathroom_count
            ,heat_type
	        ,create_datetime 
			,create_user_id 
	        ,rowhash 
            )
     VALUES (
             mySource.account_no
            ,mySource.improvement_no
            ,mySource.built_as_detail_id
            ,mySource.built_as_code 
            ,mySource.built_as_code_description
            ,mySource.hvac_percent
            ,mySource.exterior_construction_type
            ,mySource.interior_finish_type
            ,mySource.no_of_story
            ,mySource.typical_story_height
            ,mySource.built_as_height
            ,mySource.roof_construction_type
            ,mySource.roof_material_type
            ,mySource.floor_material_type
            ,mySource.room_count
            ,mySource.bedroom_count
            ,mySource.total_unit_count
            ,mySource.class_code
            ,mySource.class_code_description
            ,mySource.built_year
            ,mySource.remodeled_year
            ,mySource.remodeled_percent
            ,mySource.effective_age
            ,mySource.built_as_sf
            ,mySource.sprinkler_coverage_sf
            ,mySource.bathroom_count
            ,mySource.heat_type
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







GO
/****** Object:  StoredProcedure [trn].[sp_improvement_detail_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [trn].[sp_improvement_detail_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/2/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the improvement_detail table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.improvement_detail AS myTarget
USING trn.v_etl_improvement_detail AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
AND myTarget.improvement_detail_id = mySource.improvement_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.improvement_detail_id = mySource.improvement_detail_id
                  ,myTarget.improvement_detail_type = mySource.improvement_detail_type
                  ,myTarget.improvement_detail_type_description = mySource.improvement_detail_type_description
                  ,myTarget.detail_unit_count = mySource.detail_unit_count
                  ,myTarget.addon_code = mySource.addon_code
                  ,myTarget.addon_code_description = mySource.addon_code_description
                  ,myTarget.detail_built_year = mySource.detail_built_year
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
            ,improvement_no
            ,improvement_detail_id
            ,improvement_detail_type
            ,improvement_detail_type_description
            ,detail_unit_count
            ,addon_code
            ,addon_code_description
            ,detail_built_year
	        ,create_datetime 
			,create_user_id 
	        ,rowhash 
            )
     VALUES (mySource.account_no
            ,mySource.improvement_no
            ,mySource.improvement_detail_id
            ,mySource.improvement_detail_type
            ,mySource.improvement_detail_type_description
            ,mySource.detail_unit_count
            ,mySource.addon_code
            ,mySource.addon_code_description
            ,mySource.detail_built_year
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;






GO
/****** Object:  StoredProcedure [trn].[sp_improvement_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [trn].[sp_improvement_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/2/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the improvement table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.improvement AS myTarget
USING trn.v_etl_improvement AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.completed_percent = mySource.completed_percent
                  ,myTarget.improvement_quality = mySource.improvement_quality
                  ,myTarget.improvement_perimeter = mySource.improvement_perimeter
                  ,myTarget.improvement_sf = mySource.improvement_sf
                  ,myTarget.improvement_net_sf = mySource.improvement_net_sf
                  ,myTarget.property_type = mySource.property_type
                  ,myTarget.condition_type = mySource.condition_type
                  ,myTarget.approach_type = mySource.approach_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
            ,improvement_no
            ,completed_percent
            ,improvement_quality
            ,improvement_perimeter
            ,improvement_sf
            ,improvement_net_sf
            ,property_type
            ,condition_type
            ,approach_type
	        ,create_datetime 
			,create_user_id 
	        ,rowhash 
            )
     VALUES (mySource.account_no
            ,mySource.improvement_no
            ,mySource.completed_percent
            ,mySource.improvement_quality
            ,mySource.improvement_perimeter
            ,mySource.improvement_sf
            ,mySource.improvement_net_sf
            ,mySource.property_type
            ,mySource.condition_type
            ,mySource.approach_type
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





GO
/****** Object:  StoredProcedure [trn].[sp_improvement_occupancy_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [trn].[sp_improvement_occupancy_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     3/3/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the improvement_occupancy table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.improvement_occupancy AS myTarget
USING trn.v_etl_improvement_occupancy AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.improvement_no = mySource.improvement_no
AND myTarget.occupancy_detail_id =  mySource.occupancy_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET   
                   myTarget.account_no = mySource.account_no
                  ,myTarget.improvement_no = mySource.improvement_no
                  ,myTarget.occupancy_detail_id = mySource.occupancy_detail_id
                  ,myTarget.occupancy_code = mySource.occupancy_code
                  ,myTarget.occupancy_code_description = mySource.occupancy_code_description
                  ,myTarget.occupancy_percent = mySource.occupancy_percent
                  ,myTarget.abstract_code = mySource.abstract_code
                  ,myTarget.abstract_code_description = mySource.abstract_code_description
                  ,myTarget.abstract_value = mySource.abstract_value
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (   
             account_no
            ,improvement_no
            ,occupancy_detail_id
            ,occupancy_code
            ,occupancy_code_description
            ,occupancy_percent
            ,abstract_code
            ,abstract_code_description
            ,abstract_value
	        ,create_datetime 
			,create_user_id 
	        ,rowhash 
            )
     VALUES ( 
             mySource. account_no
            ,mySource.improvement_no
            ,mySource.occupancy_detail_id
            ,mySource.occupancy_code
            ,mySource.occupancy_code_description
            ,mySource.occupancy_percent
            ,mySource.abstract_code
            ,mySource.abstract_code_description
            ,mySource.abstract_value
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







GO
/****** Object:  StoredProcedure [trn].[sp_land_abstract_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [trn].[sp_land_abstract_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the land_abstract table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.land_abstract AS myTarget
USING trn.v_etl_land_abstract AS mySource
ON   myTarget.account_no = mySource.account_no
AND  myTarget.abstract_code = mySource.abstract_code
AND  myTarget.land_abstract_detail_id = mySource.land_abstract_detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET
         myTarget.abstract_code = mySource.abstract_code
        ,myTarget.land_abstract_detail_id = mySource.land_abstract_detail_id
        ,myTarget.land_type = mySource.land_type
        ,myTarget.land_acres = mySource.land_acres
        ,myTarget.land_sf = mySource.land_sf
        ,myTarget.land_unit_count = mySource.land_unit_count
        ,myTarget.land_value_per = mySource.land_value_per
        ,myTarget.land_value = mySource.land_value
        ,myTarget.land_override_flag = mySource.land_override_flag
        ,myTarget.land_override_total = mySource.land_override_total
        ,myTarget.land_actual_value = mySource.land_actual_value
        ,myTarget.land_class = mySource.land_class
        ,myTarget.land_subclass = mySource.land_subclass
        ,myTarget.land_valued_by = mySource.land_valued_by
        ,myTarget.land_value_measure = mySource.land_value_measure
		,myTarget.update_datetime = GETDATE()
		,myTarget.update_user_id = SUSER_NAME()
		,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
            ,abstract_code
            ,land_abstract_detail_id
            ,land_type
            ,land_acres
            ,land_sf
            ,land_unit_count
            ,land_value_per
            ,land_value
            ,land_override_flag
            ,land_override_total
            ,land_actual_value
            ,land_class
            ,land_subclass
            ,land_valued_by
            ,land_value_measure
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES ( 
             mySource.account_no
            ,mySource.abstract_code
            ,mySource.land_abstract_detail_id
            ,mySource.land_type
            ,mySource.land_acres
            ,mySource.land_sf
            ,mySource.land_unit_count
            ,mySource.land_value_per
            ,mySource.land_value
            ,mySource.land_override_flag
            ,mySource.land_override_total
            ,mySource.land_actual_value
            ,mySource.land_class
            ,mySource.land_subclass
            ,mySource.land_valued_by
            ,mySource.land_value_measure
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;



GO
/****** Object:  StoredProcedure [trn].[sp_real_account_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_real_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the real_account table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.real_account AS myTarget
USING trn.v_etl_real_account AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET
		 myTarget.vacant_flag = mySource.vacant_flag
		,myTarget.improvement_only_flag = mySource.improvement_only_flag
		,myTarget.tif_flag = mySource.tif_flag
		,myTarget.zoning_code = mySource.zoning_code
		,myTarget.zoning_code_description = mySource.zoning_code_description
		,myTarget.platted_flag = mySource.platted_flag
		,myTarget.default_lea = mySource.default_lea
		,myTarget.default_lea_description = mySource.default_lea_description
		,myTarget.total_improvement_interest_percent = mySource.total_improvement_interest_percent
		,myTarget.total_land_interest_percent = mySource.total_land_interest_percent
		,myTarget.update_datetime = GETDATE()
		,myTarget.update_user_id = SUSER_NAME()
		,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
            ,vacant_flag
            ,improvement_only_flag
            ,tif_flag
            ,zoning_code
            ,zoning_code_description
            ,platted_flag
            ,default_lea
            ,default_lea_description
			,total_improvement_interest_percent
			,total_land_interest_percent
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.account_no 
            ,mySource.vacant_flag
            ,mySource.improvement_only_flag
            ,mySource.tif_flag
            ,mySource.zoning_code
            ,mySource.zoning_code_description
            ,mySource.platted_flag
            ,mySource.default_lea
            ,mySource.default_lea_description
			,mySource.total_improvement_interest_percent
			,mySource.total_land_interest_percent
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







GO
/****** Object:  StoredProcedure [trn].[sp_sale_account_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [trn].[sp_sale_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/25/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the sale_account table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.sale_account AS myTarget
USING trn.v_etl_sale_account AS mySource
ON myTarget.recording_no = mySource.recording_no
AND myTarget.account_no = mySource.account_no

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             recording_no
            ,account_no
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.recording_no
            ,mySource.account_no
	        ,mySource.create_datetime
			,mySource.create_user_id
	        ,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;






GO
/****** Object:  StoredProcedure [trn].[sp_sale_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_sale_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/24/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the sale table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.sale AS myTarget
USING trn.v_etl_sale AS mySource
ON myTarget.recording_no = mySource.recording_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.grantor = mySource.grantor
                  ,myTarget.grantee = mySource.grantee
                  ,myTarget.sale_date = mySource.sale_date
                  ,myTarget.deed_code = mySource.deed_code
                  ,myTarget.deed_code_description = mySource.deed_code_description
                  ,myTarget.sale_price = mySource.sale_price
                  ,myTarget.valid1_flag = mySource.valid1_flag
                  ,myTarget.confirmed_flag = mySource.confirmed_flag
                  ,myTarget.exclude_code_1 = mySource.exclude_code_1
                  ,myTarget.exclude_code_1_description = mySource.exclude_code_1_description 
                  ,myTarget.improved_flag = mySource.improved_flag
                  ,myTarget.non_sale_flag = mySource.non_sale_flag
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             recording_no
            ,grantor
            ,grantee
            ,sale_date
            ,deed_code
            ,deed_code_description
            ,sale_price
            ,valid1_flag
            ,confirmed_flag
            ,exclude_code_1
            ,exclude_code_1_description
            ,improved_flag
            ,non_sale_flag
	        ,create_datetime
			,create_user_id
	        ,rowhash
            )
     VALUES (mySource.recording_no
            ,mySource.grantor
            ,mySource.grantee
            ,mySource.sale_date
            ,mySource.deed_code
            ,mySource.deed_code_description
            ,mySource.sale_price
            ,mySource.valid1_flag
            ,mySource.confirmed_flag
            ,mySource.exclude_code_1
            ,mySource.exclude_code_1_description
            ,mySource.improved_flag
            ,mySource.non_sale_flag
	        ,mySource.create_datetime
			,mySource.create_user_id
	        ,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;






GO
/****** Object:  StoredProcedure [trn].[sp_sub_filing_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_sub_filing_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/27/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the sub_filing table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.sub_filing AS myTarget
USING trn.v_etl_sub_filing AS mySource
ON myTarget.sub_filing_recording_no = mySource.sub_filing_recording_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.subdivision_no = mySource.subdivision_no
		          ,myTarget.subdivision_name = mySource.subdivision_name
				  ,myTarget.filing_no = mySource.filing_no
				  ,myTarget.filing_description = mySource.filing_description
				  ,myTarget.dedicated_sub_filing_name = mySource.dedicated_sub_filing_name
				  ,myTarget.rowhash = mySource.rowhash
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
	


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (sub_filing_recording_no
	        ,subdivision_no
			,subdivision_name
			,filing_no
			,filing_description
			,dedicated_sub_filing_name
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES (mySource.sub_filing_recording_no
	        ,mySource.subdivision_no
			,mySource.subdivision_name
			,mySource.filing_no
			,mySource.filing_description
			,mySource.dedicated_sub_filing_name
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




GO
/****** Object:  StoredProcedure [trn].[sp_tax_authority_fund_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [trn].[sp_tax_authority_fund_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_authority table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.tax_authority_fund AS myTarget
USING trn.v_etl_tax_authority_fund AS mySource
ON myTarget.tax_authority_no = mySource.tax_authority_no
AND myTarget.tax_fund_code = mySource.tax_fund_code
AND myTarget.levy_type_id = mySource.levy_type_id
WHEN MATCHED 
     AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET 
                   myTarget.tax_authority_no = mySource.tax_authority_no
                  ,myTarget.tax_fund_code = mySource.tax_fund_code
                  ,myTarget.levy_type_id = mySource.levy_type_id
                  ,myTarget.levy_type = mySource.levy_type
                  ,myTarget.assessed_mill_levy = mySource.assessed_mill_levy
                  ,myTarget.tax_fund_description = mySource.tax_fund_description		
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             tax_authority_no
            ,tax_fund_code
            ,levy_type_id
            ,levy_type
            ,assessed_mill_levy
            ,tax_fund_description
			,create_datetime
			,create_user_id
            )
     VALUES (
             mySource.tax_authority_no
            ,mySource.tax_fund_code
            ,mySource.levy_type_id
            ,mySource.levy_type
            ,mySource.assessed_mill_levy
            ,mySource.tax_fund_description
            ,mySource.create_datetime
            ,mySource.create_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





GO
/****** Object:  StoredProcedure [trn].[sp_tax_authority_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_tax_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_authority table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.tax_authority AS myTarget
USING trn.v_etl_tax_authority AS mySource
ON myTarget.tax_authority_no = mySource.tax_authority_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.tax_authority_name = mySource.tax_authority_name
		          ,myTarget.authority_type = mySource.authority_type
                  ,myTarget.contact_person  = mySource.contact_person
                  ,myTarget.contact_address_line_1  = mySource.contact_address_line_1
                  ,myTarget.contact_address_line_2  = mySource.contact_address_line_2
                  ,myTarget.contact_city_name  = mySource.contact_city_name
                  ,myTarget.contact_state  = mySource.contact_state
                  ,myTarget.contact_zip_code  = mySource.contact_zip_code
                  ,myTarget.active_flag  = mySource.active_flag
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_authority_no
	        ,tax_authority_name
			,authority_type
            ,contact_person
            ,contact_address_line_1
            ,contact_address_line_2
            ,contact_city_name
            ,contact_state
            ,contact_zip_code
            ,active_flag
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES (mySource.tax_authority_no 
            ,mySource.tax_authority_name
			,mySource.authority_type
            ,mySource.contact_person
            ,mySource.contact_address_line_1
            ,mySource.contact_address_line_2
            ,mySource.contact_city_name
            ,mySource.contact_state
            ,mySource.contact_zip_code
            ,mySource.active_flag
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




GO
/****** Object:  StoredProcedure [trn].[sp_tax_district_authority_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [trn].[sp_tax_district_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_district_authority table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.tax_district_authority AS myTarget
USING trn.v_etl_tax_district_authority AS mySource
ON  myTarget.tax_district_no = mySource.tax_district_no
AND myTarget.tax_authority_no = mySource.tax_authority_no

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_district_no
	        ,tax_authority_no
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.tax_district_no 
            ,mySource.tax_authority_no
            ,mySource.create_datetime
            ,mySource.create_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
     DELETE;




GO
/****** Object:  StoredProcedure [trn].[sp_tax_district_insert]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [trn].[sp_tax_district_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_district table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.tax_district AS myTarget
USING trn.v_etl_tax_district AS mySource
ON myTarget.tax_district_no = mySource.tax_district_no
WHEN MATCHED 
     AND ISNULL(RTRIM(myTarget.tax_district_name), 'DBNULL_TEXT') <> ISNULL(RTRIM(mySource.tax_district_name), 'DBNULL_TEXT') 
	 THEN
        UPDATE SET myTarget.tax_district_name = mySource.tax_district_name
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_district_no
	        ,tax_district_name
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.tax_district_no 
            ,mySource.tax_district_name
            ,mySource.create_datetime
            ,mySource.create_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




GO
/****** Object:  Trigger [asr_staging].[trg_upd_etl_parameter]    Script Date: 4/14/2016 11:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Guillen
-- Create date: 02/16/2016
-- Description:	trigger will update columns UPDATE_DTM and UPDATE_USER_ID
--              in table asr_staging.etl_parameter
--              after any update to this table
-- =============================================
CREATE TRIGGER [asr_staging].[trg_upd_etl_parameter] 
   ON  [asr_staging].[etl_parameter] 
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	update asr_staging.etl_parameter
		SET [UPDATE_DTM] = getdate(),
		[UPDATE_USER_ID] = SUSER_NAME()
			from asr_staging.etl_parameter e 
			INNER JOIN inserted i
				on e.PARAMETER_NAME = i.PARAMETER_NAME


END




GO
USE [master]
GO
ALTER DATABASE [assessor_staging] SET  READ_WRITE 
GO
