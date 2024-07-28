﻿


-- =====================================================================================================================
-- Author:		David Guillen	
-- Create date: 09/08/2017
-- Description:	Perform load of tmp table to hold account/reception number basement finished and unfinished sq feet 
-- =====================================================================================================================

CREATE PROCEDURE [trn].[sp_property_sale] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

TRUNCATE TABLE ASSESSOR_STAGING.work.tmp_bsmt_fin_unfin;
TRUNCATE TABLE ASSESSOR_DATASTORE.ASR_DATASTORE.property_sale;

--select count(*) from ASSESSOR_STAGING.work.tmp_bsmt_fin_unfin;
--select count(*) from ASSESSOR_DATASTORE.ASR_DATASTORE.property_sale;

insert into ASSESSOR_STAGING.work.tmp_bsmt_fin_unfin (ACCOUNTNO, RECEPTIONNO, INVENTORYDETAILTYPE, INVENTORYDETAILDESCRIPTION, INVENTORYUNITCOUNT, FIN_OR_UNFIN_BSMT)
		SELECT DISTINCT ACCOUNTNO
		,RECEPTIONNO
		,INVENTORYDETAILTYPE 
		,INVENTORYDETAILDESCRIPTION
		,INVENTORYUNITCOUNT
		,'FINISHED_BASEMENT' FIN_OR_UNFIN_BSMT
		FROM ASSESSOR_STAGING.ASR_STAGING.S_TBNSALEINVENTORYDETAIL
		where inventorydetaildescription in ('Finished')
		and inventorydetailtype = 'Basement'
		UNION
		select ACCOUNTNO
		, RECEPTIONNO
		, INVENTORYDETAILTYPE
		, INVENTORYDETAILDESCRIPTION 
		, INVENTORYUNITCOUNT
		, 'UNFINISHED_BASEMENT' FIN_OR_UNFIN_BSMT
		from ASSESSOR_STAGING.ASR_STAGING.S_TBNSALEINVENTORYDETAIL
		where INVENTORYDETAILTYPE = 'Basement' 
		and INVENTORYDETAILDESCRIPTION like 'Bsmnt%'
		ORDER BY ACCOUNTNO, RECEPTIONNO
 



 -- property sale query and insert
