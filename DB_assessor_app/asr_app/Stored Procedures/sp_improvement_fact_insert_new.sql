
CREATE PROCEDURE [asr_app].[sp_improvement_fact_insert_new]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     12/29/2017
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Load the improvement_fact table

[ACCOUNT_NO]
[IMPROVEMENT_SF]
[NO_OF_FIREPLACE]
[TOTAL_GARAGE_SF]
[WALKOUT_BASEMENT_FLAG]
[TOTAL_PORCH_SF]
[TOTAL_FINISHED_BASEMENT_SF]
[TOTAL_UNFINISHED_BASEMENT_SF]
[IMPROVEMENT_NO]
[IMPROVEMENT_DETAIL_ID]
[PROPERTY_TYPE]
[CONDITION_TYPE]
[IMPROVEMENT_QUALITY]
[COMPLETED_PERCENT]
[IMPROVEMENT_UNIT_TYPE]

*************************************************************************************/

SET NOCOUNT ON;

TRUNCATE TABLE asr_app.improvement_fact_new

INSERT into asr_app.improvement_fact_new
(		 
	     ACCOUNT_NO
	   , IMPROVEMENT_SF
	   , NO_OF_FIREPLACE
	   , TOTAL_GARAGE_SF
	   , WALKOUT_BASEMENT_FLAG
	   , TOTAL_PORCH_SF
	   , TOTAL_FINISHED_BASEMENT_SF
	   , TOTAL_UNFINISHED_BASEMENT_SF
	   , IMPROVEMENT_NO
	   , IMPROVEMENT_DETAIL_ID
	   , PROPERTY_TYPE
	   , CONDITION_TYPE
	   , IMPROVEMENT_QUALITY
	   , COMPLETED_PERCENT
	   , IMPROVEMENT_UNIT_TYPE
)
SELECT PIMP.account_no
      ,PIMP.improvement_sf
	  ,0 --					    fire_places_count
	  ,0 --					    garage_sf
	  ,'N'  --					is_walkout_basement
	  ,0  --					total_porch_sf
	  ,0  -- 					finished_basement_sf
	  ,0  -- 					unfinished_basement_sf
     , PIMP.improvement_no
     , NULL   --PIMP.id
     , PIMP.property_type
	 , PIMP.condition_type
	 , PIMP.improvement_quality
	 , PIMP.completed_percent
	 , PIMP.improvement_unit_type
FROM
    [assessor_datastore].[asr_app_query].[v_improvement]  PIMP


--UPDATE FIREPLACES
UPDATE asr_app.improvement_fact_new
  SET no_of_fireplace = ISNULL(fp.fire_place_count,0)
  FROM
			(SELECT  I.account_no,I.improvement_no, (SUM(ISNULL(DETAIL_UNIT_COUNT,0))) fire_place_count
			  FROM
			   assessor_datastore.asr_datastore.IMPROVEMENT_DETAIL IMPD,
			   assessor_datastore.asr_datastore.IMPROVEMENT I
			  WHERE 1=1
			  AND IMPD.addon_code in ('95','285','290') 
			  AND I.improvement_no = IMPD.improvement_no 
			  AND I.account_no = IMPD.account_no
			  GROUP BY I.account_no, I.improvement_no) fp
		     WHERE fp.account_no = asr_app.improvement_fact_new.account_no AND fp.improvement_no = asr_app.improvement_fact_new.improvement_no;


---  GARAGE SQUARE FEET
UPDATE asr_app.improvement_fact_new
  SET total_garage_sf = ISNULL(gsf.total_garage_sf,0)
  FROM
		(SELECT imp_detail.account_no, imp_detail.improvement_no,
				  SUM(ISNULL(IMP_DETAIL.DETAIL_UNIT_COUNT,0)) TOTAL_GARAGE_SF,
				  IMP_DETAIL.IMPROVEMENT_DETAIL_ID
				FROM
				  assessor_datastore.asr_datastore.IMPROVEMENT_DETAIL  IMP_DETAIL
				  WHERE 
				  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE ='Garage' ) 
				GROUP BY
				imp_detail.account_no, imp_detail.improvement_no,IMP_DETAIL.IMPROVEMENT_DETAIL_ID) GSF
			WHERE gsf.account_no = asr_app.improvement_fact_new.account_no AND gsf.improvement_no = asr_app.improvement_fact_new.improvement_no;
  
			
			
