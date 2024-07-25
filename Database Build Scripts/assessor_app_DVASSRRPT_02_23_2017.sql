USE [assessor_app]
GO

/****** Object:  Table [asr_app].[azure_important_PPLinks]    Script Date: 2/23/2017 3:16:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [asr_app].[azure_important_PPLinks](
	[ID] [int] NOT NULL,
	[LinkName] [nvarchar](220) NULL,
	[LinkURL] [nvarchar](220) NULL,
	[LinkOrder] [decimal](28, 6) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
 CONSTRAINT [PK_azure_important_PPLinks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [asr_app].[azure_important_PPLinks] ADD  CONSTRAINT [DF_important_PPLinks_CREATE_DTM]  DEFAULT (getdate()) FOR [create_datetime]
GO

ALTER TABLE [asr_app].[azure_important_PPLinks] ADD  CONSTRAINT [DF_important_PPLinks_CREATE_USER_ID]  DEFAULT (suser_name()) FOR [create_user_id]
GO



