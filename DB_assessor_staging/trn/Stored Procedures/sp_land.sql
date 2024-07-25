



-- =============================================
-- Author:		David Guillen	
-- Create date: 05/12/2017
-- Description:	transformation for land
-- =============================================

CREATE PROCEDURE [trn].[sp_land]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   -- trn into t_pre_land table the land records

		INSERT INTO asr_staging.T_PRE_LAND
			  (state_parcel_no,
			   assessment_year,
			   vacant_flag)
		
		SELECT
		  ACCOUNT.STATE_PARCEL_NO STATE_PARCEL_NO,
		 (SELECT convert(varchar(4),parameter_value) FROM asr_staging.etl_parameter WHERE parameter_name = 'ASSESSMENT_TAX_YEAR') ASSESSMENT_YEAR,
		  trn.CONVERT_TO_FLAG( Q_TBLACCTREAL.VACANTFLAG ) VACANT_FLAG
		FROM
			[assessor_app].[asr_app].[account] ACCOUNT
		 LEFT OUTER JOIN   dqm.Q_TBLACCTREAL  Q_TBLACCTREAL ON ( ( ACCOUNT.ACCOUNT_NO = Q_TBLACCTREAL.ACCOUNTNO ) )
		  WHERE 
		  ( ACCOUNT.STATE_PARCEL_NO IS NOT NULL ) ;
		
		

		-- trn into LAND staging table

		INSERT INTO [assessor_datastore].[asr_datastore].[land]
			  (state_parcel_no,
			   assessment_year,
			   vacant_flag)
		   SELECT state_parcel_no,
				  assessment_year,
				  MIN(vacant_flag)
			 FROM asr_staging.T_PRE_LAND
			GROUP by state_parcel_no, assessment_year;


END




