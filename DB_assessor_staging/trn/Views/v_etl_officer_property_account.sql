
CREATE VIEW [trn].[v_etl_officer_property_account]
AS
--  this sql is used to derive the POM data to be published to the dc_central.officer_property_account table
SELECT oa.accountno
      ,a.parcelno
	  ,ps.name1
	  ,ads.address1
	  ,ads.city
	  ,ads.zipcode
	  ,ads.statecode
      --,oa.personcode
	  ,ps.privateflag
  FROM asr_staging.s_tblacctowneraddress oa
  JOIN asr_staging.s_tblacct a on a.accountno = oa.ACCOUNTNO
  JOIN asr_staging.s_tbladdresssecure ads on ads.ADDRESSCODE = oa.ADDRESSCODE
  JOIN asr_staging.s_tblpersonsecure ps on ps.personcode  = oa.personcode
WHERE ps.privateflag = 1


