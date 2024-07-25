

CREATE PROCEDURE [asr_app].[sp_pers_prop_detail_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/10/2017
Developer:    tony golden
Comments:	  Initial creation
              Merge changes into the pers_prop_detail
*************************************************************************************/
--select * from assessor_datastore.asr_app_query.v_pers_prop_detail


SET NOCOUNT ON;

TRUNCATE TABLE assessor_app.asr_app.pers_prop_detail

MERGE assessor_app.asr_app.pers_prop_detail AS myTarget
USING assessor_datastore.asr_app_query.v_pers_prop_detail  AS mySource
ON myTarget.account_no = mySource.account_no
   and myTarget.detail_id = mySource.detail_id

WHEN MATCHED 
	 THEN
        UPDATE SET   				
					 myTarget.ACCOUNT_NO					= mySource.ACCOUNT_NO
					,myTarget.DETAIL_ID						= mySource.DETAIL_ID
					,myTarget.PERS_PROP_TYPE				= mySource.PERS_PROP_TYPE
					,myTarget.ASSET_TYPE_CODE				= mySource.ASSET_TYPE_CODE
					,myTarget.ASSET_CONDITION_CODE			= mySource.ASSET_CONDITION_CODE
					,myTarget.ACQUIRED_YEAR					= mySource.ACQUIRED_YEAR
					,myTarget.QUANTITY						= mySource.QUANTITY
					,myTarget.ORIGINAL_COST					= mySource.ORIGINAL_COST
					,myTarget.ASSET_DETAIL_DESCR			= mySource.ASSET_DETAIL_DESCR
					,myTarget.ROW_START_DTM					= mySource.ROW_START_DTM
					,myTarget.ROW_END_DTM					= mySource.ROW_END_DTM
					,myTarget.ROW_CURRENT_FLAG				= mySource.ROW_CURRENT_FLAG
					,myTarget.CREATE_DTM					= mySource.CREATE_DTM
					,myTarget.CREATE_USER_ID				= mySource.CREATE_USER_ID
					,myTarget.UPDATE_DTM					= getdate()
					,myTarget.UPDATE_USER_ID				= suser_name()
													
					     
				  
WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
              PERS_PROP_DETAIL_EID
			, ACCOUNT_NO
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
     VALUES (
	           mySource.PERS_PROP_DETAIL_EID
			  ,mySource.ACCOUNT_NO
			  ,mySource.DETAIL_ID
			  ,mySource.PERS_PROP_TYPE
			  ,mySource.ASSET_TYPE_CODE
			  ,mySource.ASSET_CONDITION_CODE
			  ,mySource.ACQUIRED_YEAR
			  ,mySource.QUANTITY
			  ,mySource.ORIGINAL_COST
			  ,mySource.ASSET_DETAIL_DESCR
			  ,mySource.ROW_START_DTM
			  ,mySource.ROW_END_DTM
			  ,mySource.ROW_CURRENT_FLAG
			  ,getdate()
			  ,suser_name()
			  ,mySource.UPDATE_DTM
			  ,mySource.UPDATE_USER_ID
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







