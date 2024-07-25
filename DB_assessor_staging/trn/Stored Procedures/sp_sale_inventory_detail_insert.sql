CREATE PROCEDURE [trn].[sp_sale_inventory_detail_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/22/2016
Developer:    Richard Edwards
Comments:	  Initial creation
              Merge changes into the sale inventory detail table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.sale_inventory_detail AS myTarget
USING trn.v_etl_sale_inventory_detail AS mySource
ON myTarget.inventorydetailid = mySource.inventorydetailid
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.recording_no = mySource.recording_no
		          ,myTarget.account_no = mySource.account_no
				  ,myTarget.detail_type = mySource.detail_type
				  ,myTarget.inventory_detail_type = mySource.inventory_detail_type
				  ,myTarget.inventory_detail_description = mySource.inventory_detail_description
		          ,myTarget.inventory_unit_count = mySource.inventory_unit_count
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
	         inventorydetailid
            ,recording_no
            ,account_no
            ,detail_type
            ,inventory_detail_type
            ,inventory_detail_description
            ,inventory_unit_count
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES (inventorydetailid
	        ,recording_no
            ,mySource.account_no
            ,mySource.detail_type
            ,mySource.inventory_detail_type
            ,mySource.inventory_detail_description
            ,mySource.inventory_unit_count
			,mySource.create_datetime
			,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;
