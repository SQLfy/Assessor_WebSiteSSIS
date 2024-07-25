﻿







CREATE PROCEDURE [asr_spatialest].[sp_account_neighboorhood_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     6/17/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the account_neighboorhood table for spatialest
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_spatialest.account_neighborhood AS myTarget
USING assessor_datastore.asr_spatialest_query.v_account_neighborhood AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.neighborhood_code = mySource.neighborhood_code
AND myTarget.property_type = mySource.property_type
AND myTarget.neighborhood_extension = mySource.neighborhood_extension

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,neighborhood_code
	        ,property_type
	        ,neighborhood_extension
			,create_datetime
			,create_user_id
            )
     VALUES (mySource.account_no 
            ,mySource.neighborhood_code
	        ,mySource.property_type
	        ,mySource.neighborhood_extension	 
			,mySource.create_datetime
			,mySource.create_user_id			      
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;



