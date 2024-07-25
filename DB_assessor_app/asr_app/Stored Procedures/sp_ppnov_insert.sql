






CREATE PROCEDURE [asr_app].[sp_ppnov_insert]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     10/20/2016
Developer:    tony golden
Comments:	  Initial creation
              Merge changes into the ppnov table



*************************************************************************************/

SET NOCOUNT ON;

MERGE assessor_app.asr_app.ppnov AS myTarget
USING assessor_datastore.asr_app_query.v_ppnov  AS mySource
ON myTarget.account_no = mySource.accountno
AND myTarget.taxyear = mySource.taxyear
AND myTarget.parcelno = mySource.parcelno

WHEN MATCHED 
	 THEN
        UPDATE SET   
                      myTarget.account_no				=  mySource.ACCOUNTNO
					, myTarget.TAXYEAR					=  mySource.TAXYEAR
					, myTarget.PARCELNO					=  mySource.PARCELNO
					, myTarget.PROPADDRESS				=  mySource.PROPADDRESS
					, myTarget.LEGALDESCRIPTION1		=  mySource.LEGALDESCRIPTION1
					, myTarget.LEGALDESCRIPTION2		=  mySource.LEGALDESCRIPTION2
					, myTarget.LEGALDESCRIPTION3		=  mySource.LEGALDESCRIPTION3
					, myTarget.NAME1					=  mySource.NAME1
					, myTarget.NAME2					=  mySource.NAME2
					, myTarget.PNAME1					=  mySource.PNAME1
					, myTarget.PNAME2					=  mySource.PNAME2
					, myTarget.OWNERADDRESS1			=  mySource.OWNERADDRESS1
					, myTarget.OWNERADDRESS2			=  mySource.OWNERADDRESS2
					, myTarget.OWNERCITY				=  mySource.OWNERCITY
					, myTarget.OWNERSTATE				=  mySource.OWNERSTATE
					, myTarget.OWNERZIP					=  mySource.OWNERZIP
					, myTarget.PROPCLASS1				=  mySource.PROPCLASS1
					, myTarget.PRIORVALUE1				=  mySource.PRIORVALUE1
					, myTarget.CURRENTVALUE1			=  mySource.CURRENTVALUE1
					, myTarget.INCREASEDECREASE1		=  mySource.INCREASEDECREASE1
					, myTarget.PROPCLASS2				=  mySource.PROPCLASS2
					, myTarget.PRIORVALUE2				=  mySource.PRIORVALUE2
					, myTarget.CURRENTVALUE2			=  mySource.CURRENTVALUE2
					, myTarget.INCREASEDECREASE2		=  mySource.INCREASEDECREASE2
					, myTarget.PROPCLASS3				=  mySource.PROPCLASS3
					, myTarget.PRIORVALUE3				=  mySource.PRIORVALUE3
					, myTarget.CURRENTVALUE3			=  mySource.CURRENTVALUE3
					, myTarget.INCREASEDECREASE3		=  mySource.INCREASEDECREASE3
					, myTarget.PROPCLASS4				=  mySource.PROPCLASS4
					, myTarget.PRIORVALUE4				=  mySource.PRIORVALUE4
					, myTarget.CURRENTVALUE4			=  mySource.CURRENTVALUE4
					, myTarget.INCREASEDECREASE4		=  mySource.INCREASEDECREASE4
					, myTarget.PROPCLASS5				=  mySource.PROPCLASS5
					, myTarget.PRIORVALUE5				=  mySource.PRIORVALUE5
					, myTarget.CURRENTVALUE5			=  mySource.CURRENTVALUE5
					, myTarget.INCREASEDECREASE5		=  mySource.INCREASEDECREASE5
					, myTarget.PROPCLASS6				=  mySource.PROPCLASS6
					, myTarget.PRIORVALUE6				=  mySource.PRIORVALUE6
					, myTarget.CURRENTVALUE6			=  mySource.CURRENTVALUE6
					, myTarget.INCREASEDECREASE6		=  mySource.INCREASEDECREASE6
					, myTarget.TOTALPRIOR				=  mySource.TOTALPRIOR
					, myTarget.TOTALCURRENT				=  mySource.TOTALCURRENT
					, myTarget.TOTALINCREASEDECREASE	=  mySource.TOTALINCREASEDECREASE
					, myTarget.VALUEYEAR				=  mySource.VALUEYEAR
					, myTarget.PROPERTYTYPE				=  mySource.PROPERTYTYPE
					, myTarget.PRIMARYBUILDING			=  mySource.PRIMARYBUILDING
					, myTarget.BUILDINGCOUNT			=  mySource.BUILDINGCOUNT
					, myTarget.SUBDIVISION				=  mySource.SUBDIVISION
					, myTarget.NEIGHBORHOOD				=  mySource.NEIGHBORHOOD
					, myTarget.RESIDENTIALSF			=  mySource.RESIDENTIALSF
					, myTarget.STYLE					=  mySource.STYLE
					, myTarget.QUALITY					=  mySource.QUALITY
					, myTarget.YEARBUILT				=  mySource.YEARBUILT
					, myTarget.HEATTYPE					=  mySource.HEATTYPE
					, myTarget.BASEMENTSF				=  mySource.BASEMENTSF
					, myTarget.FINISHEDBSMNTSF			=  mySource.FINISHEDBSMNTSF
					, myTarget.BASEMENTTYPE				=  mySource.BASEMENTTYPE
					, myTarget.GARAGESF					=  mySource.GARAGESF
					, myTarget.IMPSF					=  mySource.IMPSF
					, myTarget.COMMERCIALSF				=  mySource.COMMERCIALSF
					, myTarget.OUTBUILDINGSF			=  mySource.OUTBUILDINGSF
					, myTarget.LANDTYPE					=  mySource.LANDTYPE
					, myTarget.ACREAGE					=  mySource.ACREAGE
					, myTarget.LEA						=  mySource.LEA
					, myTarget.LANDATTRIBUTES			=  mySource.LANDATTRIBUTES
					, myTarget.APPRDATEYEAR				=  mySource.APPRDATEYEAR
					, myTarget.REAPPRYEAR				=  mySource.REAPPRYEAR
					, myTarget.BEGPERYEAR				=  mySource.BEGPERYEAR
					, myTarget.ENDPERYEAR				=  mySource.ENDPERYEAR
					, myTarget.CBOEDEADLINE				=  mySource.CBOEDEADLINE
					, myTarget.PRINTFLAG				=  mySource.PRINTFLAG
					, myTarget.BULKNOVFLAG				=  mySource.BULKNOVFLAG
					, myTarget.PRIVATEFLAG				=  mySource.PRIVATEFLAG
					, myTarget.create_datetime			=  mySource.create_datetime
					, myTarget.create_user_id			=  mySource.create_user_id
					, myTarget.update_datetime			=  GETDATE()
					, myTarget.update_user_id			=  SUSER_NAME()
					, myTarget.ASSESSOR                 = mySource.ASSESSOR
					, myTarget.SREXEMPTIONDEADLINE      = mySource.SREXEMPTIONDEADLINE
					, myTarget.VETEXEMPTIONDEADLINE     = mySource.VETEXEMPTIONDEADLINE	
					, myTarget.NODMONTH                 = mySource.NODMONTH		  
				  

