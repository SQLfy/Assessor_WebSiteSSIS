USE [master]
GO
/****** Object:  Database [assessor_staging]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE DATABASE [assessor_staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_staging', FILENAME = N'E:\Data\assessor_staging.mdf' , SIZE = 566272KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_staging_log', FILENAME = N'E:\Logs\assessor_staging_log.ldf' , SIZE = 4211392KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [DCGD\database_development]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE USER [DCGD\database_development] FOR LOGIN [DCGD\database_development]
GO
ALTER ROLE [db_owner] ADD MEMBER [DCGD\database_development]
GO
/****** Object:  Schema [asr_staging]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE SCHEMA [asr_staging]
GO
/****** Object:  Schema [dqm]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE SCHEMA [dqm]
GO
/****** Object:  Schema [trn]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE SCHEMA [trn]
GO
/****** Object:  Table [asr_staging].[etl_parameter]    Script Date: 1/29/2016 3:08:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_staging].[etl_parameter](
	[PARAMETER_NAME] [varchar](50) NULL,
	[PARAMETER_VALUE] [varchar](100) NULL,
	[PARAMETER_DESCR] [varchar](1000) NULL,
	[CREATE_DTM] [varchar](75) NULL,
	[CREATE_USER_ID] [varchar](30) NULL,
	[UPDATE_DTM] [varchar](75) NULL,
	[UPDATE_USER_ID] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_staging].[s_account_location]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacct]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Index [IX_s_tblacct_ClusteredIndex-accountno]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE CLUSTERED INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tblacctlegal]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctnbhd]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctowneraddress]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblacctpropertyaddress]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Index [IX_s_tblacctpropertyaddress_accountno]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE CLUSTERED INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tbladdresssecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblpersonsecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tblsubaccount]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Index [IX_s_tblsubaccount_ClusteredIndex-accountno]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE CLUSTERED INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [asr_staging].[s_tbnsubdivision]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tbnsubfiling]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkpaccttype]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkpstatusacct]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxauthority]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxauthoritydetail]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tlkptaxdistrict]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [asr_staging].[s_tmaptaxdistrictauthority]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[assessor_unit_test_result]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tblacct_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tblacctnbhd_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tblacctowneraddress_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tblacctpropertyaddress_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tbladdresssecure_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tblpersonsecure_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tblsubaccount_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tbnsubfiling_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[s_tmaptaxdistrictauthority_err]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Table [dqm].[valid_account]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [dqm].[q_tmaptaxdistrictauthority]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [trn].[v_etl_tax_district_authority]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [dqm].[bad_account]    Script Date: 1/29/2016 3:08:34 PM ******/
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
      ) l


GO
/****** Object:  View [dqm].[q_tblacct]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [dqm].[q_tblsubaccount]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [trn].[v_etl_account]    Script Date: 1/29/2016 3:08:34 PM ******/
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
   ,NULL AS legal_description
   ,gis.x AS x
   ,gis.y AS y
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
				+ ISNULL(RTRIM(gis.x), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.y), 'DBNULL_TEXT')
				+ ISNULL(RTRIM(gis.location), 'DBNULL_TEXT')
				) AS ROWHASH						
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
/****** Object:  View [dqm].[q_tblacctowneraddress]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [dqm].[q_tbladdresssecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [dqm].[q_tblpersonsecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [trn].[v_etl_account_owner_address]    Script Date: 1/29/2016 3:08:34 PM ******/
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
*************************************************************************************/
AS
SELECT
   a.ACCOUNTNO AS account_no
  ,p.PERSONCODE AS person_code
  ,aoa.PRIMARYOWNERFLAG AS primary_owner_flag
  ,ISNULL(p.NAME1,'') + ' '+  ISNULL(p.NAME2, '') AS owner_name
  ,aoa.OWNERPERCENT AS ownership_percent
  ,p.FEDERALIDNO AS federal_id_no
  ,ad.ADDRESS1 AS address_line_1
  ,ad.ADDRESS2 AS address_line_2
  ,ad.CITY AS city_name
  ,ad.STATECODE AS state
  ,ad.ZIPCODE AS zip_code
  ,ad.COUNTRY AS country
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(a.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.PERSONCODE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(aoa.PRIMARYOWNERFLAG), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.NAME1), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.NAME2), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(aoa.OWNERPERCENT), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.FEDERALIDNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.ADDRESS1), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.ADDRESS2), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.CITY), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(ad.STATECODE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(ad.ZIPCODE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(ad.COUNTRY), 'DBNULL_TEXT')
			) AS ROWHASH
FROM [dqm].[q_tblacct] a
INNER JOIN [dqm].[q_tblacctowneraddress] aoa
ON a.ACCOUNTNO = aoa.ACCOUNTNO
INNER JOIN [dqm].[q_tblpersonsecure] p
ON aoa.PERSONCODE = p.PERSONCODE
INNER JOIN  [dqm].[q_tbladdresssecure] ad
ON aoa.ADDRESSCODE = ad.ADDRESSCODE
AND aoa.PERSONCODE = ad.PERSONCODE
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON a.ACCOUNTNO = v.account_no;



