
CREATE PROCEDURE [trn].[sp_land_attribute_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/22/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the land attribute table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.land_attribute AS myTarget
USING trn.v_etl_land_attribute AS mySource
ON myTarget.account_no = mySource.account_no
 AND myTarget.detail_id = mySource.detail_id
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.attribute_type = mySource.attribute_type
                  ,myTarget.attribute_subtype = mySource.attribute_subtype
                  ,myTarget.attribute_adjustment = mySource.attribute_adjustment
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             account_no
            ,detail_id
            ,attribute_type
            ,attribute_subtype
            ,attribute_adjustment
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES ( mySource.account_no
            ,mySource.detail_id
            ,mySource.attribute_type
            ,mySource.attribute_subtype
            ,mySource.attribute_adjustment
			,mySource.create_datetime
			,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

