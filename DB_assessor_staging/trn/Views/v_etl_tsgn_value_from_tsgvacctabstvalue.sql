CREATE VIEW [trn].[v_etl_tsgn_value_from_tsgvacctabstvalue]
AS
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:		6/9/2020
Developer:		David Guillen
Comments:		Join to s_tbllandabstract changed due to possibility of
				multiple land records rows per account
Author			Date		Comment
Paul Mathews	02/02/2023	Adding Column [ASSESSMENTRATIO] NUMERIC (15, 6) NULL as assessment_rate
							Adding Column [ASSESSMENTRATIO] to HASHBYTES

*************************************************************************************/
SELECT     
  NULL VERSTART --AV.VERSTART --AJG COMMENTED OUT TO SOLVE DUPE KEY ISSUE ON RECORDS WITH ABSTRACTADJCODE VALUES 
, NULL VEREND --, AV.VEREND --AJG COMMENTED OUT TO SOLVE DUPE KEY ISSUE ON RECORDS WITH ABSTRACTADJCODE VALUES
, AV.ACCOUNTNO AS account_no
, ac.ACCTTYPE AS account_type
, AV.TAXYEAR AS tax_year
, AV.ABSTRACTCODE AS valuation_class_code
, ABSTC.ABSTRACTDESCRIPTION valuation_class_code_description  -- AJG 5/30/2018 needed for adv search report of values by class account/class code desc
, AV.TAXDISTRICT AS tax_district_no
, SUM(AV.RAWASSESSEDVALUE) AS raw_assessed_value
, CAST(ROUND(ISNULL(AV.MILLLEVY / 1000 * SUM(AV.RAWASSESSEDVALUE), 0), 2) AS numeric(38, 2)) AS raw_tax_dollars
, SUM(AV.ACTUALVALUE) AS actual_value
, AV.MILLLEVY AS mill_levy
, AV.ASSESSMENTRATIO as assessment_rate
, ISNULL(SUM(la.LANDACRES), 0) AS net_acres
, v.create_datetime
, v.create_user_id
, HASHBYTES('SHA2_256', ISNULL(RTRIM(AV.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(ac.ACCTTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(AV.TAXYEAR), 'DBNULL_TEXT') + ISNULL(RTRIM(AV.ABSTRACTCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(ABSTC.ABSTRACTDESCRIPTION), 'DBNULL_TEXT') 
                  + ISNULL(RTRIM(AV.TAXDISTRICT), 'DBNULL_TEXT') + ISNULL(RTRIM(SUM(AV.RAWASSESSEDVALUE)), 'DBNULL_TEXT') + ISNULL(RTRIM(ROUND(ISNULL(AV.MILLLEVY / 1000 * SUM(AV.RAWASSESSEDVALUE), 0), 2)), 'DBNULL_TEXT') 
                  + ISNULL(RTRIM(SUM(AV.ACTUALVALUE)), 'DBNULL_TEXT') + ISNULL(RTRIM(AV.MILLLEVY), 'DBNULL_TEXT') + ISNULL(RTRIM(AV.ASSESSMENTRATIO), 'DBNULL_TEXT') + ISNULL(RTRIM(SUM(la.LANDACRES)), 'DBNULL_TEXT')) AS rowhash
FROM        asr_staging.s_tsgvacctabstvalue AS AV 
                  LEFT OUTER JOIN asr_staging.s_tblacct AS ac ON AV.ACCOUNTNO = ac.ACCOUNTNO 
				  INNER JOIN dqm.valid_account AS v ON AV.ACCOUNTNO = v.account_no
				  INNER JOIN asr_staging.s_tlkpabstractcode AS ABSTC ON AV.ABSTRACTCODE = ABSTC.ABSTRACTCODE 
				 -- LEFT OUTER JOIN asr_staging.s_tbllandabstract AS la ON AV.ACCOUNTNO = la.ACCOUNTNO AND AV.ABSTRACTCODE = la.ABSTRACTCODE	Mod #1
				 LEFT OUTER JOIN (select accountno, abstractcode, sum(LANDACRES) LANDACRES, sum(LANDACTUALTOTAL) LANDACTUALTOTAL 
				                  FROM [assessor_staging].[asr_staging].[s_tbllandabstract] 
								  group by ACCOUNTNO, abstractcode) la
					ON AV.ACCOUNTNO = la.ACCOUNTNO AND AV.ABSTRACTCODE = la.ABSTRACTCODE
GROUP BY 
--VERSTART  --AV.VERSTART  --AJG COMMENTED OUT TO SOLVE DUPE KEY ISSUE ON RECORDS WITH ABSTRACTADJCODE VALUES
--VEREND   -- AV.VEREND   --AJG COMMENTED OUT TO SOLVE DUPE KEY ISSUE ON RECORDS WITH ABSTRACTADJCODE VALUES
  AV.ACCOUNTNO
, ac.ACCTTYPE
, AV.ABSTRACTCODE
, ABSTC.ABSTRACTDESCRIPTION
, AV.TAXYEAR
, AV.TAXDISTRICT
, AV.MILLLEVY
, AV.ASSESSMENTRATIO
, v.create_datetime
, v.create_user_id