GO
/****** Object:  View [dqm].[q_tblacctpropertyaddress]    Script Date: 1/29/2016 3:08:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dqm].[q_tblacctpropertyaddress] as 
/* orig sql
select -- all columns
VERSTART, VEREND, ACCOUNTNO, BUILDINGID, PREDIRECTION, STREETNO, UNITNAME, POSTDIRECTION, STREETTYPE, STREETNAME, 
PROPERTYZIPCODE, PROPERTYCITY, ORDERNO, ACCTPROPERTYADDRESSON0, ACCTPROPERTYADDRESSON1, ACCTPROPERTYADDRESSON2, 
BUSINESSNAME, ACCTPROPERTYADDRESSOD0, ACCTPROPERTYADDRESSOD1, ACCTPROPERTYADDRESSOM0, ACCTPROPERTYADDRESSOM1, 
ACCTPROPERTYADDRESSOT0, ACCTPROPERTYADDRESSOT1, JURISDICTIONID, PROPERTYADDRESSCODE, WRITEDATE, LOCATIONID, SEQID, ETL_RUN_TIME
from [asr_staging].[s_tblacctpropertyaddress]
WHERE ACCOUNTNO NOT IN
(SELECT ACCOUNTNO FROM [dqm].[S_TBLACCTPROPERTYADDRESS_ERR]); */

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
/****** Object:  View [trn].[v_etl_account_property_address]    Script Date: 1/29/2016 3:08:34 PM ******/
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
  ,NULL AS primary_address_flag
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
			  ISNULL(RTRIM(a.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.ORDERNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(apa.BUILDINGID), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(primary_address_flag), 'DBNULL_TEXT') 
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
			) AS ROWHASH
FROM  [dqm].[q_tblacct] a
INNER JOIN [dqm].[q_tblacctpropertyaddress] apa
ON a.accountno = apa.accountno
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON a.ACCOUNTNO = v.account_no;



GO
/****** Object:  View [dqm].[q_tbnsubfiling]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [trn].[v_etl_sub_filing]    Script Date: 1/29/2016 3:08:34 PM ******/
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
				) AS ROWHASH
  FROM dqm.q_tbnsubfiling sf
  INNER JOIN asr_staging.s_tbnsubdivision s 
        ON sf.SUBNO = s.SUBNO;







GO
/****** Object:  View [dqm].[q_tblacctnbhd]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  View [trn].[v_etl_tax_authority]    Script Date: 1/29/2016 3:08:34 PM ******/
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
  GETDATE() AS create_datetime,
  SUSER_NAME() AS create_user_id
FROM
    asr_staging.s_tlkptaxauthority ta



GO
/****** Object:  View [trn].[v_etl_tax_district]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-CITY]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-CITY] ON [asr_staging].[s_tbladdresssecure]
(
	[CITY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE] ON [asr_staging].[s_tbladdresssecure]
(
	[STATECODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE] ON [asr_staging].[s_tbladdresssecure]
(
	[ZIPCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ix_tbladdresssecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  Index [IX_s_tblpersonsecure_NonClusteredIndex-NAME1]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_s_tblpersonsecure_NonClusteredIndex-NAME2]    Script Date: 1/29/2016 3:08:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ix_tblpersonsecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [asr_staging].[select_count_staging_tables]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [asr_staging].[trunc_dqm_err_tables]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [asr_staging].[trunc_staging_tables]    Script Date: 1/29/2016 3:08:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [asr_staging].[trunc_staging_tables]
as
begin

truncate table asr_staging.s_tblacct;
truncate table asr_staging.s_tblacctlegal;
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
/****** Object:  StoredProcedure [asr_staging].[update_etl_parameter_table]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [dqm].[create_dqm_indexes]    Script Date: 1/29/2016 3:08:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dqm].[create_dqm_indexes]
as
begin

CREATE CLUSTERED INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



CREATE CLUSTERED INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE CLUSTERED INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



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





end



GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacct]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacct_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'8 dqm checks of data in each segment of the accountno field');





	 



 

END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctnbhd]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctnbhd_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
		ACCOUNTNO,NBHDCODE,PROPERTYTYPE, NBHDEXTENSION
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 24 then 'PASS' else 'FAIL' end,getdate(),'4 not null fields, 2 data checks per table (8 per table), 1 fk check (8 x 4 +1)');





	 



 

END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctowneraddress]    Script Date: 1/29/2016 3:08:34 PM ******/
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
				'ACCOUNTNO MUST BE IN ACCOUNT LOOKUP',
				'RANGE CANNOT BE NULL',
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

	-- ADDRESSCODE must exist in the address table

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
			-- AND primaryownerflag = 1


