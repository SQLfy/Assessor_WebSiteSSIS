

create view [asr_opendata].[v_valuation_class_code]
as

SELECT ct.ABSTRACTCODE as ct_abstractcode,
       ct.ABSTRACTTYPE as ct_abstracttype,
	   c.ABSTRACTCODE as c_abstractcode,
       substring(c.ABSTRACTDESCRIPTION,1,256) as c_abstractdescription,
         c.ACTIVEFLAG as c_activeflag,
         c.CLASSIFICATIONID as c_classificationid,
         c.ABSTRACTCATEGORYCODE as c_abstractcategorycode,		
		 cv.ABSTRACTCODE as cvh_abstractcode,
          cv.ASSESSMENTRATIO as cvh_assessmentratio
   FROM 
       [asr_staging].[s_tlkpabstractcode] c
	   INNER JOIN [asr_staging].[s_tlkpabstractcodevalue] cv
	    on c.ABSTRACTCODE  =  cv.ABSTRACTCODE
		 LEFT OUTER JOIN [asr_staging].[s_tlkpabstractcodetype] ct
		 on c.ABSTRACTCODE  =  ct.ABSTRACTCODE

