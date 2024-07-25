






CREATE VIEW [trn].[v_etl_tax_authority_fund]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/26/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all tax authorities
MOD #2 
Mod Date:      1/4/2016
Developer:     tony golden
Comments:      Bug fix
               removed assessed_mill_levy field from hashkey. that value can change and 
			   needs to be updated if so.
*************************************************************************************/
AS
SELECT
   i.TAXAUTHORITY AS tax_authority_no
  ,i.FUNDCODE AS tax_fund_code
  ,i.LEVYTYPEID AS levy_type_id
  ,l.LEVYTYPE AS levy_type
  ,i.ASSESSEDMILLLEVY AS assessed_mill_levy
  ,f.FUNDDESCRIPTION  AS tax_fund_description
  ,GETDATE() AS create_datetime
  ,SUSER_NAME() AS create_user_id
      ,HASHBYTES('SHA2_256', 
                  ISNULL(RTRIM(i.TAXAUTHORITY), 'DBNULL_TEXT')
                + ISNULL(RTRIM(i.FUNDCODE), 'DBNULL_TEXT')
                + ISNULL(RTRIM(i.LEVYTYPEID), 'DBNULL_TEXT')
                + ISNULL(RTRIM(l.LEVYTYPE), 'DBNULL_TEXT')
               -- + ISNULL(RTRIM(i.ASSESSEDMILLLEVY), 'DBNULL_TEXT')
                + ISNULL(RTRIM(f.FUNDDESCRIPTION), 'DBNULL_TEXT')
				) AS rowhash	
FROM
    dqm.q_tmaptaxauthoritydetailfund i
	INNER JOIN asr_staging.s_tlkptaxfund f
	ON i.fundcode = f.fundcode
	INNER JOIN asr_staging.s_tsylevytype l
	ON i.LEVYTYPEID = l.LEVYTYPEID









