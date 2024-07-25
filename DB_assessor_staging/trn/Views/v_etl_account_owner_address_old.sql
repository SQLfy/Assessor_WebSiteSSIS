













CREATE VIEW [trn].[v_etl_account_owner_address_old]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/29/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the account_owner_address table
Mod #:  2
Mod Date:      3/31/2016
Developer:     Christine Lin
Comments:      change owner_name to 'Unavailable' from NULL
*************************************************************************************/
AS
SELECT
   aoa.ACCOUNTNO AS account_no
  ,p.PERSONCODE AS person_code
  ,aoa.PRIMARYOWNERFLAG AS primary_owner_flag
  ,CASE WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NOT NULL THEN p.NAME1 + ' '+ p.NAME2
        WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NULL THEN p.NAME1
		WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NULL AND p.NAME2 IS NOT NULL THEN p.NAME2
        ELSE 'Unavailable' END AS owner_name  --change to Not Available from NULL
  ,aoa.OWNERPERCENT AS ownership_percent
  ,p.FEDERALIDNO AS federal_id_no
  ,ad.ADDRESS1 AS address_line_1
  ,ad.ADDRESS2 AS address_line_2
  ,ad.CITY AS city_name
  ,ISNULL(ad.STATECODE, ad.PROVINCE) AS state
  ,ISNULL(ad.ZIPCODE, ad.POSTALCODE) AS zip_code
  ,ad.COUNTRY AS country
  ,p.PRIVATEFLAG AS private_flag --indicate peace officer or domestic violence related individual
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
  ,HASHBYTES('SHA2_256', 
			  ISNULL(RTRIM(aoa.ACCOUNTNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.PERSONCODE), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(aoa.PRIMARYOWNERFLAG), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(p.NAME1), 'DBNULL_TEXT') 
			--+ ISNULL(RTRIM(p.NAME2), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(CASE WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NOT NULL THEN p.NAME1 + ' '+ p.NAME2
                                WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NOT NULL AND p.NAME2 IS NULL THEN p.NAME1
	  	                        WHEN p.PRIVATEFLAG = 0 AND p.NAME1 IS NULL AND p.NAME2 IS NOT NULL THEN p.NAME2
                                ELSE 'Not Available' END), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(aoa.OWNERPERCENT), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(p.FEDERALIDNO), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.ADDRESS1), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.ADDRESS2), 'DBNULL_TEXT') 
			+ ISNULL(RTRIM(ad.CITY), 'DBNULL_TEXT')
			+ ISNULL(ISNULL(ad.STATECODE, ad.PROVINCE), 'DBNULL_TEXT')
			+ ISNULL(ISNULL(ad.ZIPCODE, ad.POSTALCODE), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(ad.COUNTRY), 'DBNULL_TEXT')
			+ ISNULL(RTRIM(p.PRIVATEFLAG), 'DBNULL_TEXT')
			) AS rowhash
FROM [dqm].[q_tblacctowneraddress] aoa
INNER JOIN [dqm].[q_tblpersonsecure] p
ON aoa.PERSONCODE = p.PERSONCODE
INNER JOIN  [dqm].[q_tbladdresssecure] ad
ON aoa.ADDRESSCODE = ad.ADDRESSCODE
AND aoa.PERSONCODE = ad.PERSONCODE
INNER JOIN [dqm].[valid_account] v  --make sure the same set of valid accounts are published
ON aoa.ACCOUNTNO = v.account_no;












