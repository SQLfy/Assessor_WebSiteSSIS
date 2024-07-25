USE [master]
GO
/****** Object:  Database [assessor_app]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE DATABASE [assessor_app]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessor_app', FILENAME = N'E:\Data\assessor_app.mdf' , SIZE = 28672KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_app_log', FILENAME = N'E:\Logs\assessor_app_log.ldf' , SIZE = 136064KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [DCGD\database_development]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE USER [DCGD\database_development] FOR LOGIN [DCGD\database_development]
GO
/****** Object:  User [assessor_app_user]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE USER [assessor_app_user] FOR LOGIN [assessor_app_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DCGD\database_development]
GO
ALTER ROLE [db_datareader] ADD MEMBER [assessor_app_user]
GO
/****** Object:  Schema [asr_app]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE SCHEMA [asr_app]
GO
/****** Object:  Schema [asr_ods2]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE SCHEMA [asr_ods2]
GO
/****** Object:  Table [asr_ods2].[account]    Script Date: 1/29/2016 3:07:37 PM ******/
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
	[x] [numeric](30, 8) NULL,
	[y] [numeric](30, 8) NULL,
	[location] [varchar](30) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
 CONSTRAINT [pk_account] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_ods2].[account_neighborhood]    Script Date: 1/29/2016 3:07:37 PM ******/
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
/****** Object:  Table [asr_ods2].[account_owner_address]    Script Date: 1/29/2016 3:07:37 PM ******/
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
 CONSTRAINT [pk_account_owner_address] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC,
	[person_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_ods2].[account_property_address]    Script Date: 1/29/2016 3:07:37 PM ******/
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
 CONSTRAINT [pk_account_property_address] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC,
	[order_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_ods2].[etl_parameter]    Script Date: 1/29/2016 3:07:37 PM ******/
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
/****** Object:  Table [asr_ods2].[sub_filing]    Script Date: 1/29/2016 3:07:37 PM ******/
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
 CONSTRAINT [pk_sub_filing] PRIMARY KEY CLUSTERED 
