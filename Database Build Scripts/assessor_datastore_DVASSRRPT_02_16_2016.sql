USE [master]
GO
/****** Object:  Database [assessor_datastore]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE DATABASE [assessor_datastore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_datastore', FILENAME = N'E:\Data\assessor_datastore.mdf' , SIZE = 220160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_datastore_log', FILENAME = N'E:\Logs\assessor_datastore_log.ldf' , SIZE = 1341696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [assessor_datastore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assessor_datastore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assessor_datastore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assessor_datastore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assessor_datastore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assessor_datastore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assessor_datastore] SET ARITHABORT OFF 
GO
ALTER DATABASE [assessor_datastore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assessor_datastore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assessor_datastore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assessor_datastore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assessor_datastore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assessor_datastore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assessor_datastore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assessor_datastore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assessor_datastore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assessor_datastore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [assessor_datastore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assessor_datastore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assessor_datastore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assessor_datastore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assessor_datastore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assessor_datastore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assessor_datastore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assessor_datastore] SET RECOVERY FULL 
GO
ALTER DATABASE [assessor_datastore] SET  MULTI_USER 
GO
ALTER DATABASE [assessor_datastore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assessor_datastore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [assessor_datastore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [assessor_datastore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [assessor_datastore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'assessor_datastore', N'ON'
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\MSSQLSERVER]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [NT SERVICE\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [devdba]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [devdba] WITH PASSWORD=N'PdBE7HRkHnOac6r3iHwfB8f0rlqYX6imEFkiJ/Zy46I=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [devdba] DISABLE
GO
/****** Object:  Login [DCGD\SQLAdmins]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [DCGD\SQLAdmins] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\sa_sqlsvcs]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [DCGD\sa_sqlsvcs] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\dbrooks]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [DCGD\dbrooks] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\database_development]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [DCGD\database_development] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [assessor_app_user]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [assessor_app_user] WITH PASSWORD=N'x0nN1Jqa2P6EWMjzXr8ikAQN4Yglh5iJ+1NTcYljq5o=', DEFAULT_DATABASE=[assessor_app], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [assessor_app_user] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'H12oYGRKDCYaS4NgAi7FPijytja2/jWbqK0u2f3AI2I=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'Evc+gsS72e5plxifOvN8e3ACGXV+zShxg4rU93rThjQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [devdba]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\SQLAdmins]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\sa_sqlsvcs]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\database_development]
GO
USE [assessor_datastore]
GO
/****** Object:  User [devdba]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE USER [devdba] FOR LOGIN [devdba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DCGD\dbrooks]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE USER [DCGD\dbrooks] FOR LOGIN [DCGD\dbrooks] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DCGD\database_development]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE USER [DCGD\database_development] FOR LOGIN [DCGD\database_development]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DCGD\dbrooks]
GO
ALTER ROLE [db_owner] ADD MEMBER [DCGD\database_development]
GO
/****** Object:  Schema [asr_datastore]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE SCHEMA [asr_datastore]
GO
/****** Object:  Schema [asr_ods2_query]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE SCHEMA [asr_ods2_query]
GO
/****** Object:  Table [asr_datastore].[account]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[account](
	[account_no] [varchar](30) NOT NULL,
	[state_parcel_no] [varchar](30) NULL,
	[tax_district_no] [varchar](30) NOT NULL,
	[sub_filing_recording_no] [varchar](30) NULL,
	[account_type] [varchar](30) NOT NULL,
	[appraisal_type] [varchar](30) NOT NULL,
	[account_status] [varchar](30) NOT NULL,
	[account_status_description] [varchar](100) NULL,
	[legal_description] [varchar](max) NULL,
	[longitude_x] [numeric](30, 8) NULL,
	[latitude_y] [numeric](30, 8) NULL,
	[location] [varchar](50) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,
	[elevation_z] [numeric](30, 8) NULL,
 CONSTRAINT [pk_account] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[account_neighborhood]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[account_neighborhood](
	[account_no] [varchar](30) NOT NULL,
	[neighborhood_code] [varchar](50) NOT NULL,
	[property_type] [varchar](50) NOT NULL,
	[neighborhood_extension] [varchar](50) NOT NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
 CONSTRAINT [pk_account_neighborhood] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC,
	[neighborhood_code] ASC,
	[property_type] ASC,
	[neighborhood_extension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[account_owner_address]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[account_owner_address](
	[account_no] [varchar](30) NOT NULL,
	[person_code] [char](18) NOT NULL,
	[primary_owner_flag] [bit] NOT NULL,
	[owner_name] [varchar](256) NOT NULL,
	[ownership_percent] [numeric](9, 8) NULL,
	[federal_id_no] [varchar](30) NULL,
	[address_line_1] [varchar](80) NULL,
	[address_line_2] [varchar](80) NULL,
	[city_name] [varchar](80) NULL,
	[state] [varchar](80) NULL,
	[zip_code] [varchar](30) NULL,
	[country] [varchar](80) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,
	[private_flag] [bit] NULL,
 CONSTRAINT [pk_account_owner_address] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC,
	[person_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[account_property_address]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[account_property_address](
	[account_no] [varchar](30) NOT NULL,
	[order_no] [int] NOT NULL,
	[primary_address_flag] [bit] NULL,
	[building_no] [varchar](30) NULL,
	[unit_no] [varchar](30) NULL,
	[unit_designator] [varchar](30) NULL,
	[address_number] [varchar](15) NULL,
	[address_number_suffix] [varchar](30) NULL,
	[pre_direction_code] [varchar](50) NULL,
	[street_name] [varchar](80) NULL,
	[street_type_code] [varchar](30) NULL,
	[post_direction_code] [varchar](50) NULL,
	[city_name] [varchar](50) NULL,
	[location_zip_code] [varchar](10) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,
 CONSTRAINT [pk_account_property_address] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC,
	[order_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[etl_parameter]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[etl_parameter](
	[parameter_name] [varchar](50) NOT NULL,
	[parameter_value] [varchar](100) NOT NULL,
	[parameter_description] [varchar](1000) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
 CONSTRAINT [pk_etl_parameter] PRIMARY KEY CLUSTERED 
(
	[parameter_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[sub_filing]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[sub_filing](
	[sub_filing_recording_no] [varchar](30) NOT NULL,
	[subdivision_no] [varchar](30) NOT NULL,
	[subdivision_name] [varchar](256) NULL,
	[filing_no] [varchar](30) NOT NULL,
	[filing_description] [varchar](80) NULL,
	[dedicated_sub_filing_name] [varchar](256) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,
 CONSTRAINT [pk_sub_filing] PRIMARY KEY CLUSTERED 
(
	[sub_filing_recording_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[tax_authority]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[tax_authority](
	[tax_authority_no] [varchar](30) NOT NULL,
	[tax_authority_name] [varchar](256) NULL,
	[authority_type] [varchar](100) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
 CONSTRAINT [pk_tax_authority] PRIMARY KEY CLUSTERED 
(
	[tax_authority_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[tax_district]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[tax_district](
	[tax_district_no] [varchar](30) NOT NULL,
	[tax_district_name] [varchar](256) NULL,
	[create_datetime] [datetime] NOT NULL,
	[create_user_id] [varchar](30) NOT NULL,
	[update_datetime] [datetime] NULL,
	[update_user_id] [varchar](30) NULL,
 CONSTRAINT [pk_tax_district] PRIMARY KEY CLUSTERED 
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[tax_district_authority]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_datastore].[tax_district_authority](
	[tax_district_no] [varchar](30) NOT NULL,
	[tax_authority_no] [varchar](30) NOT NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
 CONSTRAINT [pk_tax_district_authority] PRIMARY KEY CLUSTERED 
(
	[tax_district_no] ASC,
	[tax_authority_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [asr_datastore].[tool_show_column_dictionary]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [asr_datastore].[tool_show_column_dictionary]
AS
SELECT s.name AS Schema_name, t.name AS table_Name, c.name AS column_name, value AS extended_property
FROM sys.extended_properties AS ep
INNER JOIN sys.tables AS t ON ep.major_id = t.object_id 
INNER JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE class = 1
AND minor_id > 0


GO
/****** Object:  View [asr_datastore].[tool_show_record_count]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [asr_datastore].[tool_show_record_count]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/1/2016
Developer:     Christine Lin
Comments:      Initial creation
               List table record counts
*************************************************************************************/
AS
SELECT 'asr_datastore.account' AS table_name, COUNT(1) AS record_count
FROM [asr_datastore].[account] 
UNION ALL
SELECT 'asr_datastore.account_neighborhood', COUNT(1) AS record_count
FROM [asr_datastore].[account_neighborhood]
UNION ALL
SELECT 'asr_datastore.account_owner_address', COUNT(1) AS record_count
FROM [asr_datastore].[account_owner_address]
UNION ALL
SELECT 'asr_datastore.account_property_address', COUNT(1) AS record_count
FROM [asr_datastore].[account_property_address]
UNION ALL
SELECT 'asr_datastore.sub_filing', COUNT(1) AS record_count
FROM [asr_datastore].[sub_filing]
UNION ALL
SELECT 'asr_datastore.tax_authority', COUNT(1) AS record_count
FROM [asr_datastore].[tax_authority]
UNION ALL
SELECT 'asr_datastore.tax_district', COUNT(1) AS record_count
FROM [asr_datastore].[tax_district]
UNION ALL
SELECT 'asr_datastore.tax_district_authority', COUNT(1) AS record_count
FROM [asr_datastore].[tax_district_authority];



