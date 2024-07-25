








CREATE PROCEDURE [asr_spatialest].[sp_account_property_address_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     2/1/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the account_property_address table


	[account_no] [varchar](30) NOT NULL,
	[address_number] [varchar](15) NULL,
	[pre_direction_code] [varchar](50) NULL,
	[street_name] [varchar](80) NULL,
	[street_type_code] [varchar](30) NULL,
	[unit_no] [varchar](30) NULL,
	[city_name] [varchar](50) NULL,
	[location_zip_code] [varchar](10) NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000) NULL
*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_spatialest.account_property_address AS myTarget
USING assessor_datastore.asr_spatialest_query.v_account_property_address AS mySource
ON myTarget.account_no = mySource.account_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	 THEN
        UPDATE SET myTarget.unit_no = mySource.unit_no --
				  ,myTarget.address_number = mySource.address_number --
				  ,myTarget.pre_direction_code = mySource.pre_direction_code --
				  ,myTarget.street_name = mySource.street_name --
				  ,myTarget.street_type_code = mySource.street_type_code --
				  ,myTarget.city_name = mySource.city_name --
				  ,myTarget.location_zip_code = mySource.location_zip_code  --
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash


WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
              account_no
			, address_number
			, pre_direction_code
			, street_name
			, street_type_code
			, unit_no
			, city_name
			, location_zip_code
			, create_datetime
			, create_user_id
			, rowhash
			)
     VALUES (mySource.account_no 
	        ,mySource.address_number
			,mySource.pre_direction_code
			,mySource.street_name
			,mySource.street_type_code
			,mySource.unit_no
			,mySource.city_name
			,mySource.location_zip_code
			,mySource.create_datetime
            ,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;










