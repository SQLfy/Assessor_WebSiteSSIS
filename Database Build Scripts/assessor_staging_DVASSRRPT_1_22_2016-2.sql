USE [master]
GO
/****** Object:  Database [assessor_staging]    Script Date: 1/22/2016 2:54:31 PM ******/
CREATE DATABASE [assessor_staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_staging', FILENAME = N'E:\Data\assessor_staging.mdf' , SIZE = 412672KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_staging_log', FILENAME = N'E:\Logs\assessor_staging_log.ldf' , SIZE = 1108800KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Schema [asr_staging]    Script Date: 1/22/2016 2:54:32 PM ******/
CREATE SCHEMA [asr_staging]
GO
/****** Object:  Schema [dqm]    Script Date: 1/22/2016 2:54:32 PM ******/
CREATE SCHEMA [dqm]
GO
/****** Object:  Schema [trn]    Script Date: 1/22/2016 2:54:32 PM ******/
CREATE SCHEMA [trn]
GO
/****** Object:  Table [asr_staging].[s_account_location]    Script Date: 1/22/2016 2:54:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[s_account_location](
	[Account_Number] [varchar](50) NULL,
	[State_Parcel_number] [nvarchar](15) NULL,
	[x] [numeric](30, 8) NULL,
	[y] [numeric](30, 8) NULL,
	[Location] [nvarchar](32) NULL,
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_tblacct]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Index [s_tblacct_ClusteredIndex-accountno]    Script Date: 1/22/2016 2:54:32 PM ******/
CREATE CLUSTERED INDEX [s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblacctnbhd]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctowneraddress]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctpropertyaddress]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Index [IX_s_tblacctpropertyaddress_accountno]    Script Date: 1/22/2016 2:54:32 PM ******/
CREATE CLUSTERED INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tbladdresssecure]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblpersonsecure]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblsubaccount]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tbnsubdivision]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tbnsubfiling]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkpaccttype]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkpstatusacct]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxauthority]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxauthoritydetail]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxdistrict]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [asr_staging].[s_tmaptaxdistrictauthority]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tblacct_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tblacctnbhd_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tblacctowneraddress_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
	[ETL_RUN_TIME] [datetime2](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblacctpropertyaddress_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tbladdresssecure_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tblpersonsecure_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tblsubaccount_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tbnsubfiling_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  Table [dqm].[s_tmaptaxdistrictauthority_err]    Script Date: 1/22/2016 2:54:32 PM ******/
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
ALTER TABLE [dqm].[s_tblacct_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblacctnbhd_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblacctowneraddress_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblacctpropertyaddress_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tbladdresssecure_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblpersonsecure_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tblsubaccount_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tbnsubfiling_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
ALTER TABLE [dqm].[s_tmaptaxdistrictauthority_err] ADD  DEFAULT (getdate()) FOR [ETL_RUN_TIME]
GO
/****** Object:  StoredProcedure [asr_staging].[select_count_staging_tables]    Script Date: 1/22/2016 2:54:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [asr_staging].[select_count_staging_tables]
as
begin

select count(*) from asr_staging.s_tblacct;
select count(*) from asr_staging.s_tblacctnbhd;
select count(*) from asr_staging.s_tblacctowneraddress;
select count(*) from asr_staging.s_tblacctpropertyaddress;
select count(*) from asr_staging.s_tblsubaccount;

select count(*) from asr_staging.s_tbladdresssecure;
select count(*) from asr_staging.s_tblpersonsecure;

select count(*) from asr_staging.s_tbnsubdivision;
select count(*) from asr_staging.s_tbnsubfiling;

select count(*) from asr_staging.s_tlkpaccttype;
select count(*) from asr_staging.s_tlkpstatusacct;
select count(*) from asr_staging.s_tlkptaxauthority;
select count(*) from asr_staging.s_tlkptaxauthoritydetail;
select count(*) from asr_staging.s_tlkptaxdistrict;

select count(*) from asr_staging.s_tmaptaxdistrictauthority;

select count(*) from asr_staging.s_account_location;

end
GO
/****** Object:  StoredProcedure [asr_staging].[trunc_dqm_err_tables]    Script Date: 1/22/2016 2:54:32 PM ******/
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
truncate table dqm.s_tblsubaccount_err;
truncate table dqm.s_tblpersonsecure_err;
truncate table dqm.s_tbladdresssecure_err;
truncate table dqm.s_tmaptaxdistrictauthority_err;
truncate table dqm.s_tbnsubfiling_err;

end


GO
/****** Object:  StoredProcedure [asr_staging].[trunc_staging_tables]    Script Date: 1/22/2016 2:54:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [asr_staging].[trunc_staging_tables]
as
begin

truncate table asr_staging.s_tblacct;
truncate table asr_staging.s_tblacctnbhd;
truncate table asr_staging.s_tblacctowneraddress;
truncate table asr_staging.s_tblacctpropertyaddress;
truncate table asr_staging.s_tblsubaccount;

truncate table asr_staging.s_tbladdresssecure;
truncate table asr_staging.s_tblpersonsecure;

truncate table asr_staging.s_tbnsubdivision;
truncate table asr_staging.s_tbnsubfiling;

truncate table asr_staging.s_tlkpaccttype;
truncate table asr_staging.s_tlkpstatusacct;
truncate table asr_staging.s_tlkptaxauthority;
truncate table asr_staging.s_tlkptaxauthoritydetail;
truncate table asr_staging.s_tlkptaxdistrict;

truncate table asr_staging.s_tmaptaxdistrictauthority;

truncate table asr_staging.s_account_location;

end

GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacct]    Script Date: 1/22/2016 2:54:32 PM ******/
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

account number has to be in a specific format

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacct]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------
	-- accountno – field must be in the format ^[RMPC]{1}[0-9]{7}$

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
			  or cast(substring(ACCOUNTNO,2,1) as varchar(1)) not in ('1','2','3','4','5','6','7','8','9','0')
			  or cast(substring(ACCOUNTNO,3,1) as varchar(1)) not in ('1','2','3','4','5','6','7','8','9','0')
			  or cast(substring(ACCOUNTNO,4,1) as varchar(1)) not in ('1','2','3','4','5','6','7','8','9','0')
		      or cast(substring(ACCOUNTNO,5,1) as varchar(1)) not in ('1','2','3','4','5','6','7','8','9','0')
			  or cast(substring(ACCOUNTNO,6,1) as varchar(1)) not in ('1','2','3','4','5','6','7','8','9','0')
			  or cast(substring(ACCOUNTNO,7,1) as varchar(1)) not in ('1','2','3','4','5','6','7','8','9','0')
			  or cast(substring(ACCOUNTNO,8,1) as varchar(1)) not in ('1','2','3','4','5','6','7','8','9','0')

--------------------------------------------------------------------------------
	END 

END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctnbhd]    Script Date: 1/22/2016 2:54:32 PM ******/
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

