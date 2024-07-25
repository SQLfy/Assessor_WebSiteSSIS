




CREATE PROCEDURE [asr_posse].[sp_land_parent_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/5/2016
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Merge changes into the land_parent table  for POSSE
*************************************************************************************/
SET NOCOUNT ON;



MERGE asr_posse.land_parent AS myTarget
USING assessor_datastore.asr_posse_query.v_land_parent AS mySource
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
			,'SSIS_ETL_ODS2'
			,getdate()
			,'SSIS_ETL_ODS2'			      
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;
