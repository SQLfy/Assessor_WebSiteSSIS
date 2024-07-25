


CREATE PROCEDURE [asr_spatialest].[sp_sale_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     4/26/2016
Developer:    Tony Golden
Comments:	  Initial creation
              Merge changes into the sale table in spatialist

	
	[recording_no] [varchar](20) NOT NULL,
	[grantor] [varchar](100) NULL,
	[grantee] [varchar](100) NULL,
	[sale_date] [datetime2](7) NOT NULL,
	[deed_code_description] [varchar](100) NULL,
	[sale_price] [numeric](15, 2) NOT NULL,
	[valid1_flag] [bit] NOT NULL,
	[improved_flag] [bit] NOT NULL,
	[create_datetime] [datetime2](7) NOT NULL,
	[create_user_id] [varchar](60) NOT NULL,
	[update_datetime] [datetime2](7) NULL,
	[update_user_id] [varchar](60) NULL,
	[rowhash] [varbinary](8000)

*************************************************************************************/
SET NOCOUNT ON;

MERGE asr_spatialest.sale AS myTarget
USING assessor_datastore.asr_spatialest_query.v_sale AS mySource
ON myTarget.recording_no = mySource.recording_no
WHEN MATCHED 
	 AND myTarget.rowhash <> mySource.rowhash
	
	 THEN
        UPDATE SET myTarget.grantor = mySource.grantor
				  ,myTarget.grantee = mySource.grantee
				  ,myTarget.sale_date = mySource.sale_date
				  ,myTarget.deed_code_description = mySource.deed_code_description
				  ,myTarget.sale_price = mySource.sale_price
				  ,myTarget.valid1_flag = mySource.valid1_flag
				  ,myTarget.improved_flag = mySource.improved_flag
			      ,myTarget.update_datetime = GETDATE()
			      ,myTarget.update_user_id = SUSER_NAME()
				  ,myTarget.rowhash = mySource.rowhash

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
			 recording_no
			,grantor
			,grantee
			,sale_date
			,deed_code_description
			,sale_price
			,valid1_flag
			,improved_flag
			,create_datetime
			,create_user_id
			,rowhash
            )
     VALUES (mySource.recording_no
			,mySource.grantor
			,mySource.grantee
			,mySource.sale_date
			,mySource.deed_code_description
			,mySource.sale_price
			,mySource.valid1_flag
			,mySource.improved_flag
			,mySource.create_datetime
			,mySource.create_user_id
			,mySource.rowhash
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;







