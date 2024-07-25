














CREATE VIEW [trn].[v_etl_account_valuation_Old]
WITH SCHEMABINDING
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      7/19/2016
Developer:     Richard Edwards
Comments:      Initial creation
               List account valuations
Mod #:  2
Mod Date:      8/30/2016
Developer:     Richard Edwards
Comments:      Add account_type to view
*************************************************************************************/
AS
SELECT 
    av.ACCOUNT_NO AS account_no
   ,av.ABSTCODE AS valuation_class_code
   ,ac.ACCTTYPE AS account_type
   ,av.NEWGROWTHACTVAL AS actual_value
   ,av.NEWGROWTHASSESSVAL AS assessed_value
   ,av.NET_ACRES AS net_acres
   ,CASE WHEN av.NEW_GROWTH_FLAG = 'Y' THEN '1' ELSE '0' END AS new_growth_flag
   ,ab.ABSTRACTDESCRIPTION AS valuation_class_code_description
   ,GETDATE() AS create_datetime
   ,SUSER_NAME () AS create_user_id
   ,HASHBYTES('SHA2_256', 
                  ISNULL(RTRIM(ac.ACCTTYPE), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(av.NEWGROWTHACTVAL), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(av.NEWGROWTHASSESSVAL), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(av.NET_ACRES), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(av.NEW_GROWTH_FLAG), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(ab.ABSTRACTDESCRIPTION), 'DBNULL_TEXT') 
				) AS rowhash						
FROM 
	[asr_staging].[s_account_valuation] av  
	LEFT OUTER JOIN [asr_staging].[s_tlkpabstractcode] ab
ON av.ABSTCODE = ab.ABSTRACTCODE
LEFT JOIN [asr_staging].[s_tblacct] ac ON av.ACCOUNT_NO = ac.ACCOUNTNO
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON av.ACCOUNT_NO = v.account_no;














