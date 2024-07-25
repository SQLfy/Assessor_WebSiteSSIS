





CREATE PROCEDURE [asr_ods2].[sp_tax_district_authority_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/29/2016
Developer:    David Guillen
Comments:	  Initial creation
              Merge changes into the tax_district_authority table
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_ods2.tax_district_authority AS myTarget
USING assessor_datastore.asr_ods2_query.v_tax_district_authority AS mySource
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
            ,mySource.create_datetime
            ,mySource.create_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

