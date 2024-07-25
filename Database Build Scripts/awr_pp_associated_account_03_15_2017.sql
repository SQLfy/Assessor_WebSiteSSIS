USE [assessor_staging]
GO

/****** Object:  View [trn].[v_etl_pers_prop_acct]    Script Date: 3/15/2017 11:11:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




/****** Script for SelectTopNRows command from SSMS  ******/
ALTER VIEW [trn].[v_etl_pers_prop_acct]
AS
SELECT
  INGRP1.ACCOUNTNO_1 ACCOUNT_NO,
case when INGRP1.LATEDECLARATION = 1 then 'Y' else 'N' end LATE_DECLARATION,
case when INGRP1.NEWCONSTRUCTIONFLAG is NOT NULL then 'Y' else 'N' end NEW_CONSTRUCTION_FLAG,
case when  INGRP1.NODEC = 1 then 'Y' else 'N' end  NODEC,
case when  INGRP1.BIA = 1 then 'Y' else 'N' end BIA, 
 case when  INGRP1.NOCHANGE = 1 then 'Y' else 'N' end NOCHANGE,
  substring(INGRP1.BUSINESSNAME,1,100) BUSINESS_NAME,
  INGRP1.BUSINESSTYPE BUSINESS_TYPE,
  dqm.Q_TLKPBUSINESSTYPE.BUSINESSTYPEDESCRIPTION BUSINESS_TYPE_DESCRIPTION,
  INGRP1.NEWCONSTRUCTIONABSTCD NEW_CONSTRUCTION_ABST_CD,
  INGRP1.NEWCONSTRUCTIONVALUE NEW_CONSTRUCTION_VALUE,
  INGRP1.DECLARATIONSENTDATE DECLARATION_SENT_DATE,
  INGRP1.DECLARATIONRETURNDATE DECLARATION_RETURN_DATE,
  INGRP1.VALUEDBY VALUED_BY,
  rowhash,
  INGRP1.ASSOCIATED_ACCOUNT
