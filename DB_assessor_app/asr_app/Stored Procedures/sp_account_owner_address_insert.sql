







CREATE PROCEDURE [asr_app].[sp_account_owner_address_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Richard Edwards
Comments:	  Initial creation 
              Merge changes into the account_owner_address table

Mod #:  2
Mod Date:     6/22/2016
Developer:    Richard Edwards
Comments:	  Add columns Owner_Name_1 and Owner_Name_2 to Merge 
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_app.account_owner_address AS myTarget
USING assessor_datastore.asr_app_query.v_account_owner_address AS mySource
ON myTarget.account_no = mySource.account_no
AND myTarget.person_code = mySource.person_code
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.person_code = mySource.person_code
				  ,myTarget.primary_owner_flag = mySource.primary_owner_flag
				  ,myTarget.owner_name = mySource.owner_name
				  ,myTarget.owner_name_1 = mySource.owner_name_1
				  ,myTarget.owner_name_2 = mySource.owner_name_2
				  ,myTarget.ownership_percent = mySource.ownership_percent
				  ,myTarget.federal_id_no = mySource.federal_id_no
				  ,myTarget.address_line_1 = mySource.address_line_1
				  ,myTarget.address_line_2 = mySource.address_line_2
				  ,myTarget.city_name = mySource.city_name
				  ,myTarget.state = mySource.state
				  ,myTarget.zip_code = mySource.zip_code
				  ,myTarget.country = mySource.country
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash
				  ,myTarget.private_flag = mySource.private_flag


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (account_no
	        ,person_code
			,primary_owner_flag
			,owner_name
			,owner_name_1
			,owner_name_2
			,ownership_percent
			,federal_id_no
			,address_line_1
			,address_line_2
			,city_name
			,state
			,zip_code
			,country
			,create_datetime
			,create_user_id
			,rowhash
			,private_flag
            
			)
     VALUES (mySource.account_no 
            ,mySource.person_code
			,mySource.primary_owner_flag
			,mySource.owner_name
			,mySource.owner_name_1
			,mySource.owner_name_2
			,mySource.ownership_percent
			,mySource.federal_id_no
			,mySource.address_line_1
			,mySource.address_line_2
			,mySource.city_name
			,mySource.state
			,mySource.zip_code
			,mySource.country
            ,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
			,mySource.private_flag
            )


WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;





