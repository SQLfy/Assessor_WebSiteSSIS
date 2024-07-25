







CREATE PROCEDURE [asr_app].[sp_sale_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Richard Edwards
Comments:	  Initial creation 
              Merge changes into the sale table

Mod #:  2
Mod Date:     6/29/2016
Developer:    Richard Edwards
Comments:	  Add Book and Page columns to sale table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_app.sale AS myTarget
USING assessor_datastore.asr_app_query.v_sale AS mySource
ON myTarget.recording_no = mySource.recording_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	
	 THEN
        UPDATE SET myTarget.grantor = mySource.grantor
				  ,myTarget.grantee = mySource.grantee
				  ,myTarget.sale_date = mySource.sale_date
				  ,myTarget.deed_code = mySource.deed_code
				  ,myTarget.deed_code_description = mySource.deed_code_description
				  ,myTarget.sale_price = mySource.sale_price
				  ,myTarget.valid1_flag = mySource.valid1_flag
				  ,myTarget.confirmed_flag = mySource.confirmed_flag
				  ,myTarget.exclude_code_1 = mySource.exclude_code_1
				  ,myTarget.improved_flag = mySource.improved_flag
				  ,myTarget.non_sale_flag = mySource.non_sale_flag
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.valid2_flag = mySource.valid2_flag
				  ,myTarget.book = mySource.book
				  ,myTarget.page = mySource.page


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (recording_no
	        ,grantor
			,grantee
			,sale_date
			,deed_code
			,deed_code_description
			,sale_price
			,valid1_flag
			,confirmed_flag
			,exclude_code_1
			,improved_flag
			,non_sale_flag
			,create_datetime
			,create_user_id
			,rowhash
			,valid2_flag
			,book
			,page
            )
     VALUES (mySource.recording_no
	        ,mySource.grantor
			,mySource.grantee
			,mySource.sale_date
			,mySource.deed_code
			,mySource.deed_code_description
			,mySource.sale_price
			,mySource.valid1_flag
			,mySource.confirmed_flag
			,mySource.exclude_code_1
			,mySource.improved_flag
			,mySource.non_sale_flag
			,mySource.create_datetime
			,mySource.create_user_id
			,mySource.rowhash
			,mySource.valid2_flag
			,mySource.book
			,mySource.page
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