FROM
   ( SELECT
  Q_TBLACCTPP.ACCOUNTNO ACCOUNTNO_1,
  Q_TBLACCT.ACCTSTATUSCODE,
  Q_TBLACCT.BUSINESSNAME BUSINESSNAME,
  Q_TBLACCTPP.BUSINESSCODE BUSINESSTYPE,
  Q_TBLACCTPP.LATEDECLARATIONFLAG  LATEDECLARATION,
  INGRP4.SEQID NEWCONSTRUCTIONFLAG,
  INGRP4.ABSTRACTCODE NEWCONSTRUCTIONABSTCD,
  INGRP4.NCTOTALACTUALVALUE NEWCONSTRUCTIONVALUE,
  cast( Q_TBLACCTPP.PPDECLARATIONSENTDATE as varchar)  DECLARATIONSENTDATE,
  cast ( Q_TBLACCTPP.PPDECLARATIONRETURNDATE as varchar)  DECLARATIONRETURNDATE,
  Q_TBLACCTPP.PPAPPRAISER VALUEDBY,
  Q_TBLACCTPP.NODECLARATIONFLAG  NODEC,
  Q_TBLACCTPP.BESTINFOAVAILABLEFLAG  BIA,
  Q_TBLACCTPP.NOCHANGEFLAG  NOCHANGE,
  HASHBYTES('SHA2_256', ISNULL(RTRIM(Q_TBLACCTPP.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(substring(Q_TBLACCT.BUSINESSNAME,1,100)), 'DBNULL_TEXT')) AS rowhash,
  Q_TBLACCT.ASSOCIATEDACCT ASSOCIATED_ACCOUNT
FROM
    dqm.Q_TBLACCTPP  Q_TBLACCTPP   
 JOIN   W_PUBLISHED_ACCOUNT  W_PUBLISHED_ACCOUNT ON ( ( Q_TBLACCTPP.ACCOUNTNO = W_PUBLISHED_ACCOUNT.ACCOUNT_NO ) )
JOIN   dqm.Q_TBLACCT  Q_TBLACCT ON ( ( Q_TBLACCT.ACCOUNTNO = W_PUBLISHED_ACCOUNT.ACCOUNT_NO ) )
LEFT OUTER JOIN  ( SELECT
  S_TBLACCTNEWCONSTRUCTION.ACCOUNTNO ACCOUNTNO,
  S_TBLACCTNEWCONSTRUCTION.ABSTRACTCODE ABSTRACTCODE,
  S_TBLACCTNEWCONSTRUCTION.NCTOTALACTUALVALUE NCTOTALACTUALVALUE,
  S_TBLACCTNEWCONSTRUCTION.SEQID SEQID
FROM
  asr_staging.S_TBLACCTNEWCONSTRUCTION  S_TBLACCTNEWCONSTRUCTION ) INGRP4 ON ( ( INGRP4.ACCOUNTNO = Q_TBLACCTPP.ACCOUNTNO ) ) ) INGRP1   
 JOIN   dqm.Q_TLKPBUSINESSTYPE  ON ( ( INGRP1.BUSINESSTYPE = dqm.Q_TLKPBUSINESSTYPE.BUSINESSCODE ) )
WHERE INGRP1.ACCTSTATUSCODE = 'A'

-----------------------------------------------------------------

USE [assessor_datastore]
GO

/****** Object:  Table [asr_datastore].[pers_prop_acct]    Script Date: 3/15/2017 11:14:46 AM ******/
DROP TABLE [asr_datastore].[pers_prop_acct]
GO

/****** Object:  Table [asr_datastore].[pers_prop_acct]    Script Date: 3/15/2017 11:14:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [asr_datastore].[pers_prop_acct](
	[account_no] [varchar](30) NOT NULL,
	[business_name] [varchar](100) NULL,
	[business_type] [varchar](10) NOT NULL,
	[business_type_description] [varchar](50) NOT NULL,
	[row_start_dtm] [datetime] NULL CONSTRAINT [DF_pers_prop_acct_ROW_START_DATE]  DEFAULT (getdate()),
	[row_end_dtm] [datetime] NULL,
	[row_current_flag] [varchar](1) NULL CONSTRAINT [DF_pers_prop_acct_ROW_CURRENT_FLAG]  DEFAULT ('Y'),
	[create_dtm] [datetime] NULL CONSTRAINT [DF_pers_prop_acct_ROW_CREATE_DTM]  DEFAULT (getdate()),
	[create_user_id] [varchar](30) NULL CONSTRAINT [DF_pers_prop_acct_CREATE_USER_ID]  DEFAULT ('SSIS_ETL'),
	[update_dtm] [datetime] NULL,
	[update_user_id] [varchar](30) NULL,
	[late_filing_flag] [varchar](1) NULL,
	[new_construction_flag] [varchar](1) NULL,
	[new_construction_class_code] [varchar](50) NULL,
	[new_construction_value] [numeric](15, 2) NULL,
	[declaration_sent_date] [date] NULL,
	[declaration_returned_date] [date] NULL,
	[valued_by] [varchar](30) NULL,
	[no_declaration_flag] [varchar](1) NULL,
	[best_info_available_flag] [varchar](1) NULL,
	[no_change_flag] [varchar](1) NULL,
	[rowhash] [varbinary](8000) NULL,
	[associated_account] [varchar](30) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

------------------------------------------------------------

USE [assessor_staging]
GO
/****** Object:  StoredProcedure [trn].[sp_pers_prop_acct_insert]    Script Date: 3/15/2017 11:13:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [trn].[sp_pers_prop_acct_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/10/2017
Developer:    tony golden
Comments:	  Initial creation
              Merge changes into the pers_prop_acct
      

	  2.      3/15/2017
	          tony golden
			  added associated account to pers_prop_account table (derived from tblacct)
*************************************************************************************/
--select * from assessor_datastore.asr_app_query.v_pers_prop_acct


SET NOCOUNT ON;

TRUNCATE TABLE assessor_datastore.asr_datastore.pers_prop_acct


MERGE assessor_datastore.asr_datastore.pers_prop_acct AS myTarget
USING assessor_staging.trn.v_etl_pers_prop_acct  AS mySource
ON myTarget.account_no = mySource.account_no

WHEN MATCHED 
	 THEN
        UPDATE SET   				
					 myTarget.BUSINESS_NAME					=  mySource.BUSINESS_NAME						
					,myTarget.BUSINESS_TYPE			        =  mySource.BUSINESS_TYPE	
					,myTarget.BUSINESS_TYPE_DESCRIPTION     =  mySource.BUSINESS_TYPE_DESCRIPTION						
					,myTarget.ROW_START_DTM					=  NULL											
					,myTarget.ROW_END_DTM					=  NULL											
					,myTarget.ROW_CURRENT_FLAG				=  NULL											
					,myTarget.CREATE_DTM					=  NULL											
					,myTarget.CREATE_USER_ID				=  NULL											
					,myTarget.UPDATE_DTM					=  GETDATE()									
					,myTarget.UPDATE_USER_ID				=  SUSER_NAME()									
					,myTarget.LATE_FILING_FLAG				=  mySource.LATE_DECLARATION					
					,myTarget.NEW_CONSTRUCTION_FLAG			=  mySource.NEW_CONSTRUCTION_FLAG				
					,myTarget.NEW_CONSTRUCTION_CLASS_CODE	=  mySource.NEW_CONSTRUCTION_ABST_CD			
					,myTarget.NEW_CONSTRUCTION_VALUE		=  mySource.NEW_CONSTRUCTION_VALUE				
					,myTarget.DECLARATION_SENT_DATE			=  mySource.DECLARATION_SENT_DATE				
					,myTarget.DECLARATION_RETURNED_DATE		=  mySource.DECLARATION_RETURN_DATE				
					,myTarget.VALUED_BY						=  mySource.VALUED_BY							
					,myTarget.NO_DECLARATION_FLAG			=  mySource.NODEC								
					,myTarget.BEST_INFO_AVAILABLE_FLAG		=  mySource.BIA									
					,myTarget.NO_CHANGE_FLAG				=  mySource.NOCHANGE							
					,myTarget.ASSOCIATED_ACCOUNT			=  mySource.ASSOCIATED_ACCOUNT																								
					     																					
				  
WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
               ACCOUNT_NO
			 , BUSINESS_NAME					
			 , BUSINESS_TYPE
			 , BUSINESS_TYPE_DESCRIPTION			
			 , ROW_START_DTM					
			 , ROW_END_DTM					
			 , ROW_CURRENT_FLAG				
			 , CREATE_DTM					
			 , CREATE_USER_ID				
			 , UPDATE_DTM					
			 , UPDATE_USER_ID				
			 , LATE_FILING_FLAG				
			 , NEW_CONSTRUCTION_FLAG			
			 , NEW_CONSTRUCTION_CLASS_CODE	
			 , NEW_CONSTRUCTION_VALUE		
			 , DECLARATION_SENT_DATE			
			 , DECLARATION_RETURNED_DATE		
			 , VALUED_BY						
			 , NO_DECLARATION_FLAG			
			 , BEST_INFO_AVAILABLE_FLAG		
			 , NO_CHANGE_FLAG
			 , ASSOCIATED_ACCOUNT				
            )
     VALUES (  mySource.ACCOUNT_NO
	         , mySource.BUSINESS_NAME				
			 , mySource.BUSINESS_TYPE	
			 , mySource.BUSINESS_TYPE_DESCRIPTION	
			 , NULL					
			 , NULL				
			 , NULL				
			 , GETDATE()				
			 , SUSER_NAME()		
			 , GETDATE()				
			 , SUSER_NAME()				
			 , mySource.LATE_DECLARATION			
			 , mySource.NEW_CONSTRUCTION_FLAG		
			 , mySource.NEW_CONSTRUCTION_ABST_CD
			 , mySource.NEW_CONSTRUCTION_VALUE		
			 , mySource.DECLARATION_SENT_DATE		
			 , mySource.DECLARATION_RETURN_DATE		
			 , mySource.VALUED_BY					
			 , mySource.NODEC
			 , mySource.BIA		
			 , mySource.NOCHANGE
			 , mySource.ASSOCIATED_ACCOUNT			
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

--------------------------------------------------------------------

USE [assessor_datastore]
GO

/****** Object:  View [asr_app_query].[v_pers_prop_acct]    Script Date: 3/15/2017 11:21:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [asr_app_query].[v_pers_prop_acct]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/10/2017
Developer:     t golden
Comments:      Initial creation
               List details for updating the pers_prop_acct

        2     3/15/2017
		      t golden
			  added associated_account for PP
*************************************************************************************/


AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ACCOUNT_NO]
      ,[BUSINESS_NAME]
      ,[BUSINESS_TYPE]
	  ,[BUSINESS_TYPE_DESCRIPTION]
      ,[ROW_START_DTM]
      ,[ROW_END_DTM]
      ,[ROW_CURRENT_FLAG]
      ,[CREATE_DTM]
      ,[CREATE_USER_ID]
      ,[UPDATE_DTM]
      ,[UPDATE_USER_ID]
      ,[LATE_FILING_FLAG]
      ,[NEW_CONSTRUCTION_FLAG]
      ,[NEW_CONSTRUCTION_CLASS_CODE]
      ,[NEW_CONSTRUCTION_VALUE]
      ,[DECLARATION_SENT_DATE]
      ,[DECLARATION_RETURNED_DATE]
      ,[VALUED_BY]
      ,[NO_DECLARATION_FLAG]
      ,[BEST_INFO_AVAILABLE_FLAG]
      ,[NO_CHANGE_FLAG]
	  ,[ASSOCIATED_ACCOUNT]
  FROM [assessor_datastore].[asr_datastore].[pers_prop_acct]