--------------------------------------------------------------------------------


	END 

END



GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctowneraddress_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 9 then 'PASS' else 'FAIL' end,getdate(),'Primary owner not null and equal to -1 0 or 1, FK accountno, FK personcode, FK addresscode');


END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctpropertyaddress]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblacctpropertyaddress_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'FK accountno must be a valid account number');


END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbladdresssecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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

	

	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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



	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2




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

	

	-- truncate temp tables in preparation for the next check
	
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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


	-- truncate temp tables in preparation for the next check
	
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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

	
	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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


	-- truncate temp tables in preparation for the next check
	
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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

	
	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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


	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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

	
	-- truncate temp tables in preparation for the next check
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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


	-- truncate temp tables in preparation for the next check
	
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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
/****** Object:  StoredProcedure [dqm].[dqm_s_tbladdresssecure_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'Addresscode Unique and not null, address1 address2 city statecode zip no spec chars, statecode = 2 chars');


END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblpersonsecure]    Script Date: 1/29/2016 3:08:34 PM ******/
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

	
	-- truncate temp tables in preparation for the next check

	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2

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


	-- truncate temp tables in preparation for the next check
	
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2

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


	-- truncate temp tables in preparation for the next check
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2

	

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


	-- truncate temp tables in preparation for the next check
	
	truncate table #tempBADCHAR1
	truncate table #tempBADCHAR2



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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblpersonsecure_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'1 not null, 1 unique, 2 no special characters');


END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsubaccount]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tblsubaccount_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 2 then 'PASS' else 'FAIL' end,getdate(),'1 FK check, 1 unique value check');





	 



 

END




GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tbnsubfiling]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tbnsubfiling_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'1 not null');





	 



 

END





GO
/****** Object:  StoredProcedure [dqm].[dqm_s_tmaptaxdistrictauthority]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [dqm].[dqm_s_tmaptaxdistrictauthority_unit_test]    Script Date: 1/29/2016 3:08:34 PM ******/
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
(@TABLE_NAME,@COUNT_TABLE,@COUNT_ERR_TABLE,case @ROW_COUNT_DIFF WHEN 0 then 'PASS' else 'FAIL' end,getdate(),'one 3-row unique key check');





	 



 

END




GO
/****** Object:  StoredProcedure [dqm].[drop_dqm_indexes]    Script Date: 1/29/2016 3:08:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dqm].[drop_dqm_indexes]
as
begin

--IF EXISTS (SELECT name FROM sysindexes WHERE name = 'YOUR INDEX NAME HERE') 

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblacct_ClusteredIndex-accountno')
DROP INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct] WITH ( ONLINE = OFF )

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblacctpropertyaddress_accountno')
DROP INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress] WITH ( ONLINE = OFF )

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

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblpersonsecure_NonClusteredIndex-NAME1')
DROP INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblpersonsecure_NonClusteredIndex-NAME2')
DROP INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblsubaccount_ClusteredIndex-accountno')
DROP INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount] WITH ( ONLINE = OFF )







end


GO
/****** Object:  StoredProcedure [trn].[sp_account_insert]    Script Date: 1/29/2016 3:08:34 PM ******/
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
				  ,myTarget.x = mySource.x
				  ,myTarget.y = mySource.y
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
	        ,x
	        ,y
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
	        ,mySource.x
	        ,mySource.y
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
/****** Object:  StoredProcedure [trn].[sp_account_owner_address_insert]    Script Date: 1/29/2016 3:08:34 PM ******/
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
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;



GO
/****** Object:  StoredProcedure [trn].[sp_account_property_address_insert]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [trn].[sp_sub_filing_insert]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [trn].[sp_tax_authority_insert]    Script Date: 1/29/2016 3:08:34 PM ******/
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
	 AND (myTarget.tax_authority_name <> mySource.tax_authority_name 
	      OR
		  myTarget.authority_type <> mySource.authority_type )
	 THEN
        UPDATE SET myTarget.tax_authority_name = mySource.tax_authority_name
		          ,myTarget.authority_type = mySource.authority_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_authority_no
	        ,tax_authority_name
			,authority_type
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.tax_authority_no 
            ,mySource.tax_authority_name
			,mySource.authority_type
            ,mySource.create_datetime
            ,mySource.create_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;


GO
/****** Object:  StoredProcedure [trn].[sp_tax_district_authority_insert]    Script Date: 1/29/2016 3:08:34 PM ******/
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
/****** Object:  StoredProcedure [trn].[sp_tax_district_insert]    Script Date: 1/29/2016 3:08:34 PM ******/
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
	 AND myTarget.tax_district_name <> mySource.tax_district_name 
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
USE [master]
GO
ALTER DATABASE [assessor_staging] SET  READ_WRITE 
GO
