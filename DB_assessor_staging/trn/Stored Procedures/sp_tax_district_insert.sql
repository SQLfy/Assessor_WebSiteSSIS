


CREATE PROCEDURE [trn].[sp_tax_district_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_district table
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.tax_district AS myTarget
USING trn.v_etl_tax_district AS mySource
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
            ,mySource.create_datetime
            ,mySource.create_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;