INSERT INTO ASSESSOR_DATASTORE.ASR_DATASTORE.PROPERTY_SALE (ACCOUNT_NO, RECORDING_NO, ACCOUNT_TYPE_CODE, SUBDIVISION_NO, SUB_FILING_RECORDING_NO, LOT_NO, BLOCK_NO, PROPERTY_TYPE_CODE, QUALITY_CODE, BUILT_YEAR, BASEMENT_UNFINISHED_SF, BASEMENT_FINISHED_SF, WALKOUT_BASEMENT_FLAG, GARAGE_SF, NET_ACRES, OCCUPANCY_CODE, HEAT_TYPE, BUILT_AS_CODE, NO_OF_BEDROOM, NO_OF_BATHROOM, UNIT_TYPE, ROW_START_DTM, ROW_END_DTM, ROW_CURRENT_FLAG, CREATE_DTM, CREATE_USER_ID, UPDATE_DTM, UPDATE_USER_ID, TOTAL_IMP_SF, DISTRESSED_SALE_FLAG, LAND_VALUATION_CLASS_CODE, LAND_ECONOMIC_AREA_CODE, NEIGHBORHOOD_CODE, NEIGHBORHOOD_EXTENSION, NO_OF_BUILDING, VALID_ARMS_LENGTH_TRANS_FLAG)
 SELECT
  IN_SA.ACCOUNTNO ACCOUNTNO,
  SUBSTRING( IN_SA.RECEPTIONNO ,1,20) RECEPTIONNO,
  IN_SALE_INV.ACCTTYPE ACCTTYPE,
  ISNULL((SELECT
  SUB_FILING_S.SUBDIVISION_NO SUBDIVISION_NO
FROM
  ASSESSOR_DATASTORE.ASR_DATASTORE.SUB_FILING  SUB_FILING_S
  WHERE 
  ( SUB_FILING_S.SUB_FILING_RECORDING_NO = IN_SALE_INV.SUBDIVISION )), NULL) SUBDIVISION_NO,
  ISNULL((SELECT
  SUB_FILING_S.SUB_FILING_RECORDING_NO SUB_FILING_RECORDING_NO
FROM
  ASSESSOR_DATASTORE.ASR_DATASTORE.SUB_FILING  SUB_FILING_S
  WHERE 
  ( SUB_FILING_S.SUB_FILING_RECORDING_NO = IN_SALE_INV.SUBDIVISION ) ), NULL) SUB_FILING_RECORDING_NO,
  IN_SALE_INV.LOT LOT,
  IN_SALE_INV.BLOCK BLOCK,
  IN_SALE_INV.PROPERTYTYPE PROPERTYTYPE,
  IN_SALE_INV.IMPQUALITY IMPQUALITY,
  CAST( IN_SALE_INV.BLTASYEARBUILT  AS VARCHAR(4)) BUILT_YEAR,
  0 BASEMENT_UNFINISHED_SF,
  0 BASEMENT_FINISHED_SF,
  DBO.IS_WALKOUT(IN_SA.ACCOUNTNO) IS_WALKOUT,
  DBO.GET_GARAGE_SF(IN_SA.ACCOUNTNO) GARAGE_SF,
  ROUND(IN_SALE_INV.LANDNETACRECOUNT,4) LANDNETACRECOUNT,
  CAST( IN_SALE_INV.OCCCODE1 AS VARCHAR ) OCCCODE_CHAR,
  IN_SALE_INV.HVACTYPE HVACTYPE,
  ISNULL((SELECT
  BUILT_AS_CODE_S.BUILT_AS_CODE BUILT_AS_CODE
FROM
  ASSESSOR_DATASTORE.ASR_DATASTORE.BUILT_AS_CODE  BUILT_AS_CODE_S
  WHERE 
  ( BUILT_AS_CODE_S.CODE_DESCR = IN_SALE_INV.BLTASDESCRIPTION ) ), NULL) BUILT_AS_CODE,
  IN_SALE_INV.BEDROOMCOUNT BEDROOMCOUNT,
  IN_SALE_INV.BATHCOUNT BATHROOMCOUNT,
  IN_SALE_INV.IMPUNITTYPE IMPUNITTYPE,
  NULL ROW_START_DTM,
   NULL ROW_END_DTM,
   NULL ROW_CURRENT_FLAG,
   NULL CREATE_DTM,
   NULL CREATE_USER_ID,
   NULL UPDATE_DTM,
   NULL UPDATE_USER_ID,
  IN_SALE_INV.TOTALIMPSF TOTALIMPSF,
  case 
when  IN_SE.DISTRESSED_SALE_FLAG is null  
      then 'N' 
else 
       IN_SE.DISTRESSED_SALE_FLAG  
end EXP_DISTRESSED_SALE_FLAG,
  IN_SALE_INV.LANDABSTRACTCODE LANDABSTRACTCODE,
  IN_SALE_INV.LEA LEA,
  IN_SALE_INV.NBHDCODE1 NBHDCODE1,
  IN_SALE_INV.NBHDEXTENSION1 NBHDEXTENSION1,
  IN_SALE_INV.IMPCOUNT IMPCOUNT,
  case 
   when  IN_SALE_INV.VALID1FLAG = 1 then 'Y' 
   when  IN_SALE_INV.VALID1FLAG  = 0 then 'N' 
   else 'N' 