WHEN NOT MATCHED BY TARGET 
     THEN
     INSERT (
              account_no
			 , TAXYEAR
			 , PARCELNO
			 , PROPADDRESS
			 , LEGALDESCRIPTION1
			 , LEGALDESCRIPTION2
			 , LEGALDESCRIPTION3
			 , NAME1
			 , NAME2
			 , PNAME1
			 , PNAME2
			 , OWNERADDRESS1
			 , OWNERADDRESS2
			 , OWNERCITY
			 , OWNERSTATE
			 , OWNERZIP
			 , PROPCLASS1
			 , PRIORVALUE1
			 , CURRENTVALUE1
			 , INCREASEDECREASE1
			 , PROPCLASS2
			 , PRIORVALUE2
			 , CURRENTVALUE2
			 , INCREASEDECREASE2
			 , PROPCLASS3
			 , PRIORVALUE3
			 , CURRENTVALUE3
			 , INCREASEDECREASE3
			 , PROPCLASS4
			 , PRIORVALUE4
			 , CURRENTVALUE4
			 , INCREASEDECREASE4
			 , PROPCLASS5
			 , PRIORVALUE5
			 , CURRENTVALUE5
			 , INCREASEDECREASE5
			 , PROPCLASS6
			 , PRIORVALUE6
			 , CURRENTVALUE6
			 , INCREASEDECREASE6
			 , TOTALPRIOR
			 , TOTALCURRENT
			 , TOTALINCREASEDECREASE
			 , VALUEYEAR
			 , PROPERTYTYPE
			 , PRIMARYBUILDING
			 , BUILDINGCOUNT
			 , SUBDIVISION
			 , NEIGHBORHOOD
			 , RESIDENTIALSF
			 , STYLE
			 , QUALITY
			 , YEARBUILT
			 , HEATTYPE
			 , BASEMENTSF
			 , FINISHEDBSMNTSF
			 , BASEMENTTYPE
			 , GARAGESF
			 , IMPSF
			 , COMMERCIALSF
			 , OUTBUILDINGSF
			 , LANDTYPE
			 , ACREAGE
			 , LEA
			 , LANDATTRIBUTES
			 , APPRDATEYEAR
			 , REAPPRYEAR
			 , BEGPERYEAR
			 , ENDPERYEAR
			 , CBOEDEADLINE
			 , PRINTFLAG
			 , BULKNOVFLAG
			 , PRIVATEFLAG
			 , create_datetime
			 , create_user_id
			 , update_datetime
			 , update_user_id
			 , ASSESSOR
			 , SREXEMPTIONDEADLINE
			 , VETEXEMPTIONDEADLINE
			 , NODMONTH
            )
     VALUES (
	           mySource.ACCOUNTNO
			 , mySource.TAXYEAR
			 , mySource.PARCELNO
			 , mySource.PROPADDRESS
			 , mySource.LEGALDESCRIPTION1
			 , mySource.LEGALDESCRIPTION2
			 , mySource.LEGALDESCRIPTION3
			 , mySource.NAME1
			 , mySource.NAME2
			 , mySource.PNAME1
			 , mySource.PNAME2
			 , mySource.OWNERADDRESS1
			 , mySource.OWNERADDRESS2
			 , mySource.OWNERCITY
			 , mySource.OWNERSTATE
			 , mySource.OWNERZIP
			 , mySource.PROPCLASS1
			 , mySource.PRIORVALUE1
			 , mySource.CURRENTVALUE1
			 , mySource.INCREASEDECREASE1
			 , mySource.PROPCLASS2
			 , mySource.PRIORVALUE2
			 , mySource.CURRENTVALUE2
			 , mySource.INCREASEDECREASE2
			 , mySource.PROPCLASS3
			 , mySource.PRIORVALUE3
			 , mySource.CURRENTVALUE3
			 , mySource.INCREASEDECREASE3
			 , mySource.PROPCLASS4
			 , mySource.PRIORVALUE4
			 , mySource.CURRENTVALUE4
			 , mySource.INCREASEDECREASE4
			 , mySource.PROPCLASS5
			 , mySource.PRIORVALUE5
			 , mySource.CURRENTVALUE5
			 , mySource.INCREASEDECREASE5
			 , mySource.PROPCLASS6
			 , mySource.PRIORVALUE6
			 , mySource.CURRENTVALUE6
			 , mySource.INCREASEDECREASE6
			 , mySource.TOTALPRIOR
			 , mySource.TOTALCURRENT
			 , mySource.TOTALINCREASEDECREASE
			 , mySource.VALUEYEAR
			 , mySource.PROPERTYTYPE
			 , mySource.PRIMARYBUILDING
			 , mySource.BUILDINGCOUNT
			 , mySource.SUBDIVISION
			 , mySource.NEIGHBORHOOD
			 , mySource.RESIDENTIALSF
			 , mySource.STYLE
			 , mySource.QUALITY
			 , mySource.YEARBUILT
			 , mySource.HEATTYPE
			 , mySource.BASEMENTSF
			 , mySource.FINISHEDBSMNTSF
			 , mySource.BASEMENTTYPE
			 , mySource.GARAGESF
			 , mySource.IMPSF
			 , mySource.COMMERCIALSF
			 , mySource.OUTBUILDINGSF
			 , mySource.LANDTYPE
			 , mySource.ACREAGE
			 , mySource.LEA
			 , mySource.LANDATTRIBUTES
			 , mySource.APPRDATEYEAR
			 , mySource.REAPPRYEAR
			 , mySource.BEGPERYEAR
			 , mySource.ENDPERYEAR
			 , mySource.CBOEDEADLINE
			 , mySource.PRINTFLAG
			 , mySource.BULKNOVFLAG
			 , mySource.PRIVATEFLAG
			 , mySource.create_datetime
			 , mySource.create_user_id
			 , mySource.update_datetime
			 , mySource.update_user_id
			 , mySource.ASSESSOR
			 , mySource.SREXEMPTIONDEADLINE
			 , mySource.VETEXEMPTIONDEADLINE
			 ,mySource.NODMONTH
            )

WHEN NOT MATCHED BY SOURCE
     THEN
	 DELETE;