GO
/****** Object:  View [asr_datastore].[tool_show_table_dictionary]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [asr_datastore].[tool_show_table_dictionary]
AS
SELECT s.name AS Schema_name, t.name AS table_Name,  value AS extended_property
FROM sys.extended_properties AS ep
INNER JOIN sys.tables AS t ON ep.major_id = t.object_id 
INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE class = 1
AND minor_id = 0


GO
/****** Object:  View [asr_ods2_query].[v_account]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [asr_ods2_query].[v_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access active accounts for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT account_no, state_parcel_no, tax_district_no, sub_filing_recording_no, account_type, appraisal_type
     , account_status, account_status_description, legal_description, longitude_x, latitude_y, elevation_z, location
	 , create_datetime, create_user_id
	 , update_datetime, update_user_id, rowhash
FROM asr_datastore.account
WHERE account_status = 'A';




GO
/****** Object:  View [asr_ods2_query].[v_account_neighborhood]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [asr_ods2_query].[v_account_neighborhood]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/1/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access account_neighborhood for active accounts for 
			   loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT n.account_no, n.neighborhood_code, n.property_type, n.neighborhood_extension
	 , n.create_datetime, n.create_user_id
	 , n.update_datetime, n.update_user_id, rowhash
FROM asr_datastore.account_neighborhood n
INNER JOIN asr_datastore.account a
	  ON n.account_no = a.account_no
	  AND a.account_status = 'A';



GO
/****** Object:  View [asr_ods2_query].[v_account_owner_address]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [asr_ods2_query].[v_account_owner_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/1/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access account_owner_address for active accounts for 
			   loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT oa.account_no, oa.person_code, oa.primary_owner_flag
, CASE WHEN oa.private_flag = 1 THEN NULL ELSE oa.owner_name END AS owner_name
, oa.ownership_percent
, oa.federal_id_no, oa.address_line_1, oa.address_line_2, oa.city_name, oa.state, oa.zip_code, oa.country
, oa.create_datetime, oa.create_user_id, oa.update_datetime, oa.update_user_id, oa.rowhash
, oa.private_flag
FROM asr_datastore.account_owner_address oa
INNER JOIN asr_datastore.account a
	  ON oa.account_no = a.account_no
	  AND a.account_status = 'A';





GO
/****** Object:  View [asr_ods2_query].[v_account_property_address]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [asr_ods2_query].[v_account_property_address]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/1/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access account_property_address for active accounts for 
			   loading data into the asssessor_app database
*************************************************************************************/
AS
SELECT pa.account_no, pa.order_no, pa.primary_address_flag, pa.building_no, pa.unit_no, pa.unit_designator, 
pa.address_number, pa.address_number_suffix, pa.pre_direction_code, pa.street_name, pa.street_type_code, 
pa.post_direction_code, pa.city_name, pa.location_zip_code, 
pa.create_datetime, pa.create_user_id, pa.update_datetime, pa.update_user_id, pa.rowhash
FROM asr_datastore.account_property_address pa
INNER JOIN asr_datastore.account a
	  ON pa.account_no = a.account_no
	  AND a.account_status = 'A';