-- WALKOUT BASEMENT
UPDATE asr_app.improvement_fact_new
  SET walkout_basement_flag = wo.walkout_basement_flag
  FROM
		(SELECT imp_detail.account_no, imp_detail.improvement_no,
		  IMP_DETAIL.IMPROVEMENT_DETAIL_ID,
		  CASE WHEN COUNT(DISTINCT IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION) = 0 THEN 'N'ELSE 'Y' END  WALKOUT_BASEMENT_FLAG
		FROM
		  assessor_datastore.asr_datastore.IMPROVEMENT_DETAIL  IMP_DETAIL
		  WHERE 
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE ='Basement' ) AND
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION ='Walkout' )
		GROUP BY
		imp_detail.account_no, imp_detail.improvement_no,IMP_DETAIL.IMPROVEMENT_DETAIL_ID) WO 
 WHERE wo.account_no = asr_app.improvement_fact_new.account_no AND wo.improvement_no = asr_app.improvement_fact_new.improvement_no;
 

 

-- FINISHED BASEMENT SF
UPDATE asr_app.improvement_fact_new
  SET total_finished_basement_sf = fbsf.TOTAL_FINISHED_BASEMENT_SF
  FROM
		(SELECT imp_detail.account_no, imp_detail.improvement_no,
		  SUM(IMP_DETAIL.DETAIL_UNIT_COUNT) TOTAL_FINISHED_BASEMENT_SF,
		  IMP_DETAIL.IMPROVEMENT_DETAIL_ID
		FROM
		  assessor_datastore.asr_datastore.IMPROVEMENT_DETAIL  IMP_DETAIL
		  WHERE 
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE ='Basement' )  AND
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION ='Finished' ) 
		GROUP BY
		imp_detail.account_no, imp_detail.improvement_no,IMP_DETAIL.IMPROVEMENT_DETAIL_ID)	FBSF 
        WHERE fbsf.account_no = asr_app.improvement_fact_new.account_no AND fbsf.improvement_no = asr_app.improvement_fact_new.improvement_no;
 


-- UNFINISHED BASEMENT SF
UPDATE asr_app.improvement_fact_new
  SET total_unfinished_basement_sf = ubsf.TOTAL_UNFINISHED_BASEMENT_SF
  FROM
		(SELECT imp_detail.account_no, imp_detail.improvement_no,
		  SUM(IMP_DETAIL.DETAIL_UNIT_COUNT) TOTAL_UNFINISHED_BASEMENT_SF,
		  IMP_DETAIL.IMPROVEMENT_DETAIL_ID IMPROVEMENT_DETAIL_ID4
		FROM
		  assessor_datastore.asr_datastore.IMPROVEMENT_DETAIL  IMP_DETAIL
		  WHERE 
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE ='Basement' )  AND
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION  <> 'Finished' )  AND
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION <> 'Walkout' )  AND
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION <> 'Garden Level' )  AND
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION <> 'Minimal Finish' )  AND
		  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE_DESCRIPTION <> 'Fair Finish' ) 
		GROUP BY
		imp_detail.account_no, imp_detail.improvement_no,IMP_DETAIL.IMPROVEMENT_DETAIL_ID) UBSF 
        WHERE ubsf.account_no = asr_app.improvement_fact_new.account_no AND ubsf.improvement_no = asr_app.improvement_fact_new.improvement_no;
 

-- PORCH SQUARE FEET
UPDATE asr_app.improvement_fact_new
  SET total_porch_sf = psf.TOTAL_PORCH_SF
  FROM

		(SELECT imp_detail.account_no, imp_detail.improvement_no,
			SUM(IMP_DETAIL.DETAIL_UNIT_COUNT) TOTAL_PORCH_SF
			FROM
			  assessor_datastore.asr_datastore.IMPROVEMENT_DETAIL  IMP_DETAIL
			  WHERE 
			  ( IMP_DETAIL.IMPROVEMENT_DETAIL_TYPE ='Porch' ) 
			GROUP BY imp_detail.account_no, imp_detail.improvement_no ) PSF
            WHERE psf.account_no = asr_app.improvement_fact_new.account_no AND psf.improvement_no = asr_app.improvement_fact_new.improvement_no;
 
 

