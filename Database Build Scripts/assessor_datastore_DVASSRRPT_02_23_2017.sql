USE [assessor_datastore]
GO

/****** Object:  Table [asr_datastore].[azure_important_PPLinks]    Script Date: 2/23/2017 3:23:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [asr_datastore].[azure_important_PPLinks](
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

ALTER TABLE [asr_datastore].[azure_important_PPLinks] ADD  CONSTRAINT [DF_important_PPLinks_CREATE_DTM]  DEFAULT (getdate()) FOR [create_datetime]
GO

ALTER TABLE [asr_datastore].[azure_important_PPLinks] ADD  CONSTRAINT [DF_important_PPLinks_CREATE_USER_ID]  DEFAULT (suser_name()) FOR [create_user_id]
GO

USE [assessor_datastore]
GO

/****** Object:  View [asr_app_query].[v_azure_important_PPLinks]    Script Date: 2/23/2017 3:29:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [asr_app_query].[v_azure_important_PPLinks]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/23/2017
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access azure_important_PPLinks for loading data into
			   the asssessor_app database
*************************************************************************************/
AS
SELECT ID, LinkName, LinkURL, LinkOrder, create_datetime, create_user_id, update_datetime, update_user_id
FROM asr_datastore.azure_important_PPLinks;

