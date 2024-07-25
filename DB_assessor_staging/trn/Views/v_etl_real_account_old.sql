



/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [trn].[v_etl_real_account_old]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      2/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all real property accounts
*************************************************************************************/
AS
SELECT 
       s.ACCOUNTNO  AS account_no
	  ,s.VACANTFLAG  AS vacant_flag
	  ,s.IMPONLYFLAG  AS improvement_only_flag
	  ,s.TIFFLAG  AS tif_flag
	  ,s.ZONINGCODE  AS zoning_code
	  ,zc.ZONINGDESCRIPTION  AS zoning_code_description
	  ,s.PLATTEDFLAG  AS platted_flag
	  ,s.DEFAULTLEA  AS default_lea
	  ,l.LEADESCRIPTION  AS default_lea_description
	  ,s.TOTALACCTIMPINTERESTPCT AS total_improvement_interest_percent
	  ,s.TOTALACCTLANDINTERESTPCT AS total_land_interest_percent
      ,GETDATE() AS create_datetime
      ,SUSER_NAME () AS create_user_id
      ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(s.ACCOUNTNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.VACANTFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.IMPONLYFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.TIFFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.ZONINGCODE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(zc.ZONINGDESCRIPTION), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.PLATTEDFLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.DEFAULTLEA), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(l.LEADESCRIPTION), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.TOTALACCTIMPINTERESTPCT), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.TOTALACCTLANDINTERESTPCT), 'DBNULL_TEXT') 
				) AS rowhash				
FROM dqm.q_tblacctreal s
     LEFT OUTER JOIN [asr_staging].[s_tlkpzoning] zc
     ON s.ZONINGCODE = zc.ZONINGCODE
     LEFT OUTER JOIN [dqm].[q_tlkpleatype] l
     ON s.DEFAULTLEA = l.LEA
     INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
     ON s.ACCOUNTNO = v.account_no;






