USE [master]
GO
/****** Object:  Database [assessor_app]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE DATABASE [assessor_app]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_app', FILENAME = N'E:\Data\assessor_app.mdf' , SIZE = 183296KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_app_log', FILENAME = N'E:\Logs\assessor_app_log.ldf' , SIZE = 1008000KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [assessor_app] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assessor_app].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assessor_app] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assessor_app] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assessor_app] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assessor_app] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assessor_app] SET ARITHABORT OFF 
GO
ALTER DATABASE [assessor_app] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assessor_app] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assessor_app] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assessor_app] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assessor_app] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assessor_app] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assessor_app] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assessor_app] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assessor_app] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assessor_app] SET  DISABLE_BROKER 
GO
ALTER DATABASE [assessor_app] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assessor_app] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assessor_app] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assessor_app] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assessor_app] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assessor_app] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assessor_app] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assessor_app] SET RECOVERY FULL 
GO
ALTER DATABASE [assessor_app] SET  MULTI_USER 
GO
ALTER DATABASE [assessor_app] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assessor_app] SET DB_CHAINING OFF 
GO
ALTER DATABASE [assessor_app] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [assessor_app] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [assessor_app] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'assessor_app', N'ON'
GO
USE [assessor_app]
GO
/****** Object:  User [devdba]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE USER [devdba] FOR LOGIN [devdba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DCGD\dbrooks]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE USER [DCGD\dbrooks] FOR LOGIN [DCGD\dbrooks] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DCGD\database_development]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE USER [DCGD\database_development] FOR LOGIN [DCGD\database_development]
GO
/****** Object:  User [assessor_app_user]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE USER [assessor_app_user] FOR LOGIN [assessor_app_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DCGD\dbrooks]
GO
ALTER ROLE [db_owner] ADD MEMBER [DCGD\database_development]
GO
ALTER ROLE [db_datareader] ADD MEMBER [assessor_app_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [assessor_app_user]
GO
/****** Object:  Schema [asr_app]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE SCHEMA [asr_app]
GO
/****** Object:  Schema [asr_ods2]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE SCHEMA [asr_ods2]
GO
/****** Object:  Table [asr_ods2].[account]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[account](
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
/****** Object:  Table [asr_ods2].[account_neighborhood]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[account_neighborhood](
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
/****** Object:  Table [asr_ods2].[account_owner_address]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[account_owner_address](
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
/****** Object:  Table [asr_ods2].[account_property_address]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[account_property_address](
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
/****** Object:  Table [asr_ods2].[data_processing_log]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[data_processing_log](
	[data_processing_log_id] [int] IDENTITY(1,1) NOT NULL,
	[process_name] [varchar](50) NOT NULL,
	[process_start_time] [datetime2](7) NOT NULL CONSTRAINT [df_process_start_time]  DEFAULT (getdate()),
	[process_end_time] [datetime2](7) NULL,
	[process_status] [varchar](50) NOT NULL,
 CONSTRAINT [pk_data_processing_log] PRIMARY KEY CLUSTERED 
(
	[data_processing_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uk_data_processing_log] UNIQUE NONCLUSTERED 
(
	[process_name] ASC,
	[process_start_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_ods2].[etl_parameter]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[etl_parameter](
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
/****** Object:  Table [asr_ods2].[sub_filing]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[sub_filing](
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
/****** Object:  Table [asr_ods2].[tax_authority]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[tax_authority](
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
/****** Object:  Table [asr_ods2].[tax_district]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[tax_district](
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
/****** Object:  Table [asr_ods2].[tax_district_authority]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [asr_ods2].[tax_district_authority](
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
/****** Object:  View [asr_ods2].[tool_show_column_dictionary]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [asr_ods2].[tool_show_column_dictionary]
AS
SELECT s.name AS Schema_name, t.name AS table_Name, c.name AS column_name, value AS extended_property
FROM sys.extended_properties AS ep
INNER JOIN sys.tables AS t ON ep.major_id = t.object_id 
INNER JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE class = 1
AND minor_id > 0



GO
/****** Object:  View [asr_ods2].[tool_show_table_dictionary]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [asr_ods2].[tool_show_table_dictionary]
AS
SELECT s.name AS Schema_name, t.name AS table_Name,  value AS extended_property
FROM sys.extended_properties AS ep
INNER JOIN sys.tables AS t ON ep.major_id = t.object_id 
INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE class = 1
AND minor_id = 0



GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_sub_filing]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE NONCLUSTERED INDEX [fk_a_sub_filing] ON [asr_ods2].[account]
(
	[sub_filing_recording_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_tax_district]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE NONCLUSTERED INDEX [fk_a_tax_district] ON [asr_ods2].[account]
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_an_account]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE NONCLUSTERED INDEX [fk_an_account] ON [asr_ods2].[account_neighborhood]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_aoa_account]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE NONCLUSTERED INDEX [fk_aoa_account] ON [asr_ods2].[account_owner_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_apa_account]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE NONCLUSTERED INDEX [fk_apa_account] ON [asr_ods2].[account_property_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_authority]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE NONCLUSTERED INDEX [fk_tda_tax_authority] ON [asr_ods2].[tax_district_authority]
(
	[tax_authority_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_district]    Script Date: 4/14/2016 11:03:03 AM ******/
