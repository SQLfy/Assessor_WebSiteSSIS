
CREATE VIEW [asr_staging_query].[v_tsgvacctabstvalue_npp_frz]
AS
SELECT        INGRP2.ABSTCODE, W_PUBLISHED_ACCOUNT.ACCOUNT_NO, INGRP2.NEWGROWTHACTVAL, INGRP2.NEWGROWTHASSESSVAL, INGRP2.NET_ACRES, INGRP2.NEW_GROWTH_FLAG
FROM            (SELECT        INGRP1.ACCOUNTNO, INGRP1.ABSTCODE, INGRP1.NEWGROWTHACTVAL, INGRP1.NEWGROWTHASSESSVAL, INGRP1.NET_ACRES, INGRP1.NEW_GROWTH_FLAG
                          FROM            (SELECT        ACCOUNTNO, ABSTRACTCODE AS ABSTCODE, NEWGROWTHACTUAL AS NEWGROWTHACTVAL, NEWGROWTHASSESSVAL, NETACRES AS NET_ACRES, 
                                                                              'N' AS NEW_GROWTH_FLAG
                                                    FROM            (SELECT        ACCOUNTNO$1 AS ACCOUNTNO, ABSTRACTCODE$1 AS ABSTRACTCODE, SUM(ACTUALVALUE_1) AS NEWGROWTHACTUAL, SUM(RAWASSESSEDVALUE_1) 
                                                                                                        AS NEWGROWTHASSESSVAL, SUM(LANDACRES) AS NETACRES
                                                                              FROM            (SELECT        S_TSGVACCTABSTVALUE_NPP_FRZ.ACCOUNTNO AS ACCOUNTNO$1, S_TSGVACCTABSTVALUE_NPP_FRZ.ABSTRACTCODE AS ABSTRACTCODE$1, 
                                                                                                                                  S_TSGVACCTABSTVALUE_NPP_FRZ.ACTUALVALUE AS ACTUALVALUE_1, S_TSGVACCTABSTVALUE_NPP_FRZ.RAWASSESSEDVALUE AS RAWASSESSEDVALUE_1, 
                                                                                                                                  LANDABST.LANDACRES
                                                                                                        FROM            asr_staging.s_tsgvacctabstvalue_npp_frz AS S_TSGVACCTABSTVALUE_NPP_FRZ LEFT OUTER JOIN
                                                                                                                                      (SELECT        ACCOUNTNO$2 AS ACCOUNTNO, ISNULL(LANDACRES$1, 0) AS LANDACRES, ABSTRACTCODE$2 AS ABSTRACTCODE
                                                                                                                                        FROM            (SELECT        ACCOUNTNO AS ACCOUNTNO$2, ABSTRACTCODE AS ABSTRACTCODE$2, SUM(LANDACRES) AS LANDACRES$1
                                                                                                                                                                  FROM            asr_staging.s_tbllandabstract AS S_TBLLANDABSTRACT
                                                                                                                                                                  GROUP BY ACCOUNTNO, ABSTRACTCODE, ACCOUNTNO) AS AGGREGATOR_0) AS LANDABST ON 
                                                                                                                                  S_TSGVACCTABSTVALUE_NPP_FRZ.ACCOUNTNO = LANDABST.ACCOUNTNO AND 
                                                                                                                                  S_TSGVACCTABSTVALUE_NPP_FRZ.ABSTRACTCODE = LANDABST.ABSTRACTCODE) AS AGG_INPUT
                                                                              GROUP BY ACCOUNTNO$1, ABSTRACTCODE$1) AS AGGREGATOR) AS INGRP1 INNER JOIN
                                                    dbo.valuation_class_code AS VALUATION_CLASS_CODE ON INGRP1.ABSTCODE = VALUATION_CLASS_CODE.valuation_class_code) AS INGRP2 INNER JOIN
                         dbo.w_published_account AS W_PUBLISHED_ACCOUNT ON INGRP2.ACCOUNTNO = W_PUBLISHED_ACCOUNT.ACCOUNT_NO

