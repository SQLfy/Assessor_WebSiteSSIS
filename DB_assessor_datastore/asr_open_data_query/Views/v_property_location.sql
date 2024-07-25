

CREATE VIEW [asr_open_data_query].[v_property_location]
AS

SELECT     LocationKey, ACCOUNT_NO, ACCOUNT_TYPE_CODE, STATE_PARCEL_NO, ADDRESS_NUMBER, PRE_DIRECTION_CODE, STREET_NAME, STREET_TYPE_CODE, UNIT_NO, LOCATION_ZIP_CODE, CITY_NAME, LEGAL_DESCR, SECTION, TOWNSHIP, RANGE, 
                  QUARTER, LAND_ECONOMIC_AREA_CODE, VACANT_FLAG, TOTAL_NET_ACRES, TAX_DISTRICT_NO, NEIGHBORHOOD_CODE_EXT, Location
FROM        (SELECT     LocationKey, ACCOUNT_NO, ACCOUNT_TYPE_CODE, STATE_PARCEL_NO, ADDRESS_NUMBER, PRE_DIRECTION_CODE, STREET_NAME, STREET_TYPE_CODE, UNIT_NO, LOCATION_ZIP_CODE, CITY_NAME, LEGAL_DESCR, SECTION, TOWNSHIP, 
                                     RANGE, QUARTER, LAND_ECONOMIC_AREA_CODE, VACANT_FLAG, TOTAL_NET_ACRES, TAX_DISTRICT_NO, NEIGHBORHOOD_CODE_EXT,  Location, ROW_NUMBER() OVER (PARTITION BY LocationKey
                   ORDER BY CITY_NAME DESC) AS DedupKey
FROM        (SELECT     ac.account_no AS ACCOUNT_NO, ac.account_type AS ACCOUNT_TYPE_CODE, ac.state_parcel_no AS STATE_PARCEL_NO, pa.address_number, pa.pre_direction_code, pa.street_name, pa.street_type_code, pa.unit_no, pa.location_zip_code, 
                                     pa.city_name, ac.legal_description AS LEGAL_DESCR, ac.section, ac.township, ac.range, ac.qtr AS QUARTER, ra.default_lea AS LAND_ECONOMIC_AREA_CODE, CASE WHEN ra.vacant_flag = 0 THEN 'N' ELSE 'Y' END AS VACANT_FLAG, 
                                     ISNULL(la.total_net_acres, 0) AS total_net_acres, ac.tax_district_no, an.neighborhood_code_ext, isnull(cast(ac.account_no AS varchar(max)), '') + isnull(cast(pa.address_number AS varchar(max)), '') 
                                     + isnull(cast(pa.pre_direction_code AS varchar(max)), '') + isnull(cast(pa.street_name AS varchar(max)), '') + isnull(cast(pa.street_type_code AS varchar(max)), '') + isnull(cast(pa.unit_no AS varchar(max)), '') 
                                     + isnull(cast(pa.location_zip_code AS varchar(max)), '') AS LocationKey
                   FROM        [assessor_datastore].[asr_datastore].[account] ac LEFT JOIN
                                     [assessor_datastore].[asr_datastore].[account_property_address] pa ON ac.account_no = pa.account_no LEFT JOIN
                                     [assessor_datastore].[asr_datastore].[real_account] ra ON ac.account_no = ra.account_no LEFT JOIN
                                         (SELECT     account_no, SUM(land_acres) AS total_net_acres
                                          FROM        [assessor_datastore].[asr_datastore].[land_abstract]
                                          GROUP BY account_no) la ON ac.account_no = la.account_no LEFT JOIN
                                         (SELECT p1.account_no,
                                          stuff( (SELECT ', '+ neighborhood_code + '-' + neighborhood_extension 
                                          FROM [assessor_datastore].[asr_datastore].[account_neighborhood] p2
                                          WHERE p2.account_no = p1.account_no
                                          ORDER BY neighborhood_code
                                          FOR XML PATH(''), TYPE).value('.', 'varchar(max)')
                                          ,1,1,'')       AS Neighborhood_Code_Ext
                                          FROM [assessor_datastore].[asr_datastore].[account_neighborhood] p1
                                          GROUP BY account_no) an ON ac.account_no = an.account_no 
                   WHERE     account_status = 'A' AND LEFT(ac.account_no, 1) IN ('M', 'R')) a LEFT OUTER JOIN
                      (SELECT     *
                       FROM        (SELECT     Account_Number, location, row_number() OVER (partition BY Account_Number
                                          ORDER BY location) AS orderval
                       FROM        location.location_data) ld
WHERE     orderval = 1) b ON a.account_no = b.Account_Number) x
WHERE     x.DedupKey = 1
