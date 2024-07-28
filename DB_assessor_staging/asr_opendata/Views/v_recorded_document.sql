﻿
create view [asr_opendata].[v_recorded_document]
as
SELECT
  substring( S_TBLSALE.RECEPTIONNO,1,20) RECEPTIONNO,
  S_TBLSALE.DEEDCODE DEEDCODE,
  cast(SUBSTRING(S_TBLSALE.DOCUMENTDATE,1,10) as date) DOCUMENTDATE,
  -- cast(S_TBLSALE.SALEPRICE  as varchar)+' bad' SALEPRICE,  --Used to force error for exception handling testing
  S_TBLSALE.SALEPRICE SALEPRICE,
  cast(SUBSTRING( S_TBLSALE.SALEDATE ,1,10) as date) SALEDATE,
  S_TBLSALE.GRANTOR GRANTOR,
  S_TBLSALE.GRANTEE GRANTEE,
  S_TBLSALE.BOOK BOOK,
  S_TBLSALE.PAGE PAGE,
  case when   INGRP2.SUM_IMPROVEDFLAG > 0 then 'Improved' --improvedflag is a not null column 
      else 'Vacant' 
	end IMP_OR_VAC,
 cast((isnull(S_TBLSALE.SALEPRICE,0)-(isnull(S_TBLSALE.PPADJAMOUNT,0)+isnull(S_TBLSALE.GOODWILLADJAMOUNT,0)+isnull(S_TBLSALE.OTHERADJAMOUNT,0)))*isnull(S_TBLSALE.TIMEADJ,0) as numeric(15,2)) TIME_ADJUSTED_SALE_PRICE
FROM
    dqm.Q_TBLSALE  S_TBLSALE   
 LEFT OUTER JOIN  ( SELECT
  AGGREGATOR.RECEPTIONNO RECEPTIONNO,
  AGGREGATOR.SUM_PRICE SUM_PRICE,
  AGGREGATOR.SUM_IMPROVEDFLAG SUM_IMPROVEDFLAG
FROM
  (SELECT
  S_TBNSALEINVENTORY.RECEPTIONNO RECEPTIONNO,
  SUM(S_TBNSALEINVENTORY.TIMEADJSALEPRICE) SUM_PRICE,
  SUM(S_TBNSALEINVENTORY.IMPROVEDFLAG) SUM_IMPROVEDFLAG
FROM
  asr_staging.S_TBNSALEINVENTORY  S_TBNSALEINVENTORY
GROUP BY
S_TBNSALEINVENTORY.RECEPTIONNO ) AGGREGATOR  ) INGRP2 ON ( ( S_TBLSALE.RECEPTIONNO = INGRP2.RECEPTIONNO ) );