CREATE NONCLUSTERED INDEX [fk_tda_tax_district] ON [asr_ods2].[tax_district_authority]
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [asr_ods2].[account]  WITH CHECK ADD  CONSTRAINT [fk_a_sub_filing] FOREIGN KEY([sub_filing_recording_no])
REFERENCES [asr_ods2].[sub_filing] ([sub_filing_recording_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_ods2].[account] CHECK CONSTRAINT [fk_a_sub_filing]
GO
ALTER TABLE [asr_ods2].[account]  WITH CHECK ADD  CONSTRAINT [fk_a_tax_district] FOREIGN KEY([tax_district_no])
REFERENCES [asr_ods2].[tax_district] ([tax_district_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_ods2].[account] CHECK CONSTRAINT [fk_a_tax_district]
GO
ALTER TABLE [asr_ods2].[account_neighborhood]  WITH CHECK ADD  CONSTRAINT [fk_an_account] FOREIGN KEY([account_no])
REFERENCES [asr_ods2].[account] ([account_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_ods2].[account_neighborhood] CHECK CONSTRAINT [fk_an_account]
GO
ALTER TABLE [asr_ods2].[account_owner_address]  WITH CHECK ADD  CONSTRAINT [fk_aoa_account] FOREIGN KEY([account_no])
REFERENCES [asr_ods2].[account] ([account_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_ods2].[account_owner_address] CHECK CONSTRAINT [fk_aoa_account]
GO
ALTER TABLE [asr_ods2].[account_property_address]  WITH CHECK ADD  CONSTRAINT [fk_apa_account] FOREIGN KEY([account_no])
REFERENCES [asr_ods2].[account] ([account_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_ods2].[account_property_address] CHECK CONSTRAINT [fk_apa_account]
GO
ALTER TABLE [asr_ods2].[tax_district_authority]  WITH CHECK ADD  CONSTRAINT [fk_tda_tax_authority] FOREIGN KEY([tax_authority_no])
REFERENCES [asr_ods2].[tax_authority] ([tax_authority_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_ods2].[tax_district_authority] CHECK CONSTRAINT [fk_tda_tax_authority]
GO
ALTER TABLE [asr_ods2].[tax_district_authority]  WITH CHECK ADD  CONSTRAINT [fk_tda_tax_district] FOREIGN KEY([tax_district_no])
REFERENCES [asr_ods2].[tax_district] ([tax_district_no])
ON DELETE CASCADE
GO
ALTER TABLE [asr_ods2].[tax_district_authority] CHECK CONSTRAINT [fk_tda_tax_district]
GO
/****** Object:  StoredProcedure [asr_ods2].[sp_account_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [asr_ods2].[sp_account_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/29/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the tax_district table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.account AS myTarget
USING assessor_datastore.asr_ods2_query.v_account AS mySource
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




GO
/****** Object:  StoredProcedure [asr_ods2].[sp_account_neighboorhood_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [asr_ods2].[sp_account_neighboorhood_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/1/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the account_neighboorhood table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.account_neighborhood AS myTarget
USING assessor_datastore.asr_ods2_query.v_account_neighborhood AS mySource
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
/****** Object:  StoredProcedure [asr_ods2].[sp_account_owner_address_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [asr_ods2].[sp_account_owner_address_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/1/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the account_owner_address table
Mod #:  2
Mod Date:     3/31/2016
Developer:    Christine Lin
Comments:     added private_flag to the UPDATE and INSERT
Mod #:  3
Mod Date:     3/31/2016
Developer:    Christine Lin
Comments:     added AND myTarget.person_code = mySource.person_code
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.account_owner_address AS myTarget
USING assessor_datastore.asr_ods2_query.v_account_owner_address AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.person_code = mySource.person_code
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.person_code = mySource.person_code
				  ,myTarget.primary_owner_flag = mySource.primary_owner_flag
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
				  ,myTarget.private_flag = mySource.private_flag


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
			,private_flag
            
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
			,mySource.private_flag
            )


WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





GO
/****** Object:  StoredProcedure [asr_ods2].[sp_account_property_address_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [asr_ods2].[sp_account_property_address_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/1/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the account_property_address table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.account_property_address AS myTarget
USING assessor_datastore.asr_ods2_query.v_account_property_address AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.order_no = mySource.order_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.order_no = mySource.order_no
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
/****** Object:  StoredProcedure [asr_ods2].[sp_data_processing_log]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- ===========================================================================================
-- Author:		David Guillen
-- Create date: 2/4/2016
-- Description:	PROCEDURE USED FOR LOGGING LOAD ASR_ODS2 START AND END TIMES
--              THIS LOGGING TABLE WAS REQUESTED BY ASSESSOR SIMPLE SEARCH APPLICATION
--              AND THE DATA IS A SHARED LOGGING LOCATION FOR ETL AND ELASTIC SEARCH INDEXING
-- ===========================================================================================

CREATE PROCEDURE [asr_ods2].[sp_data_processing_log] @dml_type nvarchar(6), @process_status nvarchar(32)

AS 
BEGIN


IF @dml_type = 'INSERT' 
		 
	INSERT INTO [asr_ods2].[data_processing_log] 
	(process_name, process_start_time, process_end_time, process_status)
	VALUES ('ETL LOAD TO ASR_ODS2',GETDATE(),NULL, 'DATA LOAD IN PROGRESS');

ELSE IF @dml_type= 'UPDATE'

	UPDATE [asr_ods2].[data_processing_log]
		SET process_end_time = GETDATE(),
		    process_status = @process_status
		WHERE data_processing_log_id = 
			(SELECT max(data_processing_log_id)
				 FROM [asr_ods2].[data_processing_log]
					WHERE process_name = 'ETL LOAD TO ASR_ODS2'
					AND	process_status = 'DATA LOAD IN PROGRESS'
					AND process_end_time IS NULL);


END





GO
/****** Object:  StoredProcedure [asr_ods2].[sp_etl_parameter_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE[asr_ods2].[sp_etl_parameter_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/17/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the etl_parameter table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.etl_parameter AS myTarget
USING assessor_datastore.asr_ods2_query.v_etl_parameter AS mySource
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
/****** Object:  StoredProcedure [asr_ods2].[sp_sub_filing_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [asr_ods2].[sp_sub_filing_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/1/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the sub_filing table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.sub_filing AS myTarget
USING [assessor_datastore].[asr_ods2_query].[v_sub_filing] AS mySource
ON myTarget.sub_filing_recording_no = mySource.sub_filing_recording_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.subdivision_no = mySource.subdivision_no
		          ,myTarget.subdivision_name = mySource.subdivision_name
				  ,myTarget.filing_no = mySource.filing_no
				  ,myTarget.filing_description = mySource.filing_description
				  ,myTarget.dedicated_sub_filing_name = mySource.dedicated_sub_filing_name
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


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
/****** Object:  StoredProcedure [asr_ods2].[sp_tax_authority_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [asr_ods2].[sp_tax_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/29/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the tax_authority table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.tax_authority AS myTarget
USING assessor_datastore.asr_ods2_query.v_tax_authority AS mySource
ON myTarget.tax_authority_no = mySource.tax_authority_no
WHEN MATCHED 
	 AND ISNULL(RTRIM(myTarget.tax_authority_name), 'DBNULL_TEXT') <> ISNULL(RTRIM(mySource.tax_authority_name), 'DBNULL_TEXT')
	 OR ISNULL(RTRIM(myTarget.authority_type), 'DBNULL_TEXT') <> ISNULL(RTRIM(mySource.authority_type), 'DBNULL_TEXT') 
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
/****** Object:  StoredProcedure [asr_ods2].[sp_tax_district_authority_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [asr_ods2].[sp_tax_district_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/29/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the tax_district_authority table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.tax_district_authority AS myTarget
USING assessor_datastore.asr_ods2_query.v_tax_district_authority AS mySource
ON myTarget.tax_district_no = mySource.tax_district_no
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
/****** Object:  StoredProcedure [asr_ods2].[sp_tax_district_insert]    Script Date: 4/14/2016 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [asr_ods2].[sp_tax_district_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/27/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_district table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.tax_district AS myTarget
USING assessor_datastore.asr_ods2_query.v_tax_district AS mySource
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A twelve digit number assigned in accordance with a geographic location, consisting of numbers assigned to township, section, quarter­section, block and lot.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'state_parcel_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'tax_district_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The recording no that is assigned to the recorded subdivision plat for the filing. 

Recording number(aka reception number) is a number that is assigned by the Clerk and Recorder to a document at the time it is recorded. The Recording Number has replaced the Book and Page numbering system for recorded documents in Douglas County.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'sub_filing_recording_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account type is grouping used by the Assessor’s Office to help classify a property by its use.  Examples are:
State Assessed
Residential
Commercial
HOA and so on.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Appraisal type indicates the type of appraisal for an account. Examples are:
Real
Personal
State Assessed
OilGase' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'appraisal_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The status of an account. Examples are A, I, and D.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of account  status. For example,  Active for A, Inactive for I, and Deleted for D.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'account_status_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of land that identifies the real estate according to a system established or approved by law; an exact description that enables the real estate to be located and identified.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'legal_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Latitude is the Y axis, longitude is the X axis' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'longitude_x'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Latitude is the Y axis, longitude is the X axis.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'latitude_y'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The (y, x) value pair of a location.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account is a vehicle used to manage ownership of properties.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Neighborhood is a group of complementary land uses; a congruous grouping of inhabitants, buildings, or business enterprises. Also, a code used to stratify accounts by similar use, location and quality.  A record is required for each different improvement property type on an account.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'neighborhood_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Property type describes the intended use of an improvement, such as Outbuilding, Condominium, or Residential.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'property_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Extension is used to further specify the comparability of properties beyod neighborhood_code.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_neighborhood', @level2type=N'COLUMN',@level2name=N'neighborhood_extension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique person identifierfrom the source system.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'person_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'One account could have multiple titled owners. 1 indicates a primary owner while 0 indicates non-primary owner.


' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'primary_owner_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the owner(s) as stated in the deed.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'owner_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The percent of ownership this owner has over the property.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'ownership_percent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Federal identification number.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'federal_id_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The line 1 of a mailing address.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'address_line_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The line 2 of a mailing address.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'address_line_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of mailing city.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'city_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of state or province.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zip code' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'zip_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The country where the mailing address belongs.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to indicate whether a person is peace officer or domestic violence related and requires special attention when consuming this information. 1 indicates yes, special attention is required while 0 indicates no, no special attention is needed.
' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address', @level2type=N'COLUMN',@level2name=N'private_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Titled owners are the complete owner names on the recorded deed of the property.
--
Title is a document, usually given to a home buyer with the deed, which states that the title to the property is believed to be clear; usually prepared by an attorney or another qualified person who has examined the abstract of title for the property.

The mailing address of a property(aka titled) owner, provided by that owner to the Assessor’s Office.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_owner_address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number assigned by the Assessor’s Office to identify a property for the purpose of value assessment and tax collection.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'account_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The orderno describes the order in which property addresses are created. ' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'One account could have multiple property addresses. 1 indicates primary address while 0 indicates non-primary address. The first address (lowest orderno) on the account is designated as the primary address.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'primary_address_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Each building on a property is given a unique number, and all data pertaining to that improvement is associated with the number.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'building_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to identify the unit within a multiunit building. This would apply to both mulitunit residential and commercial buildings.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'unit_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unit designator describes a unit. For example, APT, UNIT, and STE (suite).' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'unit_designator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The address number portion of an address. For example. 100 THIRD ST. 100 is the address number.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'address_number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The suffix to an address number.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'address_number_suffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The predirectional to a street name. For example, S UNIVERSITY BLVD. S is the predirection.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'pre_direction_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a street.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'street_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of a street. For example 100 THIRD ST. ST is the street type.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'street_type_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The postdirectional to a street name. For example, INVERNESS DR WEST. WEST is the postdirection' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'post_direction_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the city where the situs address belongs.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'city_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zip code.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'location_zip_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Property address is also known as situs address. A situs address is a physical address that provides the textual description of a location for a structure or an improvement.In real estate, situs is the physical location of a property; in personal property, situs is the taxable location because personal property may be moved from one place to another.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'account_property_address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a parameter.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'etl_parameter', @level2type=N'COLUMN',@level2name=N'parameter_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of a parameter.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'etl_parameter', @level2type=N'COLUMN',@level2name=N'parameter_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description that describes the intented use of a parameter.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'etl_parameter', @level2type=N'COLUMN',@level2name=N'parameter_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ETL parameters control the behavior of the ETL processes.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'etl_parameter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The recording no that is assigned to the recorded subdivision plat for the filing. 

Recording number(aka reception number) is a number that is assigned by the Clerk and Recorder to a document at the time it is recorded. The Recording Number has replaced the Book and Page numbering system for recorded documents in Douglas County.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'sub_filing_recording_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The five digits number assigned by Assessor'' s office to each subdivision. There will be a subdivision record created for metes and bounds parcels. For example, subdivision no 05040 is HIGHLANDS RANCH.

Subdivisions are pieces of land which are split through a specific process in order to create individiual lots that are smaller than 35-acres in size.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'subdivision_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the platted subdivision name. For example 05040 is HIGHLANDS RANCH' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'subdivision_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a subdivision is developed in phases, each phase will be assigned a filing no.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'filing_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An amendment is a change to the subdivision and/or filing. For example, there are originally 8 lots and the developer now wants 6 instead. He would do an amendment to replat the lots into 6 from the original 8.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'filing_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A name of the subdivison filing that is different from the platted name.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'dedicated_sub_filing_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store a generated hash value for the row. The hash value is used in detecting changes to a row.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing', @level2type=N'COLUMN',@level2name=N'rowhash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A subdivision filing is a group of parcels that exist as a sub-set of a larger subdivision.

Subdivisions may be one phase/filing, or many, such as is the case with Highlands Ranch. In subdivisions that have filings, the developer has decided to create the lots in phases, or groups, instead of creating all the lots at one time. This may be due to many reasons including the acreage involved, the infrastructure needed such as roads, available funding, etc.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'sub_filing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number that identifies a taxing authority.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_authority', @level2type=N'COLUMN',@level2name=N'tax_authority_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a tax authority.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_authority', @level2type=N'COLUMN',@level2name=N'tax_authority_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of tax authority. Some examples are County, School, Law Enforcement, City, and Metro District.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_authority', @level2type=N'COLUMN',@level2name=N'authority_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Taxing Authority is a unit of government that levies taxes for operational expense. Each Tax Authority must hold public hearings on their proposed budget. The most common authorities are: Board of County Commissioners, School Districts, Municipalities, Water Management Districts, and Basin Boards.

There are over 200 different taxing authorities in Douglas County which affect various tax districts. They include the county commission, municipalities, school board, transit, water management, and fire districts. These different entities all have public hearings on budget requests for the forthcoming year.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_authority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_district', @level2type=N'COLUMN',@level2name=N'tax_district_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of a tax district' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_district', @level2type=N'COLUMN',@level2name=N'tax_district_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tax districts are a political subdivision of one or more assessment districts where a governmental unit has the authority to levy taxes. This term is used synonymously with “Tax Area”.


in other words, Tax district means a geographical area made up of a unique mix of one or more taxing authorities, which is established for the purpose of properly calculating, collecting, and distributing taxes. Only one tax district will have the same combination
of taxing authoritys.
' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_district'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number used to identify a tax district. Tax Districts represent a unique combination of tax authorities.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_district_authority', @level2type=N'COLUMN',@level2name=N'tax_district_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A four digits number that identifies a taxing authority.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_district_authority', @level2type=N'COLUMN',@level2name=N'tax_authority_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to store tax authorities that make up tax districts for the target tax year.' , @level0type=N'SCHEMA',@level0name=N'asr_ods2', @level1type=N'TABLE',@level1name=N'tax_district_authority'
GO
USE [master]
GO
ALTER DATABASE [assessor_app] SET  READ_WRITE 
GO
