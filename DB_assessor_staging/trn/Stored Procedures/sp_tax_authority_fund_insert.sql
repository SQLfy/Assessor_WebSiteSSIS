﻿



CREATE PROCEDURE [trn].[sp_tax_authority_fund_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     1/26/2016
Developer:    Christine Lin
Comments:	  Initial creation
              Merge changes into the tax_authority table

MOD #   2	  12/20/2017 
			  tony golden
			  update
			  Merge was not working correctly so added a truncate to force full reload.
*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE assessor_datastore.asr_datastore.tax_authority_fund

MERGE assessor_datastore.asr_datastore.tax_authority_fund AS myTarget
USING trn.v_etl_tax_authority_fund AS mySource
ON myTarget.tax_authority_no = mySource.tax_authority_no
AND myTarget.tax_fund_code = mySource.tax_fund_code
AND myTarget.levy_type_id = mySource.levy_type_id
WHEN MATCHED 
     AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET 
                   myTarget.tax_authority_no = mySource.tax_authority_no
                  ,myTarget.tax_fund_code = mySource.tax_fund_code
                  ,myTarget.levy_type_id = mySource.levy_type_id
                  ,myTarget.levy_type = mySource.levy_type
                  ,myTarget.assessed_mill_levy = mySource.assessed_mill_levy
                  ,myTarget.tax_fund_description = mySource.tax_fund_description		
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
             tax_authority_no
            ,tax_fund_code
            ,levy_type_id
            ,levy_type
            ,assessed_mill_levy
            ,tax_fund_description
			,create_datetime
			,create_user_id
            )
     VALUES (
             mySource.tax_authority_no
            ,mySource.tax_fund_code
            ,mySource.levy_type_id
            ,mySource.levy_type
            ,mySource.assessed_mill_levy
            ,mySource.tax_fund_description
            ,mySource.create_datetime
            ,mySource.create_user_id
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;




