
CREATE PROCEDURE [asr_posse].[sp_account_fact_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     7/5/2016
Developer:    TONY GOLDEN
Comments:	  Initial creation
              Merge changes into the account_fact table  for POSSE

*************************************************************************************/
SET NOCOUNT ON;

TRUNCATE TABLE asr_posse.account_fact 

MERGE asr_posse.account_fact AS myTarget
USING assessor_datastore.asr_posse_query.v_account_fact AS mySource
ON  myTarget.account_no = mySource.account_no
AND myTarget.state_parcel_no = mySource.state_parcel_no

WHEN MATCHED 	 
	 THEN
        UPDATE SET   myTarget.ACCOUNT_NO				= mySource.ACCOUNT_NO
				   , myTarget.STATE_PARCEL_NO			= mySource.STATE_PARCEL_NO
				   , myTarget.ACCOUNT_SUBTYPE_CODE		= mySource.ACCOUNT_SUBTYPE_CODE
				   , myTarget.TAX_DISTRICT_NO			= mySource.TAX_DISTRICT_NO
				   , myTarget.LAND_ECONOMIC_AREA_CODE	= mySource.LAND_ECONOMIC_AREA_CODE
				   , myTarget.ACCOUNT_TYPE_CODE			= mySource.ACCOUNT_TYPE
				   , myTarget.SUB_FILING_RECORDING_NO	= mySource.SUB_FILING_RECORDING_NO
				   , myTarget.OWNER_NAME				= mySource.OWNER_NAME
				   , myTarget.MAILING_ADDRESS_LINE_1	= mySource.ADDRESS_LINE_1
				   , myTarget.MAILING_ADDRESS_LINE_2	= mySource.ADDRESS_LINE_2
				   , myTarget.MAILING_ADDRESS_LINE_3	= mySource.ADDRESS_LINE_3
				   , myTarget.MAILING_CITY_NAME			= mySource.CITY_NAME
				   , myTarget.MAILING_STATE				= mySource.STATE
				   , myTarget.MAILING_ZIP_CODE			= mySource.ZIP_CODE
				   , myTarget.MAILING_COUNTRY			= mySource.COUNTRY
				   , myTarget.UNIT_NO					= mySource.UNIT_NO
				   , myTarget.UNIT_DESIGNATOR			= mySource.UNIT_DESIGNATOR
				   , myTarget.ADDRESS_NUMBER			= mySource.ADDRESS_NUMBER
				   , myTarget.ADDRESS_NUMBER_SUFFIX		= mySource.ADDRESS_NUMBER_SUFFIX
				   , myTarget.PRE_DIRECTION_CODE		= mySource.PRE_DIRECTION_CODE
				   , myTarget.STREET_NAME				= mySource.STREET_NAME
				   , myTarget.STREET_TYPE_CODE			= mySource.STREET_TYPE_CODE
				   , myTarget.POST_DIRECTION_CODE		= mySource.POST_DIRECTION_CODE
				   , myTarget.CITY_NAME					= mySource.CITY_NAME
				   , myTarget.LOCATION_STATE_CODE		= 'CO'
				   , myTarget.LOCATION_ZIP_CODE			= mySource.LOCATION_ZIP_CODE
				   , myTarget.TOTAL_ACTUAL_VALUE		= mySource.TOTAL_ACTUAL_VALUE
				   , myTarget.TOTAL_ASSESSED_VALUE		= mySource.TOTAL_ASSESSED_VALUE
				   , myTarget.TOTAL_NET_ACRES			= mySource.TOTAL_NET_ACRES
				   , myTarget.ACCOUNT_STATUS_CODE		= mySource.ACCOUNT_STATUS
				   , myTarget.FEDERAL_ID_NO				= mySource.FEDERAL_ID_NO
				   , myTarget.ROW_START_DTM				= NULL
				   , myTarget.ROW_END_DTM				= NULL
				   , myTarget.ROW_CURRENT_FLAG			= NULL
				   , myTarget.UPDATE_DTM			    = GETDATE()
				   , myTarget.UPDATE_USER_ID            = 'SSIS_ETL'
				   , myTarget.LEGAL_DESCR				= mySource.LEGAL_DESCR
				   , myTarget.REDUCED_MILL_LEVY			= mySource.REDUCED_MILL_LEVY
				   , myTarget.REDUCED_TAX_RATE			= mySource.REDUCED_TAX_RATE



WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT ( ACCOUNT_NO
			, STATE_PARCEL_NO
			, ACCOUNT_SUBTYPE_CODE
			, TAX_DISTRICT_NO
			, LAND_ECONOMIC_AREA_CODE
			, ACCOUNT_TYPE_CODE
			, SUB_FILING_RECORDING_NO
			, OWNER_NAME
			, MAILING_ADDRESS_LINE_1
			, MAILING_ADDRESS_LINE_2
			, MAILING_ADDRESS_LINE_3
			, MAILING_CITY_NAME
			, MAILING_STATE
			, MAILING_ZIP_CODE
			, MAILING_COUNTRY
			, UNIT_NO
			, UNIT_DESIGNATOR
			, ADDRESS_NUMBER
			, ADDRESS_NUMBER_SUFFIX
			, PRE_DIRECTION_CODE
			, STREET_NAME
			, STREET_TYPE_CODE
			, POST_DIRECTION_CODE
			, CITY_NAME
			, LOCATION_STATE_CODE
			, LOCATION_ZIP_CODE
			, TOTAL_ACTUAL_VALUE
			, TOTAL_ASSESSED_VALUE
			, TOTAL_NET_ACRES
			, ACCOUNT_STATUS_CODE
			, FEDERAL_ID_NO
			, ROW_START_DTM
			, ROW_END_DTM
			, ROW_CURRENT_FLAG
			, CREATE_DTM
			, CREATE_USER_ID
			, UPDATE_DTM
			, UPDATE_USER_ID
			, LEGAL_DESCR
			, REDUCED_MILL_LEVY
			, REDUCED_TAX_RATE
            )
     VALUES (mySource.ACCOUNT_NO
			, mySource.STATE_PARCEL_NO
			, mySource.ACCOUNT_SUBTYPE_CODE
			/*
			, CASE
				WHEN mySource.ACCOUNT_TYPE	= 'State Assessed'		then 'State'	
				WHEN mySource.ACCOUNT_TYPE	= 'Agricultural'		then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Commercial'			then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Exempt'			    then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'HOA'					then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Industrial'			then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Mobile Home'			then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Possessory Int'		then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Producing Mine'		then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Residential'			then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Severed Int'			then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Utilities'			then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Vacant Land'			then 'Real'	
				WHEN mySource.ACCOUNT_TYPE	= 'Exempt'				then 'Personal'
				WHEN mySource.ACCOUNT_TYPE	= 'Leasing'				then 'Personal'
				WHEN mySource.ACCOUNT_TYPE	= 'Personal'			then 'Personal'
			END
			*/
			, mySource.TAX_DISTRICT_NO
			, mySource.LAND_ECONOMIC_AREA_CODE
			, mySource.ACCOUNT_TYPE
			, mySource.SUB_FILING_RECORDING_NO
			, mySource.OWNER_NAME
			, mySource.ADDRESS_LINE_1
			, mySource.ADDRESS_LINE_2
			, mySource.ADDRESS_LINE_3
			, mySource.CITY_NAME_1
			, substring(mySource.STATE,1,50)
			, mySource.ZIP_CODE
			, mySource.COUNTRY
			, mySource.UNIT_NO
			, mySource.UNIT_DESIGNATOR
			, substring(mySource.ADDRESS_NUMBER,1,10)
			, mySource.ADDRESS_NUMBER_SUFFIX
			, mySource.PRE_DIRECTION_CODE
			, mySource.STREET_NAME
			, mySource.STREET_TYPE_CODE
			, mySource.POST_DIRECTION_CODE
			, mySource.CITY_NAME
			, 'CO' --mySource.LOCATION_STATE_CODE
			, mySource.LOCATION_ZIP_CODE
			, mySource.TOTAL_ACTUAL_VALUE
			, mySource.TOTAL_ASSESSED_VALUE
			, mySource.TOTAL_NET_ACRES
			, mySource.ACCOUNT_STATUS
			, mySource.FEDERAL_ID_NO
			, NULL --mySource.ROW_START_DTM
			, NULL --mySource.ROW_END_DTM
			, NULL --mySource.ROW_CURRENT_FLAG
			,getdate()
			,'SSIS_ETL'
			,getdate()
			,'SSIS_ETL'	
			,  mySource.LEGAL_DESCR
			,  NULL --mySource.REDUCED_MILL_LEVY
			,  NULL --mySource.REDUCED_TAX_RATE		      
            
			)
			

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;

