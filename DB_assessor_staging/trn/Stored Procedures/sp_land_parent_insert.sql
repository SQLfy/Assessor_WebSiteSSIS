



CREATE PROCEDURE [trn].[sp_land_parent_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     6/28/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the land_parent for POSSE consumption

	  
      ,STATE_PARCEL_NO
      ,PARENT_PARCEL_NO
      ,ROW_START_DTM
      ,ROW_END_DTM
      ,ROW_CURRENT_FLAG
      ,CREATE_DTM
      ,CREATE_USER_ID
      ,UPDATE_DTM
      ,UPDATE_USER_ID


*************************************************************************************/
SET NOCOUNT ON;

--select * from assessor_datastore.asr_datastore.land_parent

--select * from trn.v_etl_land_parent

MERGE assessor_datastore.asr_datastore.land_parent AS myTarget
USING trn.v_etl_land_parent AS mySource
ON  myTarget.state_parcel_no = mySource.state_parcel_no
AND myTarget.parent_parcel_no = mySource.parent_parcel_no


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (state_parcel_no
			,parent_parcel_no
			,create_dtm
			,create_user_id
			,update_dtm
			,update_user_id
            )
     VALUES (mySource.state_parcel_no
			,mySource.parent_parcel_no
			,getdate()
			,'SSIS_ETL'
			,getdate()
			,'SSIS_ETL'			      
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

