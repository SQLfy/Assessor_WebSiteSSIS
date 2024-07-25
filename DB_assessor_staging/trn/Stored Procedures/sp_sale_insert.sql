



CREATE PROCEDURE [trn].[sp_sale_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/24/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the sale table

Mod #:  2
Mod Date:     6/29/2016
Developer:    Richard Edwards
Comments:	  Add book and page columns to sale

Mod #:  3
Mod Date:     5/12/2019
Developer:    David Guillen
Comments:	  Add book and page columns to sale

Mod #:  4
Mod Date:     6/24/2020
Developer:    David Guillen
Comments:	  Add exclude_code_2, exclude_code_2_description to sale
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.sale AS myTarget
USING trn.v_etl_sale AS mySource
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
                  ,myTarget.exclude_code_1_description = mySource.exclude_code_1_description 
                  ,myTarget.improved_flag = mySource.improved_flag
                  ,myTarget.non_sale_flag = mySource.non_sale_flag
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.valid2_flag = mySource.valid2_flag
				  ,myTarget.book = mySource.book
				  ,myTarget.page = mySource.page
				  ,myTarget.exclude_code_2 = mySource.exclude_code_2
                  ,myTarget.exclude_code_2_description = mySource.exclude_code_2_description 


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             recording_no
            ,grantor
            ,grantee
            ,sale_date
            ,deed_code
            ,deed_code_description
            ,sale_price
            ,valid1_flag
            ,confirmed_flag
            ,exclude_code_1
            ,exclude_code_1_description
            ,improved_flag
            ,non_sale_flag
	        ,create_datetime
			,create_user_id
	        ,rowhash
			,valid2_flag
			,book
			,page
			,exclude_code_2
            ,exclude_code_2_description
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
            ,mySource.exclude_code_1_description
            ,mySource.improved_flag
            ,mySource.non_sale_flag
	        ,mySource.create_datetime
			,mySource.create_user_id
	        ,mySource.rowhash
			,mySource.valid2_flag
			,mySource.book
			,mySource.page
			,mySource.exclude_code_2
            ,mySource.exclude_code_2_description
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;