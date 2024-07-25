

CREATE PROCEDURE [trn].[sp_pers_prop_detail_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/10/2017
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Merge changes into the datastore pers_prop_detail table


  ACCOUNT_NO
, DETAIL_ID
, PERS_PROP_TYPE
, ASSET_TYPE_CODE
, ASSET_CONDITION_CODE
, ACQUIRED_YEAR
, QUANTITY
, ORIGINAL_COST
, ASSET_DETAIL_DESCR
, ROW_START_DTM
, ROW_END_DTM
, ROW_CURRENT_FLAG
, CREATE_DTM
, CREATE_USER_ID
, UPDATE_DTM
, UPDATE_USER_ID
*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE assessor_datastore.asr_datastore.pers_prop_detail

MERGE assessor_datastore.asr_datastore.pers_prop_detail myTarget
USING trn.v_etl_pers_prop_detail AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 THEN
        UPDATE SET myTarget.account_no					= mySource.account_no			
		          ,myTarget.detail_id					= mySource.detail_id			
				  ,myTarget.pers_prop_type 				= mySource.pers_prop_type 		
				  ,myTarget.asset_type_code 			= mySource.asset_type_code 	
				  ,myTarget.asset_condition_code 		= mySource.asset_condition_code
				  ,myTarget.acquired_year				= mySource.acquired_year		
				  ,myTarget.quantity 					= mySource.quantity 			
				  ,myTarget.original_cost				= mySource.original_cost		
				  ,myTarget.asset_detail_descr 			= mySource.asset_detail_descr 	
				  ,myTarget.row_start_dtm 				= NULL	
				  ,myTarget.row_end_dtm					= NULL		
				  ,myTarget.row_current_flag			= NULL
				  ,myTarget.create_dtm 					= NULL		
				  ,myTarget.create_user_id				= NULL	
				  ,myTarget.update_dtm					= GETDATE()		
				  ,myTarget.update_user_id				= SUSER_ID()


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
		      ACCOUNT_NO
			, DETAIL_ID
			, PERS_PROP_TYPE
			, ASSET_TYPE_CODE
			, ASSET_CONDITION_CODE
			, ACQUIRED_YEAR
			, QUANTITY
			, ORIGINAL_COST
			, ASSET_DETAIL_DESCR
			, ROW_START_DTM
			, ROW_END_DTM
			, ROW_CURRENT_FLAG
			, CREATE_DTM
			, CREATE_USER_ID
			, UPDATE_DTM
			, UPDATE_USER_ID
            )
     VALUES (mySource.ACCOUNT_NO
	        ,mySource.DETAIL_ID
	        ,mySource.PERS_PROP_TYPE
	        ,mySource.ASSET_TYPE_CODE
	        ,mySource.ASSET_CONDITION_CODE
	        ,mySource.ACQUIRED_YEAR
	        ,mySource.QUANTITY
	        ,mySource.ORIGINAL_COST
	        ,mySource.ASSET_DETAIL_DESCR
	        ,NULL
			,NULL
	        ,NULL
			,GETDATE()
            ,SUSER_ID()
            ,GETDATE()
			,SUSER_ID()
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;