end VALID_ARMS_LENGTH_TRANS_FLAG
FROM
   ( SELECT
  Q_TBLSALEACCT.ACCOUNTNO ACCOUNTNO,
  Q_TBLSALEACCT.RECEPTIONNO RECEPTIONNO
FROM
    ASSESSOR_STAGING.DQM.Q_TBLSALEACCT  Q_TBLSALEACCT   
 JOIN   ASSESSOR_STAGING.DQM.Q_TBLSALE  Q_TBLSALE ON ( ( Q_TBLSALEACCT.RECEPTIONNO = Q_TBLSALE.RECEPTIONNO ) )
JOIN   ASSESSOR_DATASTORE.ASR_DATASTORE.ACCOUNT  ACCOUNT ON ( ( ACCOUNT.ACCOUNT_NO = Q_TBLSALEACCT.ACCOUNTNO ) )
  WHERE 
  ( Q_TBLSALE.NONSALEFLAG = 0 )  ) IN_SA   
 LEFT OUTER JOIN  ( SELECT
  S_TBNSALEINVENTORY.RECEPTIONNO RECEPTIONNO,
  S_TBNSALEINVENTORY.ACCOUNTNO ACCOUNTNO,
  S_TBNSALEINVENTORY.ACCTTYPE ACCTTYPE,
  S_TBNSALEINVENTORY.LEA LEA,
  S_TBNSALEINVENTORY.SUBDIVISION SUBDIVISION,
  S_TBNSALEINVENTORY.PROPERTYTYPE PROPERTYTYPE,
  S_TBNSALEINVENTORY.IMPQUALITY IMPQUALITY,
  S_TBNSALEINVENTORY.BLTASYEARBUILT BLTASYEARBUILT,
  S_TBNSALEINVENTORY.IMPCOUNT IMPCOUNT,
  S_TBNSALEINVENTORY.BEDROOMCOUNT BEDROOMCOUNT,
  S_TBNSALEINVENTORY.BATHCOUNT BATHCOUNT,
  S_TBNSALEINVENTORY.TOTALIMPSF TOTALIMPSF,
  S_TBNSALEINVENTORY.LANDABSTRACTCODE LANDABSTRACTCODE,
  S_TBNSALEINVENTORY.LANDNETACRECOUNT LANDNETACRECOUNT,
  S_TBNSALEINVENTORY.HVACTYPE HVACTYPE,
  S_TBNSALEINVENTORY.IMPUNITTYPE IMPUNITTYPE,
  S_TBNSALEINVENTORY.NBHDCODE1 NBHDCODE1,
  S_TBNSALEINVENTORY.NBHDEXTENSION1 NBHDEXTENSION1,
  S_TBNSALEINVENTORY.OCCCODE1 OCCCODE1,
  S_TBNSALEINVENTORY.CONFIRMEDFLAG CONFIRMEDFLAG,
  S_TBNSALEINVENTORY.TOTALFINISHEDSF TOTALFINISHEDSF,
  S_TBNSALEINVENTORY.TOTALUNFINISHEDSF TOTALUNFINISHEDSF,
  S_TBNSALEINVENTORY.BLTASCODE BLTASCODE,
  S_TBNSALEINVENTORY.EXCLUDECODE1 EXCLUDECODE1,
  S_TBNSALEINVENTORY.VALID1FLAG VALID1FLAG,
  S_TBNSALEINVENTORY.LOT LOT,
  S_TBNSALEINVENTORY.BLOCK BLOCK,
  S_TBNSALEINVENTORY.BLTASDESCRIPTION BLTASDESCRIPTION
FROM
  ASSESSOR_STAGING.ASR_STAGING.S_TBNSALEINVENTORY  S_TBNSALEINVENTORY ) IN_SALE_INV ON ( (( IN_SA.ACCOUNTNO = IN_SALE_INV.ACCOUNTNO )) AND (( LTRIM(RTRIM(IN_SA.RECEPTIONNO)) = LTRIM(RTRIM(IN_SALE_INV.RECEPTIONNO)) )) )