GO
/****** Object:  View [asr_ods2_query].[v_sub_filing]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [asr_ods2_query].[v_sub_filing]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/01/2016
Developer:     David Guillen
Comments:      Initial creation
               Provide a view to access subfiling info for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT 
sub_filing_recording_no, subdivision_no, subdivision_name, filing_no, filing_description, 
dedicated_sub_filing_name, create_datetime, create_user_id,
update_datetime, update_user_id, rowhash
FROM [asr_datastore].[sub_filing]





GO
/****** Object:  View [asr_ods2_query].[v_tax_authority]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [asr_ods2_query].[v_tax_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access tax authorities for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT tax_authority_no, tax_authority_name, authority_type, create_datetime, create_user_id
     , update_datetime, update_user_id
FROM asr_datastore.tax_authority;



GO
/****** Object:  View [asr_ods2_query].[v_tax_district]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [asr_ods2_query].[v_tax_district]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access tax districts for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT tax_district_no, tax_district_name, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.tax_district;


GO
/****** Object:  View [asr_ods2_query].[v_tax_district_authority]    Script Date: 2/16/2016 3:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [asr_ods2_query].[v_tax_district_authority]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/28/2016
Developer:     Christine Lin
Comments:      Initial creation
               Provide a view to access the tax_district_authority table for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT tax_district_no, tax_authority_no, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.tax_district_authority;


GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_sub_filing]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE NONCLUSTERED INDEX [fk_a_sub_filing] ON [asr_datastore].[account]
(
	[sub_filing_recording_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_tax_district]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE NONCLUSTERED INDEX [fk_a_tax_district] ON [asr_datastore].[account]
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_an_account]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE NONCLUSTERED INDEX [fk_an_account] ON [asr_datastore].[account_neighborhood]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_aoa_account]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE NONCLUSTERED INDEX [fk_aoa_account] ON [asr_datastore].[account_owner_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_apa_account]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE NONCLUSTERED INDEX [fk_apa_account] ON [asr_datastore].[account_property_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_authority]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE NONCLUSTERED INDEX [fk_tda_tax_authority] ON [asr_datastore].[tax_district_authority]
(
	[tax_authority_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_district]    Script Date: 2/16/2016 3:51:20 PM ******/
