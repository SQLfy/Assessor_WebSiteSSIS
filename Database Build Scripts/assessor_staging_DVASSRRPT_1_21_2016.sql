USE [master]
GO
/****** Object:  Database [assessor_staging]    Script Date: 1/21/2016 3:08:40 PM ******/
CREATE DATABASE [assessor_staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_staging', FILENAME = N'E:\Data\assessor_staging.mdf' , SIZE = 357376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Schema [asr_staging]    Script Date: 1/21/2016 3:08:40 PM ******/
CREATE SCHEMA [asr_staging]
GO
/****** Object:  Schema [dqm]    Script Date: 1/21/2016 3:08:40 PM ******/
CREATE SCHEMA [dqm]
GO
/****** Object:  Schema [trn]    Script Date: 1/21/2016 3:08:40 PM ******/
CREATE SCHEMA [trn]
GO
/****** Object:  Table [asr_staging].[s_account_location]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacct]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctnbhd]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctowneraddress]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctpropertyaddress]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tbladdresssecure]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblpersonsecure]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblsubaccount]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tbnsubdivision]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tbnsubfiling]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkpaccttype]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkpstatusacct]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxauthority]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxauthoritydetail]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxdistrict]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [asr_staging].[s_tmaptaxdistrictauthority]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tblacct_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
	[ETL_RUN_TIME] [datetime2](7) NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dqm].[s_tblacctnbhd_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tblacctowneraddress_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tblacctpropertyaddress_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tbladdresssecure_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tblpersonsecure_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tblsubaccount_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tbnsubfiling_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  Table [dqm].[s_tmaptaxdistrictauthority_err]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  StoredProcedure [asr_staging].[select_count_staging_tables]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  StoredProcedure [asr_staging].[trunc_staging_tables]    Script Date: 1/21/2016 3:08:40 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacct]    Script Date: 1/21/2016 3:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =====================================================================================
-- Author:		Tony Golden
-- Create date: 6/2/2014
-- Description:	DQM stored procedure for s_tblacct
-- =====================================================================================


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
USE [master]
GO
ALTER DATABASE [assessor_staging] SET  READ_WRITE 
GO
