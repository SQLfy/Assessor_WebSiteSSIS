





CREATE VIEW [trn].[v_etl_tsgn_value_from_tsgvacctabstvalue_org]
AS
SELECT  AV.ACCOUNTNO AS account_no, ac.ACCTTYPE AS account_type, AV.TAXYEAR AS tax_year, 
        AV.ABSTRACTCODE AS valuation_class_code, AV.TAXDISTRICT AS tax_district_no, 
		SUM(AV.RAWASSESSEDVALUE) AS raw_assessed_value, 
		CAST(ROUND(ISNULL(AV.MILLLEVY / 1000 * SUM(AV.RAWASSESSEDVALUE),0),2) AS numeric(38,2)) AS raw_tax_dollars, 
		SUM(AV.ACTUALVALUE) AS actual_value, AV.MILLLEVY AS mill_levy, 
		ISNULL(SUM(la.LANDACRES), 0) AS net_acres,
		v.create_datetime, v.create_user_id,
		HASHBYTES('SHA2_256', ISNULL(RTRIM(av.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(ac.ACCTTYPE), 'DBNULL_TEXT') + 
		ISNULL(RTRIM(av.TAXYEAR), 'DBNULL_TEXT') + ISNULL(RTRIM(av.ABSTRACTCODE), 'DBNULL_TEXT') + 
		ISNULL(RTRIM(av.TAXDISTRICT), 'DBNULL_TEXT') + ISNULL(RTRIM(SUM(AV.RAWASSESSEDVALUE)), 'DBNULL_TEXT') + 
		ISNULL(RTRIM(ROUND(ISNULL(AV.MILLLEVY / 1000 * SUM(AV.RAWASSESSEDVALUE),0),2)), 'DBNULL_TEXT') + 
		ISNULL(RTRIM(SUM(AV.ACTUALVALUE)), 'DBNULL_TEXT') + 
		ISNULL(RTRIM(av.MILLLEVY), 'DBNULL_TEXT') +
		ISNULL(RTRIM(SUM(la.LANDACRES)), 'DBNULL_TEXT')
		) AS rowhash
FROM    asr_staging.s_tsgvacctabstvalue AS AV LEFT JOIN
        asr_staging.s_tblacct AS ac ON AV.ACCOUNTNO = ac.ACCOUNTNO INNER JOIN
        dqm.valid_account AS v ON AV.ACCOUNTNO = v.account_no INNER JOIN
        asr_staging.s_tlkpabstractcode AS ABSTC ON AV.ABSTRACTCODE = ABSTC.ABSTRACTCODE LEFT JOIN
		asr_staging.s_tbllandabstract la ON av.ACCOUNTNO = la.ACCOUNTNO AND av.ABSTRACTCODE = la.ABSTRACTCODE
WHERE   (AV.VEREND = 99999999999) 
GROUP BY AV.ACCOUNTNO, ac.ACCTTYPE, AV.ABSTRACTCODE, AV.TAXYEAR, AV.TAXDISTRICT, AV.MILLLEVY, v.create_datetime, v.create_user_id






