


CREATE VIEW [rw_extract].[V_TMAPTAXDISTRICTAUTHORITY]
AS
SELECT --details for the ASSESSMENT_TAX_YEAR
       TAXDISTRICT
      ,TAXAUTHORITY
      ,T1.TAXYEAR
      ,SORTORDER
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,TIFAUTHORITY
      ,TIFPERCENTAGE
      ,EXCESSVALUE
      ,EXCESSVALUENOTUSED
FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY T1
    ,(SELECT  cast(parameter_value AS numeric(4,0)) taxyear 
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) P1
WHERE T1.TAXYEAR = p1.taxyear
UNION ALL
SELECT --add last known details for tax_districts that are no longer active but are needed for references by 
       --inactive or deleted accounts
          X.TAXDISTRICT
      ,X.TAXAUTHORITY
      ,X.TAXYEAR
      ,X.SORTORDER
      ,X.JURISDICTIONID
      ,CAST(X.LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,X.TIFAUTHORITY
      ,X.TIFPERCENTAGE
      ,X.EXCESSVALUE
      ,X.EXCESSVALUENOTUSED
FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY X
INNER JOIN ( --identify the last known details
                     select O.TAXDISTRICT
                             ,MAX(O.TAXYEAR) AS LAST_KNOWN_TAXYEAR
                     FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY O
                     LEFT OUTER JOIN (SELECT DISTINCT TAXDISTRICT 
                                                  FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY T1
                                                  INNER JOIN (SELECT CAST(parameter_value AS NUMERIC(4,0)) taxyear 
                                                                       FROM   rw_extract.ETL_PARAMETER 
                                                                       WHERE  PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) P1
                                                  ON T1.TAXYEAR = P1.taxyear
                                                ) C
                     ON O.TAXDISTRICT = C.TAXDISTRICT 
                     WHERE C.TAXDISTRICT IS NULL
                     GROUP BY O.TAXDISTRICT ) L
ON X.TAXDISTRICT = L.TAXDISTRICT 
AND X.TAXYEAR = L.LAST_KNOWN_TAXYEAR;