LEFT OUTER JOIN  ( SELECT
  case  
when  ETL_CNTL_SALESEXCLUDE.EXCLUDECD IS NOT NULL then 'Y' 
else 'N' 
end DISTRESSED_SALE_FLAG,
  S_TLKPSALEEXCLUDE.EXCLUDEDESCRIPTION EXCLUDEDESCRIPTION,
  S_TLKPSALEEXCLUDE.EXCLUDECODE EXCLUDECODE
FROM
    ASSESSOR_STAGING.ASR_STAGING.S_TLKPSALEEXCLUDE  S_TLKPSALEEXCLUDE   
 LEFT OUTER JOIN ASSESSOR_DATASTORE.ASR_DATASTORE.ETL_CNTL_SALESEXCLUDE ETL_CNTL_SALESEXCLUDE ON ( ( S_TLKPSALEEXCLUDE.EXCLUDECODE = ETL_CNTL_SALESEXCLUDE.EXCLUDECD ) ) ) IN_SE ON ( ( IN_SALE_INV.EXCLUDECODE1 = IN_SE.EXCLUDECODE ) )

 -- update for basement unfinished sf
 update ASSESSOR_DATASTORE.ASR_DATASTORE.PROPERTY_SALE 
 set BASEMENT_UNFINISHED_SF = (select SUM(INVENTORYUNITCOUNT) from [work].[tmp_bsmt_fin_unfin] fu where fu.accountno = account_no and fu.receptionno = recording_no and fu.fin_or_unfin_bsmt = 'UNFINISHED_BASEMENT')
 
 -- update for basement finished sf
  update ASSESSOR_DATASTORE.ASR_DATASTORE.PROPERTY_SALE 
 set BASEMENT_FINISHED_SF = (select SUM(INVENTORYUNITCOUNT) from [work].[tmp_bsmt_fin_unfin] fu where fu.accountno = account_no and fu.receptionno = recording_no and fu.fin_or_unfin_bsmt = 'FINISHED_BASEMENT')

 -- update for distressed sales (based on value in tblsale SALEOT0 field)  -- AJG 5/19/2017
  update ASSESSOR_DATASTORE.ASR_DATASTORE.PROPERTY_SALE 
 set DISTRESSED_SALE_FLAG = (select 'Y' from dqm.q_tblsale sale where sale.receptionno = recording_no and sale.SALEOT0 = 'DISTRESSED')

END


/*

testing code

select * from property_sale

select accountno, receptionno, INVENTORYUNITCOUNT from [work].[tmp_bsmt_fin_unfin] fu where  fu.fin_or_unfin_bsmt = 'UNFINISHED_BASEMENT' and  accountno = 'R0400356'

select accountno, receptionno, INVENTORYUNITCOUNT from [work].[tmp_bsmt_fin_unfin] fu where  fu.fin_or_unfin_bsmt = 'FINISHED_BASEMENT'  and accountno = 'R0400356'


select * from work.tmp_bsmt_fin_unfin
where accountno in (
'R0388884')

371x784
R00003002009088980
R00003512002101307
R0000351319x701
R00003519012946
R0000465362x122

select accountno, receptionno,count(*)
 from [work].[tmp_bsmt_fin_unfin]
 where fin_or_unfin_bsmt = 'UNFINISHED_BASEMENT'
 group by accountno, receptionno
 having count(*) > 1

 select * from work.tmp_bsmt_fin_unfin
 where accountno in 
 (
'R0433504',
'R0437082',
'R0383003',
'R0369534',
'R0480852',
'R0417759',
'R0279064',
'R0434604',
'R0445894'
)
 



 SELECT * FROM PROPERTY_SALE WHERE ACCOUNT_NO = 'R0279064'

 select SUM(INVENTORYUNITCOUNT) from [work].[tmp_bsmt_fin_unfin] fu where fu.accountno = 'R0279064' and fu.receptionno = '2014074433' and fu.fin_or_unfin_bsmt = 'FINISHED_BASEMENT'

 */