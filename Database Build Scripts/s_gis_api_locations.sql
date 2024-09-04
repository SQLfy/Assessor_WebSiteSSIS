USE [assessor_staging]
GO

/****** Object:  Table [dbo].[s_gis_api_locations]    Script Date: 8/9/2024 7:04:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [asr_staging].[s_gis_api_locations](
	[Account_Number] [varchar](50) NULL,
	[State_Parcel_number] [varchar](15) NULL,
   	[x] [numeric](30, 8) NULL,
	[y] [numeric](30, 8) NULL,
	[Location] [varchar](32) NULL,
	[etl_write_date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [asr_staging].[s_gis_api_locations] ADD  CONSTRAINT [DF_etl_write_date]  DEFAULT (getdate()) FOR [etl_write_date]
GO