CREATE NONCLUSTERED INDEX [fk_tda_tax_district] ON [asr_datastore].[tax_district_authority]
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [asr_datastore].[account]  WITH CHECK ADD  CONSTRAINT [fk_a_sub_filing] FOREIGN KEY([sub_filing_recording_no])
REFERENCES [asr_datastore].[sub_filing] ([sub_filing_recording_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_datastore].[account] CHECK CONSTRAINT [fk_a_sub_filing]
GO
ALTER TABLE [asr_datastore].[account]  WITH CHECK ADD  CONSTRAINT [fk_a_tax_district] FOREIGN KEY([tax_district_no])
REFERENCES [asr_datastore].[tax_district] ([tax_district_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_datastore].[account] CHECK CONSTRAINT [fk_a_tax_district]
GO
ALTER TABLE [asr_datastore].[account_neighborhood]  WITH CHECK ADD  CONSTRAINT [fk_an_account] FOREIGN KEY([account_no])
REFERENCES [asr_datastore].[account] ([account_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_datastore].[account_neighborhood] CHECK CONSTRAINT [fk_an_account]
GO
ALTER TABLE [asr_datastore].[account_owner_address]  WITH CHECK ADD  CONSTRAINT [fk_aoa_account] FOREIGN KEY([account_no])
REFERENCES [asr_datastore].[account] ([account_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_datastore].[account_owner_address] CHECK CONSTRAINT [fk_aoa_account]
GO
ALTER TABLE [asr_datastore].[account_property_address]  WITH CHECK ADD  CONSTRAINT [fk_apa_account] FOREIGN KEY([account_no])
REFERENCES [asr_datastore].[account] ([account_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_datastore].[account_property_address] CHECK CONSTRAINT [fk_apa_account]
GO
ALTER TABLE [asr_datastore].[tax_district_authority]  WITH CHECK ADD  CONSTRAINT [fk_tda_tax_authority] FOREIGN KEY([tax_authority_no])
REFERENCES [asr_datastore].[tax_authority] ([tax_authority_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_datastore].[tax_district_authority] CHECK CONSTRAINT [fk_tda_tax_authority]
GO
ALTER TABLE [asr_datastore].[tax_district_authority]  WITH CHECK ADD  CONSTRAINT [fk_tda_tax_district] FOREIGN KEY([tax_district_no])
REFERENCES [asr_datastore].[tax_district] ([tax_district_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_datastore].[tax_district_authority] CHECK CONSTRAINT [fk_tda_tax_district]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A twelve digit number assigned in accordance with a geographic location, consisting of numbers assigned to township, section, quarter­section, block and lot.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'state_parcel_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'tax_district_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The recording no that is assigned to the recorded subdivision plat for the filing. 

Recording number(aka reception number) is a number that is assigned by the Clerk and Recorder to a document at the time it is recorded. The Recording Number has replaced the Book and Page numbering system for recorded documents in Douglas County.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'sub_filing_recording_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account type is grouping used by the Assessor’s Office to help classify a property by its use.  Examples are:
State Assessed
Residential
Commercial
HOA and so on.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Appraisal type indicates the type of appraisal for an account. Examples are:
Real
Personal
State Assessed
OilGase' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'appraisal_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The status of an account. Examples are A, I, and D.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of account  status. For example,  Active for A, Inactive for I, and Deleted for D.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_status_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of land that identifies the real estate according to a system established or approved by law; an exact description that enables the real estate to be located and identified.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'legal_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Latitude is the Y axis, longitude is the X axis' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'longitude_x'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Latitude is the Y axis, longitude is the X axis.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'latitude_y'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The (y, x) value pair of a location.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account is a vehicle used to manage ownership of properties.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Neighborhood is a group of complementary land uses; a congruous grouping of inhabitants, buildings, or business enterprises. Also, a code used to stratify accounts by similar use, location and quality.  A record is required for each different improvement property type on an account.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'neighborhood_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Property type describes the intended use of an improvement, such as Outbuilding, Condominium, or Residential.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'property_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Extension is used to further specify the comparability of properties beyod neighborhood_code.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'neighborhood_extension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique person identifierfrom the source system.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'person_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'One account could have multiple titled owners. 1 indicates a primary owner while 0 indicates non-primary owner.


' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'primary_owner_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the owner(s) as stated in the deed.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'owner_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The percent of ownership this owner has over the property.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'ownership_percent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Federal identification number.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'federal_id_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The line 1 of a mailing address.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'address_line_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The line 2 of a mailing address.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'address_line_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of mailing city.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'city_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of state or province.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zip code' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'zip_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The country where the mailing address belongs.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to indicate whether a person is peace officer or domestic violence related and requires special attention when consuming this information. 1 indicates yes, special attention is required while 0 indicates no, no special attention is needed.
' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'private_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Titled owners are the complete owner names on the recorded deed of the property.
--
Title is a document, usually given to a home buyer with the deed, which states that the title to the property is believed to be clear; usually prepared by an attorney or another qualified person who has examined the abstract of title for the property.

The mailing address of a property(aka titled) owner, provided by that owner to the Assessor’s Office.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_owner_address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The orderno describes the order in which property addresses are created. ' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'One account could have multiple property addresses. 1 indicates primary address while 0 indicates non-primary address. The first address (lowest orderno) on the account is designated as the primary address.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'primary_address_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Each building on a property is given a unique number, and all data pertaining to that improvement is associated with the number.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'building_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to identify the unit within a multiunit building. This would apply to both mulitunit residential and commercial buildings.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'unit_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unit designator describes a unit. For example, APT, UNIT, and STE (suite).' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'unit_designator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The address number portion of an address. For example. 100 THIRD ST. 100 is the address number.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'address_number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The suffix to an address number.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'address_number_suffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The predirectional to a street name. For example, S UNIVERSITY BLVD. S is the predirection.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'pre_direction_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a street.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'street_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of a street. For example 100 THIRD ST. ST is the street type.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'street_type_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The postdirectional to a street name. For example, INVERNESS DR WEST. WEST is the postdirection' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'post_direction_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the city where the situs address belongs.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'city_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zip code.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'location_zip_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Property address is also known as situs address. A situs address is a physical address that provides the textual description of a location for a structure or an improvement.In real estate, situs is the physical location of a property; in personal property, situs is the taxable location because personal property may be moved from one place to another.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'account_property_address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a parameter.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'etl_parameter', @level2type=N'COLUMN',@level2name=N'parameter_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of a parameter.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'etl_parameter', @level2type=N'COLUMN',@level2name=N'parameter_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description that describes the intented use of a parameter.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'etl_parameter', @level2type=N'COLUMN',@level2name=N'parameter_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ETL parameters control the behavior of the ETL processes.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'etl_parameter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The recording no that is assigned to the recorded subdivision plat for the filing. 

Recording number(aka reception number) is a number that is assigned by the Clerk and Recorder to a document at the time it is recorded. The Recording Number has replaced the Book and Page numbering system for recorded documents in Douglas County.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'sub_filing_recording_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The five digits number assigned by Assessor'' s office to each subdivision. There will be a subdivision record created for metes and bounds parcels. For example, subdivision no 05040 is HIGHLANDS RANCH.

Subdivisions are pieces of land which are split through a specific process in order to create individiual lots that are smaller than 35-acres in size.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'subdivision_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the platted subdivision name. For example 05040 is HIGHLANDS RANCH' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'subdivision_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a subdivision is developed in phases, each phase will be assigned a filing no.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'filing_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An amendment is a change to the subdivision and/or filing. For example, there are originally 8 lots and the developer now wants 6 instead. He would do an amendment to replat the lots into 6 from the original 8.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'filing_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A name of the subdivison filing that is different from the platted name.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'dedicated_sub_filing_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A subdivision filing is a group of parcels that exist as a sub-set of a larger subdivision.

Subdivisions may be one phase/filing, or many, such as is the case with Highlands Ranch. In subdivisions that have filings, the developer has decided to create the lots in phases, or groups, instead of creating all the lots at one time. This may be due to many reasons including the acreage involved, the infrastructure needed such as roads, available funding, etc.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'sub_filing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number that identifies a taxing authority.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_authority', @level2type=N'COLUMN',@level2name=N'tax_authority_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a tax authority.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_authority', @level2type=N'COLUMN',@level2name=N'tax_authority_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of tax authority. Some examples are County, School, Law Enforcement, City, and Metro District.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_authority', @level2type=N'COLUMN',@level2name=N'authority_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Taxing Authority is a unit of government that levies taxes for operational expense. Each Tax Authority must hold public hearings on their proposed budget. The most common authorities are: Board of County Commissioners, School Districts, Municipalities, Water Management Districts, and Basin Boards.

There are over 200 different taxing authorities in Douglas County which affect various tax districts. They include the county commission, municipalities, school board, transit, water management, and fire districts. These different entities all have public hearings on budget requests for the forthcoming year.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_authority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_district', @level2type=N'COLUMN',@level2name=N'tax_district_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a tax district' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_district', @level2type=N'COLUMN',@level2name=N'tax_district_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tax districts are a political subdivision of one or more assessment districts where a governmental unit has the authority to levy taxes. This term is used synonymously with “Tax Area”.


in other words, Tax district means a geographical area made up of a unique mix of one or more taxing authorities, which is established for the purpose of properly calculating, collecting, and distributing taxes. Only one tax district will have the same combination
of taxing authoritys.
' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_district'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_district_authority', @level2type=N'COLUMN',@level2name=N'tax_district_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number that identifies a taxing authority.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_district_authority', @level2type=N'COLUMN',@level2name=N'tax_authority_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store tax authorities that make up tax districts for the target tax year.' , @level0type=N'SCHEMA',@level0name=N'asr_datastore', @level1type=N'TABLE',@level1name=N'tax_district_authority'
GO
USE [master]
GO
ALTER DATABASE [assessor_datastore] SET  READ_WRITE 
GO
