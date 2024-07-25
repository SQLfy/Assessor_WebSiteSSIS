CREATE VIEW [rw_extract].[V_TBLAPPEALFILER]
AS
SELECT  AF.APPEALNO 
      ,AF.PERSONCODE
      ,AF.ADDRESSCODE
      ,P.EMAILADDRESS FILER_EMAIL
      ,P.PHONE FILER_PHONE
	  ,P.NAME1 + +isnull(P.NAME2,' ')  FILER
	  ,A.ADDRESS1 FILER_ADDRESS
	  ,A.CITY  FILER_CITY
	  ,A.STATECODE FILER_STATECODE
	  ,A.ZIPCODE FILER_ZIPCODE
  FROM PRRW.ENCOMPASS.TBLAPPEALFILER AF 
	  JOIN rw_extract.V_TBLPERSONSECURE P ON P.PERSONCODE = AF.PERSONCODE
	  JOIN rw_extract.V_TBLADDRESSSECURE A ON A.ADDRESSCODE = AF.ADDRESSCODE
                    ,(select cast(parameter_value as numeric) verstart
                     from RW_EXTRACT.ETL_PARAMETER 
                     where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
              ,(select cast(parameter_value as numeric) verend
                     from RW_EXTRACT.ETL_PARAMETER 
                     where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where AF.VERSTART <= p1.verstart
  and AF.VEREND > p2.verend
 -- and ISNULL(PAA.VEREND,'99999999999') = '99999999999'  --AJG added code to account for person_secure ver end of 999's only
 -- and ISNULL(PS.VEREND,'99999999999') = '99999999999';  --AJG added code to account for person_secure ver end of 999's only
  --and appealno in (201704207,201704235);



