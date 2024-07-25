





CREATE PROCEDURE [asr_posse].[sp_tax_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/5/2016
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Merge changes into the tax_authority table  for POSSE
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_posse.tax_authority AS myTarget
USING assessor_datastore.asr_posse_query.v_tax_authority AS mySource
ON myTarget.tax_authority_no = mySource.tax_authority_no
WHEN MATCHED 
	 AND ISNULL(RTRIM(myTarget.tax_authority_name), 'DBNULL_TEXT') <> ISNULL(RTRIM(mySource.tax_authority_name), 'DBNULL_TEXT')
	 OR ISNULL(RTRIM(myTarget.authority_type), 'DBNULL_TEXT') <> ISNULL(RTRIM(mySource.authority_type), 'DBNULL_TEXT') 
	 THEN
        UPDATE SET myTarget.tax_authority_name = mySource.tax_authority_name
		          ,myTarget.authority_type = mySource.authority_type
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()



WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_authority_no
	        ,tax_authority_name
			,authority_type
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.tax_authority_no 
            ,mySource.tax_authority_name
			,mySource.authority_type
            ,getdate()
            ,'SSIS_ETL_ODS2'
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

