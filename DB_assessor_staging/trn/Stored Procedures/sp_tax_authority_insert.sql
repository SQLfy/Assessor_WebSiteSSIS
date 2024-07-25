



CREATE PROCEDURE [trn].[sp_tax_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_authority table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.tax_authority AS myTarget
USING trn.v_etl_tax_authority AS mySource
ON myTarget.tax_authority_no = mySource.tax_authority_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.tax_authority_name = mySource.tax_authority_name
		          ,myTarget.authority_type = mySource.authority_type
                  ,myTarget.contact_person  = mySource.contact_person
                  ,myTarget.contact_address_line_1  = mySource.contact_address_line_1
                  ,myTarget.contact_address_line_2  = mySource.contact_address_line_2
                  ,myTarget.contact_city_name  = mySource.contact_city_name
                  ,myTarget.contact_state  = mySource.contact_state
                  ,myTarget.contact_zip_code  = mySource.contact_zip_code
				  ,myTarget.contact_phone  = mySource.contact_phone
                  ,myTarget.active_flag  = mySource.active_flag
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_authority_no
	        ,tax_authority_name
			,authority_type
            ,contact_person
            ,contact_address_line_1
            ,contact_address_line_2
            ,contact_city_name
            ,contact_state
            ,contact_zip_code
            ,active_flag
			,create_datetime
			,create_user_id
			,rowhash
			,contact_phone
            )
     VALUES (mySource.tax_authority_no 
            ,mySource.tax_authority_name
			,mySource.authority_type
            ,mySource.contact_person
            ,mySource.contact_address_line_1
            ,mySource.contact_address_line_2
            ,mySource.contact_city_name
            ,mySource.contact_state
            ,mySource.contact_zip_code
            ,mySource.active_flag
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,mySource.contact_phone
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;



