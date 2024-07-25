




CREATE VIEW [rw_extract].[V_TSGVACCTABSTVALUE_Old_032618]
AS
SELECT        T1.VERSTART, T1.VEREND, ACCOUNTNO, ABSTRACTCODE, T1.TAXYEAR, ACTUALVALUE, RAWASSESSEDVALUE, NEWCONSTVALUECHANGE, 
              NEWCONSTVALUECHANGEASSESSED, JURISDICTIONID, CAST(WRITEDATE AS VARCHAR(22)) AS WRITEDATE, SEQID, 
                       T1.TAXDISTRICT,  MILL.MILLLEVY AS MILLLEVY
FROM            PRRW.ENCOMPASS.TSGVACCTABSTVALUE AS T1 INNER JOIN
                             (SELECT        CAST(PARAMETER_VALUE AS numeric) AS verstart
                               FROM            rw_extract.etl_parameter
                               WHERE        (PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE')) AS p1 ON T1.VERSTART <= p1.verstart INNER JOIN
                             (SELECT        CAST(PARAMETER_VALUE AS numeric) AS verend
                               FROM            rw_extract.etl_parameter
                               WHERE        (PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE')) AS p2 ON T1.VEREND > p2.verend
INNER JOIN
                (SELECT        DA.TAXDISTRICT, AF.TAXYEAR, SUM(AF.ASSESSEDMILLLEVY) AS MILLLEVY
                 FROM          PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY AS DA INNER JOIN
                               PRRW.ENCOMPASS.TMAPTAXAUTHORITYDETAILFUND AS AF ON DA.TAXAUTHORITY = AF.TAXAUTHORITY 
                                                   AND DA.TAXYEAR = AF.TAXYEAR
                 WHERE DA.TAXDISTRICT <> '9999'
                 GROUP BY DA.TAXDISTRICT, AF.TAXYEAR) AS MILL ON T1.TAXDISTRICT = MILL.TAXDISTRICT 
                            AND T1.TAXYEAR = MILL.TAXYEAR









