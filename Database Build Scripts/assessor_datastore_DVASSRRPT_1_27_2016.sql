USE [master]
GO
/****** Object:  Database [assessor_datastore]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE DATABASE [assessor_datastore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_datastore', FILENAME = N'E:\Data\assessor_datastore.mdf' , SIZE = 45056KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_datastore_log', FILENAME = N'E:\Logs\assessor_datastore_log.ldf' , SIZE = 291904KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [assessor_datastore]
GO
/****** Object:  Schema [asr_datastore]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE SCHEMA [asr_datastore]
GO
/****** Object:  Schema [asr_ods2_query]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE SCHEMA [asr_ods2_query]
GO
/****** Object:  Table [asr_datastore].[account]    Script Date: 1/27/2016 5:53:43 PM ******/
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
	[x] [numeric](30, 8) NULL,
	[y] [numeric](30, 8) NULL,
	[location] [varchar](30) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL,
 CONSTRAINT [pk_account] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[account_neighborhood]    Script Date: 1/27/2016 5:53:43 PM ******/
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
/****** Object:  Table [asr_datastore].[account_owner_address]    Script Date: 1/27/2016 5:53:43 PM ******/
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
 CONSTRAINT [pk_account_owner_address] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC,
	[person_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[account_property_address]    Script Date: 1/27/2016 5:53:43 PM ******/
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
 CONSTRAINT [pk_account_property_address] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC,
	[order_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_datastore].[etl_parameter]    Script Date: 1/27/2016 5:53:43 PM ******/
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
/****** Object:  Table [asr_datastore].[sub_filing]    Script Date: 1/27/2016 5:53:43 PM ******/
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
/****** Object:  Table [asr_datastore].[tax_authority]    Script Date: 1/27/2016 5:53:43 PM ******/
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
/****** Object:  Table [asr_datastore].[tax_district]    Script Date: 1/27/2016 5:53:43 PM ******/
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
/****** Object:  Table [asr_datastore].[tax_district_authority]    Script Date: 1/27/2016 5:53:43 PM ******/
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
/****** Object:  View [asr_ods2_query].[v_tax_authority]    Script Date: 1/27/2016 5:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [asr_ods2_query].[v_tax_authority]
as
select tax_authority_no, tax_authority_name, authority_type, create_datetime, create_user_id, update_datetime, update_user_id
from asr_datastore.tax_authority
GO
/****** Object:  View [asr_ods2_query].[v_tax_district]    Script Date: 1/27/2016 5:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [asr_ods2_query].[v_tax_district]
as
select tax_district_no, tax_district_name, create_datetime, create_user_id, update_datetime, update_user_id
from asr_datastore.tax_district
GO
/****** Object:  View [asr_ods2_query].[v_tax_district_authority]    Script Date: 1/27/2016 5:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [asr_ods2_query].[v_tax_district_authority]
as
select tax_district_no, tax_authority_no, create_datetime, create_user_id, update_datetime, update_user_id
from asr_datastore.tax_district_authority

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_sub_filing]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE NONCLUSTERED INDEX [fk_a_sub_filing] ON [asr_datastore].[account]
(
	[sub_filing_recording_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_tax_district]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE NONCLUSTERED INDEX [fk_a_tax_district] ON [asr_datastore].[account]
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_an_account]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE NONCLUSTERED INDEX [fk_an_account] ON [asr_datastore].[account_neighborhood]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_aoa_account]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE NONCLUSTERED INDEX [fk_aoa_account] ON [asr_datastore].[account_owner_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_apa_account]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE NONCLUSTERED INDEX [fk_apa_account] ON [asr_datastore].[account_property_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_authority]    Script Date: 1/27/2016 5:53:43 PM ******/
CREATE NONCLUSTERED INDEX [fk_tda_tax_authority] ON [asr_datastore].[tax_district_authority]
(
	[tax_authority_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_district]    Script Date: 1/27/2016 5:53:43 PM ******/
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
USE [master]
GO
ALTER DATABASE [assessor_datastore] SET  READ_WRITE 
GO