(
	[sub_filing_recording_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [asr_ods2].[tax_authority]    Script Date: 1/29/2016 3:07:37 PM ******/
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
/****** Object:  Table [asr_ods2].[tax_district]    Script Date: 1/29/2016 3:07:37 PM ******/
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
/****** Object:  Table [asr_ods2].[tax_district_authority]    Script Date: 1/29/2016 3:07:37 PM ******/
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
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_sub_filing]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE NONCLUSTERED INDEX [fk_a_sub_filing] ON [asr_ods2].[account]
(
	[sub_filing_recording_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_a_tax_district]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE NONCLUSTERED INDEX [fk_a_tax_district] ON [asr_ods2].[account]
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_an_account]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE NONCLUSTERED INDEX [fk_an_account] ON [asr_ods2].[account_neighborhood]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_aoa_account]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE NONCLUSTERED INDEX [fk_aoa_account] ON [asr_ods2].[account_owner_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_apa_account]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE NONCLUSTERED INDEX [fk_apa_account] ON [asr_ods2].[account_property_address]
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_authority]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE NONCLUSTERED INDEX [fk_tda_tax_authority] ON [asr_ods2].[tax_district_authority]
(
	[tax_authority_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_tda_tax_district]    Script Date: 1/29/2016 3:07:37 PM ******/
CREATE NONCLUSTERED INDEX [fk_tda_tax_district] ON [asr_ods2].[tax_district_authority]
(
	[tax_district_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [asr_ods2].[account]  WITH CHECK ADD  CONSTRAINT [fk_a_sub_filing] FOREIGN KEY([sub_filing_recording_no])
REFERENCES [asr_ods2].[sub_filing] ([sub_filing_recording_no])
GO
ALTER TABLE [asr_ods2].[account] CHECK CONSTRAINT [fk_a_sub_filing]
GO
ALTER TABLE [asr_ods2].[account]  WITH CHECK ADD  CONSTRAINT [fk_a_tax_district] FOREIGN KEY([tax_district_no])
REFERENCES [asr_ods2].[tax_district] ([tax_district_no])
GO
ALTER TABLE [asr_ods2].[account] CHECK CONSTRAINT [fk_a_tax_district]
GO
ALTER TABLE [asr_ods2].[account_neighborhood]  WITH CHECK ADD  CONSTRAINT [fk_an_account] FOREIGN KEY([account_no])
REFERENCES [asr_ods2].[account] ([account_no])
GO
ALTER TABLE [asr_ods2].[account_neighborhood] CHECK CONSTRAINT [fk_an_account]
GO
ALTER TABLE [asr_ods2].[account_owner_address]  WITH CHECK ADD  CONSTRAINT [fk_aoa_account] FOREIGN KEY([account_no])
REFERENCES [asr_ods2].[account] ([account_no])
GO
ALTER TABLE [asr_ods2].[account_owner_address] CHECK CONSTRAINT [fk_aoa_account]
GO
ALTER TABLE [asr_ods2].[account_property_address]  WITH CHECK ADD  CONSTRAINT [fk_apa_account] FOREIGN KEY([account_no])
REFERENCES [asr_ods2].[account] ([account_no])
GO
ALTER TABLE [asr_ods2].[account_property_address] CHECK CONSTRAINT [fk_apa_account]
GO
ALTER TABLE [asr_ods2].[tax_district_authority]  WITH CHECK ADD  CONSTRAINT [fk_tda_tax_authority] FOREIGN KEY([tax_authority_no])
REFERENCES [asr_ods2].[tax_authority] ([tax_authority_no])
GO
ALTER TABLE [asr_ods2].[tax_district_authority] CHECK CONSTRAINT [fk_tda_tax_authority]
GO
ALTER TABLE [asr_ods2].[tax_district_authority]  WITH CHECK ADD  CONSTRAINT [fk_tda_tax_district] FOREIGN KEY([tax_district_no])
REFERENCES [asr_ods2].[tax_district] ([tax_district_no])
GO
ALTER TABLE [asr_ods2].[tax_district_authority] CHECK CONSTRAINT [fk_tda_tax_district]
GO
/****** Object:  StoredProcedure [asr_ods2].[sp_account_insert]    Script Date: 1/29/2016 3:07:37 PM ******/
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
	 AND myTarget.state_parcel_no <> mySource.state_parcel_no 
	  OR myTarget.tax_district_no <> mySource.tax_district_no
	  OR myTarget.sub_filing_recording_no <> mySource.sub_filing_recording_no
	  OR myTarget.account_type <> mySource.account_type
	  OR myTarget.appraisal_type <> mySource.appraisal_type
	  OR myTarget.account_status <> mySource.account_status
	  OR myTarget.account_status_description <> mySource.account_status_description
	  OR myTarget.legal_description <> mySource.legal_description
	  OR myTarget.x <> mySource.x
	  OR myTarget.y <> mySource.y
	  OR myTarget.location <> mySource.location
	
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
            );






GO
/****** Object:  StoredProcedure [asr_ods2].[sp_tax_authority_insert]    Script Date: 1/29/2016 3:07:37 PM ******/
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
	 AND myTarget.tax_authority_name <> mySource.tax_authority_name
	 OR myTarget.authority_type <> mySource.authority_type 
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
            );






GO
/****** Object:  StoredProcedure [asr_ods2].[sp_tax_district_authority_insert]    Script Date: 1/29/2016 3:07:37 PM ******/
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
WHEN MATCHED 
	 AND myTarget.tax_authority_no <> mySource.tax_authority_no 
	 THEN
        UPDATE SET myTarget.tax_authority_no = mySource.tax_authority_no
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()


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
            );






GO
/****** Object:  StoredProcedure [asr_ods2].[sp_tax_district_insert]    Script Date: 1/29/2016 3:07:37 PM ******/
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
            );





GO
USE [master]
GO
ALTER DATABASE [assessor_app] SET  READ_WRITE 
GO
