





CREATE PROCEDURE [asr_posse].[sp_tax_district_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/5/2016
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Merge changes into the tax_district_authority table for POSSE
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_posse.tax_district_authority AS myTarget
USING assessor_datastore.asr_posse_query.v_tax_district_authority AS mySource
ON myTarget.tax_district_no = mySource.tax_district_no
AND myTarget.tax_authority_no = mySource.tax_authority_no 


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_district_no
	        ,tax_authority_no
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.tax_district_no 
            ,mySource.tax_authority_no
            ,getdate()
            ,'SSIS_ETL_ODS2'
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

