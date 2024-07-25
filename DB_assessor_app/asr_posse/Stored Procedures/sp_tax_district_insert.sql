





CREATE PROCEDURE [asr_posse].[sp_tax_district_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/05/2016
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Merge changes into the tax_district table for POSSE
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_posse.tax_district AS myTarget
USING assessor_datastore.asr_posse_query.v_tax_district AS mySource
ON myTarget.tax_district_no = mySource.tax_district_no
WHEN MATCHED 
	 AND ISNULL(RTRIM(myTarget.tax_district_name), 'DBNULL_TEXT') <> ISNULL(RTRIM(mySource.tax_district_name), 'DBNULL_TEXT') 
	 THEN
        UPDATE SET myTarget.tax_district_name = mySource.tax_district_name
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (tax_district_no
	        ,tax_district_name
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.tax_district_no 
            ,mySource.tax_district_name
            ,getdate()
			,'SSIS_ETL_ODS2'
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;