GO

---------------------------------------------------------------


USE [assessor_app]
GO

/****** Object:  Table [asr_app].[pers_prop_acct]    Script Date: 3/15/2017 12:40:27 PM ******/
DROP TABLE [asr_app].[pers_prop_acct]
GO

/****** Object:  Table [asr_app].[pers_prop_acct]    Script Date: 3/15/2017 12:40:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [asr_app].[pers_prop_acct](
	[ACCOUNT_NO] [varchar](30) NOT NULL,
	[BUSINESS_NAME] [varchar](100) NULL,
	[BUSINESS_TYPE] [varchar](10) NOT NULL,
	[BUSINESS_TYPE_DESCRIPTION] [varchar](50) NOT NULL,
	[ROW_START_DTM] [datetime] NULL CONSTRAINT [DF_pers_prop_acct_ROW_START_DATE]  DEFAULT (getdate()),
	[ROW_END_DTM] [datetime] NULL,
	[ROW_CURRENT_FLAG] [varchar](1) NULL CONSTRAINT [DF_pers_prop_acct_ROW_CURRENT_FLAG]  DEFAULT ('Y'),
	[CREATE_DTM] [datetime] NULL CONSTRAINT [DF_pers_prop_acct_ROW_CREATE_DTM]  DEFAULT (getdate()),
	[CREATE_USER_ID] [varchar](30) NULL CONSTRAINT [DF_pers_prop_acct_CREATE_USER_ID]  DEFAULT ('SSIS_ETL'),
	[UPDATE_DTM] [datetime] NULL,
	[UPDATE_USER_ID] [varchar](30) NULL,
	[LATE_FILING_FLAG] [varchar](1) NULL,
	[NEW_CONSTRUCTION_FLAG] [varchar](1) NULL,
	[NEW_CONSTRUCTION_CLASS_CODE] [varchar](50) NULL,
	[NEW_CONSTRUCTION_VALUE] [numeric](15, 2) NULL,
	[DECLARATION_SENT_DATE] [date] NULL,
	[DECLARATION_RETURNED_DATE] [date] NULL,
	[VALUED_BY] [varchar](30) NULL,
	[NO_DECLARATION_FLAG] [varchar](1) NULL,
	[BEST_INFO_AVAILABLE_FLAG] [varchar](1) NULL,
	[NO_CHANGE_FLAG] [varchar](1) NULL,
	[ASSOCIATED_ACCOUNT] [varchar](30) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


----------------------------------------------------------


USE [assessor_app]
GO
/****** Object:  StoredProcedure [asr_app].[sp_pers_prop_acct_insert]    Script Date: 3/15/2017 12:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [asr_app].[sp_pers_prop_acct_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/10/2017
Developer:    tony golden
Comments:	  Initial creation
              Merge changes into the pers_prop_acct
*************************************************************************************/
--select * from assessor_datastore.asr_app_query.v_pers_prop_acct


