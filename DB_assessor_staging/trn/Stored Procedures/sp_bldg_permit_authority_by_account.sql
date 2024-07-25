



CREATE PROCEDURE [trn].[sp_bldg_permit_authority_by_account]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     8/30/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the bldg_permit_authority_by_account
*************************************************************************************/
SET NOCOUNT ON;

MERGE assessor_datastore.asr_datastore.bldg_permit_authority_by_account AS myTarget
USING trn.v_etl_bldg_permit_authority_by_account AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 THEN
        UPDATE SET  myTarget.account_no			= myTarget.account_no
				  , myTarget.tax_district_no	= myTarget.tax_district_no
				  , myTarget.tax_authority		= myTarget.tax_authority	
				  , myTarget.authority_name		= myTarget.authority_name
				  , myTarget.phone				= myTarget.phone	
				  , myTarget.street				= myTarget.street	
				  , myTarget.city				= myTarget.city
				  , myTarget.zip				= myTarget.zip	
				  , myTarget.email				= myTarget.email
				  , myTarget.URL				= myTarget.URL



WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (       account_no
				  , tax_district_no
				  , tax_authority
				  , authority_name
				  , phone
				  , street
				  , city
				  , zip
				  , email
				  , URL
            )
     VALUES (mySource.account_no
	       , mySource.tax_district_no
		   , mySource.tax_authority
		   , mySource.authority_name
		   , mySource.phone
		   , mySource.street
		   , mySource.city
		   , mySource.zip
		   , mySource.email
		   , mySource.URL
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