Fields accountno + nbhdcode + proptype + nbhdext have to be unique and can not be null 

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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctowneraddress]    Script Date: 1/22/2016 2:54:32 PM ******/
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

IS_0_NEGTIVE_ONE_FLAG		Primary owner flag can be 0 or -1 or 1
IS_FK_1C_1_ACCOUNTNO		Account no must exist in the account table			
IS_FK_1C_PERSON_CODE		Person code must exist in the person table lookup
IS_FK_1C_ADDRESS_CODE		Address code must exist in the address table


*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctowneraddress]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	
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

--------------------------------------------------------------------------------

----------------------------------------------------------------------------------

	
	INSERT INTO [dqm].[s_tblacctowneraddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE)
	    SELECT 
				'ACCOUNTNO',
				'ACCOUNTNO MUST BE IN ACCOUNT LOOKUP',
				'RANGE CANNOT BE NULL',
				getdate(),
				--@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE
			FROM [asr_staging].[s_tblacctowneraddress] addr
			WHERE not exists
			(SELECT 1 FROM [asr_staging].[s_tblacct] a 
			 WHERE a.ACCOUNTNO = addr.ACCOUNTNO)


--------------------------------------------------------------------------------

----------------------------------------------------------------------------------

	INSERT INTO [dqm].[s_tblacctowneraddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE)
	    SELECT 
				'PERSONCODE',
				'ACCOUNTNO MUST BE IN ACCOUNT LOOKUP',
				'RANGE CANNOT BE NULL',
				getdate(),
				--@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE
			FROM [asr_staging].[s_tblacctowneraddress] addr
			WHERE not exists
			(SELECT 1 FROM [asr_staging].[s_tblpersonsecure] p 
			 WHERE p.PERSONCODE = addr.PERSONCODE)


--------------------------------------------------------------------------------

----------------------------------------------------------------------------------

	INSERT INTO [dqm].[s_tblacctowneraddress_err]
	(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE)
	    SELECT 
				'ADDRESSCODE',
				'VALUE MUST BE IN LOOKUP TABLE',
				'ADDRESSCODE MUST EXIST IN S_TBLADDRESSSECURE',
				getdate(),
				--@lv_RUNTIME,
				VERSTART, VEREND, ACCOUNTNO, PERSONCODE, ADDRESSCODE, PRIMARYOWNERFLAG, ACCTOWNERADDRESSON0, ACCTOWNERADDRESSON1, ACCTOWNERADDRESSON2, ACCTOWNERADDRESSOD0, ACCTOWNERADDRESSOD1, ACCTOWNERADDRESSOM0, ACCTOWNERADDRESSOM1, ACCTOWNERADDRESSOT0, ACCTOWNERADDRESSOT1, JURISDICTIONID, OWNERPERCENT, WRITEDATE, SEQID, OWNERSHIPTYPE
			FROM [asr_staging].[s_tblacctowneraddress] addr
			WHERE not exists
			(SELECT 1 FROM [asr_staging].[s_tbladdresssecure] a
			 WHERE a.ADDRESSCODE = addr.ADDRESSCODE)
			 AND primaryownerflag = 1


--------------------------------------------------------------------------------


	END 

END



GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctpropertyaddress]    Script Date: 1/22/2016 2:54:32 PM ******/
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

IS_FK_1C_ACCOUNT_NO		Account no must exist in the account table

*/

CREATE PROCEDURE [dqm].[dqm_s_tblacctpropertyaddress]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.


-- The ACCOUNTNO exist in account table

----------------------------------------------------------------------------------

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
			
----------------------------------------------------------------------------------


	END	

END







GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbladdresssecure]    Script Date: 1/22/2016 2:54:32 PM ******/
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

IS_UNIQUE_1C_NO_NULL_ADDR_CODE	Addresscode has to be unique and can not be null
IS_NOT_SPECIAL_CHAR_ADDR1		Address1 can not contain '|' or non printable characters
IS_NOT_SPECIAL_CHAR_ADDR2		Address2 can not contain '|' or non printable characters
IS_NOT_SPECIAL_CHAR_CITY		City  can not contain '|' or non printable characters
IS_NOT_SPECIAL_CHAR_STATE		State Code can not contain '|' or non printable characters
IS_NOT_SPECIAL_CHAR_ZIP			Zip can not contain '|' or non printable characters
IS_2_CHAR_STATE_CODE			State code has to be 2 characters long


*/

CREATE PROCEDURE [dqm].[dqm_s_tbladdresssecure]
	
AS
BEGIN

    DECLARE @lv_RUNTIME  DATETIME=GETDATE()

	BEGIN

     --Begin DQM checks for the table for each row.

----------------------------------------------------------------------------------

	
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


----------------------------------------------------------------------------------


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

		INSERT INTO [dqm].[s_tbladdresssecure_err]
		(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
			SELECT 
					'ADDRESS1',
					'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
					'ADDRESS1 CANNOT CONTAIN NONPRINTABLE CHARS',
					--getdate(),
					@lv_RUNTIME,
					VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
				FROM [asr_staging].[s_tbladdresssecure]
				WHERE PATINDEX('%[[:cntrl:]|]%',address1) != 0

----------------------------------------------------------------------------------

		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'ADDRESS2',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'ADDRESS2 CANNOT CONTAIN NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure]
					WHERE PATINDEX('%[[:cntrl:]|]%',address2) != 0

----------------------------------------------------------------------------------
		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'CITY',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'CITY CANNOT CONTAIN NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure]
					WHERE PATINDEX('%[[:cntrl:]|]%',city) != 0

----------------------------------------------------------------------------------
		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'STATECODE',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'STATECODE CANNOT CONTAIN NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure]
					WHERE PATINDEX('%[[:cntrl:]|]%',statecode) != 0

----------------------------------------------------------------------------------
		INSERT INTO [dqm].[s_tbladdresssecure_err]
			(COLUMN_NAME, DQM_RULE, ERROR_DESCRIPTION, DQM_RUN_DATE, VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID)
				SELECT 
						'ZIPCODE',
						'FIELD CANNOT CONTAIN | OR NONPRINTABLE CHARS',
						'ZIPCODE CANNOT CONTAIN NONPRINTABLE CHARS',
						--getdate(),
						@lv_RUNTIME,
						VERSTART, VEREND, ADDRESSCODE, ADDRESS1, ADDRESS2, CITY, STATECODE, ZIPCODE, PERSONCODE, PROVINCE, ADDRESSON0, ADDRESSON1, ADDRESSON2, JURISDICTIONID, COUNTRY, POSTALCODE, ADDRESSOD0, ADDRESSOD1, ADDRESSOM0, ADDRESSOM1, ADDRESSOT0, ADDRESSOT1, ADDRESSVALIDFLAG, WRITEDATE, SEQID
					FROM [asr_staging].[s_tbladdresssecure]
					WHERE PATINDEX('%[[:cntrl:]|]%',zipcode) != 0

----------------------------------------------------------------------------------
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblpersonsecure]    Script Date: 1/22/2016 2:54:32 PM ******/
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
				FROM [asr_staging].[s_tblpersonsecure]
				WHERE PATINDEX('[[:cntrl:]|]',NAME1) != 0
				or replace(NAME1,char(127), 'DEL_CHAR') like '%DEL_CHAR%';


----------------------------------------------------------------------------------

	-- NAME2 cannot contain "|" or any non-printable characters


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
					FROM [asr_staging].[s_tblpersonsecure]
					WHERE PATINDEX('[[:cntrl:]|]',NAME2) != 0
					or replace(NAME2,char(127), 'DEL_CHAR') like '%DEL_CHAR%';




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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsubaccount]    Script Date: 1/22/2016 2:54:32 PM ******/
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
	

	-- ACCOUNTNO must be in table s_tblacct - FK Check -- DQM check

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

	-- ACCOUNTNO – must be unique DQM check

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
/****** Object:  StoredProcedure [dqm].[dqm_s_tbnsubfiling]    Script Date: 1/22/2016 2:54:32 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tmaptaxdistrictauthority]    Script Date: 1/22/2016 2:54:32 PM ******/
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
USE [master]
GO
ALTER DATABASE [assessor_staging] SET  READ_WRITE 
GO