SET NOCOUNT ON;

TRUNCATE TABLE assessor_app.asr_app.pers_prop_acct

MERGE assessor_app.asr_app.pers_prop_acct AS myTarget
USING assessor_datastore.asr_app_query.v_pers_prop_acct  AS mySource
ON myTarget.account_no = mySource.account_no

WHEN MATCHED 
	 THEN
        UPDATE SET   				
					 myTarget.BUSINESS_NAME					=  mySource.BUSINESS_NAME					
					,myTarget.BUSINESS_TYPE     			=  mySource.BUSINESS_TYPE
					,myTarget.BUSINESS_TYPE_DESCRIPTION		=  mySource.BUSINESS_TYPE_DESCRIPTION			
					,myTarget.ROW_START_DTM					=  mySource.ROW_START_DTM					
					,myTarget.ROW_END_DTM					=  mySource.ROW_END_DTM					
					,myTarget.ROW_CURRENT_FLAG				=  mySource.ROW_CURRENT_FLAG				
					,myTarget.CREATE_DTM					=  mySource.CREATE_DTM					
					,myTarget.CREATE_USER_ID				=  mySource.CREATE_USER_ID				
					,myTarget.UPDATE_DTM					=  GETDATE()				
					,myTarget.UPDATE_USER_ID				=  SUSER_NAME()				
					,myTarget.LATE_FILING_FLAG				=  mySource.LATE_FILING_FLAG				
					,myTarget.NEW_CONSTRUCTION_FLAG			=  mySource.NEW_CONSTRUCTION_FLAG			
					,myTarget.NEW_CONSTRUCTION_CLASS_CODE	=  mySource.NEW_CONSTRUCTION_CLASS_CODE	
					,myTarget.NEW_CONSTRUCTION_VALUE		=  mySource.NEW_CONSTRUCTION_VALUE		
					,myTarget.DECLARATION_SENT_DATE			=  mySource.DECLARATION_SENT_DATE			
					,myTarget.DECLARATION_RETURNED_DATE		=  mySource.DECLARATION_RETURNED_DATE		
					,myTarget.VALUED_BY						=  mySource.VALUED_BY						
					,myTarget.NO_DECLARATION_FLAG			=  mySource.NO_DECLARATION_FLAG			
					,myTarget.BEST_INFO_AVAILABLE_FLAG		=  mySource.BEST_INFO_AVAILABLE_FLAG		
					,myTarget.NO_CHANGE_FLAG				=  mySource.NO_CHANGE_FLAG	
					,myTarget.ASSOCIATED_ACCOUNT		    =  mySource.ASSOCIATED_ACCOUNT					

					     
				  
WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
               ACCOUNT_NO
			 , BUSINESS_NAME					
			 , BUSINESS_TYPE
			 , BUSINESS_TYPE_DESCRIPTION			
			 , ROW_START_DTM					
			 , ROW_END_DTM					
			 , ROW_CURRENT_FLAG				
			 , CREATE_DTM					
			 , CREATE_USER_ID				
			 , UPDATE_DTM					
			 , UPDATE_USER_ID				
			 , LATE_FILING_FLAG				
			 , NEW_CONSTRUCTION_FLAG			
			 , NEW_CONSTRUCTION_CLASS_CODE	
			 , NEW_CONSTRUCTION_VALUE		
			 , DECLARATION_SENT_DATE			
			 , DECLARATION_RETURNED_DATE		
			 , VALUED_BY						
			 , NO_DECLARATION_FLAG			
			 , BEST_INFO_AVAILABLE_FLAG		
			 , NO_CHANGE_FLAG	
			 , ASSOCIATED_ACCOUNT			
            )
     VALUES (
	           mySource.ACCOUNT_NO
			 , mySource.BUSINESS_NAME					
			 , mySource.BUSINESS_TYPE
			 , mySource.BUSINESS_TYPE_DESCRIPTION			
			 , mySource.ROW_START_DTM					
			 , mySource.ROW_END_DTM					
			 , mySource.ROW_CURRENT_FLAG				
			 , mySource.CREATE_DTM					
			 , mySource.CREATE_USER_ID				
			 , mySource.UPDATE_DTM					
			 , mySource.UPDATE_USER_ID				
			 , mySource.LATE_FILING_FLAG				
			 , mySource.NEW_CONSTRUCTION_FLAG			
			 , mySource.NEW_CONSTRUCTION_CLASS_CODE	
			 , mySource.NEW_CONSTRUCTION_VALUE		
			 , mySource.DECLARATION_SENT_DATE			
			 , mySource.DECLARATION_RETURNED_DATE		
			 , mySource.VALUED_BY						
			 , mySource.NO_DECLARATION_FLAG			
			 , mySource.BEST_INFO_AVAILABLE_FLAG		
			 , mySource.NO_CHANGE_FLAG	
			 , mySource.ASSOCIATED_ACCOUNT	
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;












