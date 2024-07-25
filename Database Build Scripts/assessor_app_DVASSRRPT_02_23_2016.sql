USE [assessor_app]
GO

/****** Object:  Table [asr_app].[azure_important_PPLinks]    Script Date: 2/23/2017 3:28:55 PM ******/
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


USE [assessor_app]
GO

/****** Object:  StoredProcedure [asr_app].[sp_etl_azure_important_PPLinks_insert]    Script Date: 2/23/2017 3:31:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [asr_app].[sp_etl_azure_important_PPLinks_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/23/2017
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the azure important PPLinks table


			  ID
			  LinkName 
			  LinkURL 
			  LinkOrder
			  create_datetime 
			  create_user_id 
			  update_datetime 
			  update_user_id 
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_app.asr_app.azure_important_PPLinks AS myTarget
USING assessor_datastore.asr_app_query.v_azure_important_PPLinks AS mySource
ON myTarget.ID = mySource.ID
WHEN MATCHED 
	 THEN
        UPDATE SET   myTarget.LinkName 				   =  mySource.LinkName
					,myTarget.LinkURL 						   =  mySource.LinkURL 						
					,myTarget.LinkOrder						   =  mySource.LinkOrder												
					,myTarget.create_datetime 				   =  mySource.create_datetime 			
					,myTarget.create_user_id 				   =  mySource.create_user_id 			
					,myTarget.update_datetime 				   =  GETDATE() 			
					,myTarget.update_user_id 				   =  'ETL_ASR_ODS2' 			


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT ( ID
			  ,LinkName 
			  ,LinkURL 
			  ,LinkOrder
			  ,create_datetime 
			  ,create_user_id 
			  ,update_datetime 
			  ,update_user_id 
            )
     VALUES (mySource.ID	
			 ,mySource.LinkName
			 ,mySource.LinkURL 						
			 ,mySource.LinkOrder
			 ,mySource.create_datetime 			
			 ,mySource.create_user_id 			
			 ,mySource.update_datetime 			
			 ,mySource.update_user_id									            
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;










GO