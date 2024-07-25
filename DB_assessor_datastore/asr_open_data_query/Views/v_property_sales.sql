
CREATE VIEW [asr_open_data_query].[v_property_sales]
AS
SELECT     SalesKey, ACCOUNT_NO, SALE_DATE, SALE_PRICE, DEED_TYPE, GRANTOR, GRANTEE, BOOK, PAGE, RECORDING_NO, Location
FROM        (SELECT     SalesKey, ACCOUNT_NO, SALE_DATE, SALE_PRICE, DEED_TYPE, GRANTOR, GRANTEE, BOOK, PAGE, RECORDING_NO, Location, ROW_NUMBER() OVER (PARTITION BY SalesKey
                   ORDER BY SALE_DATE DESC) AS DedupKey
FROM        (SELECT DISTINCT 
                                     ac.account_no AS ACCOUNT_NO, sl.sale_date, CAST(ROUND(sl.sale_price,0) AS INT) AS sale_price, sl.deed_code_description AS DEED_TYPE, sl.grantor, sl.grantee, sl.book, sl.page, sl.recording_no, isnull(cast(ac.account_no AS varchar(max)), '') 
                                     + isnull(cast(sl.recording_no AS varchar(max)), '') AS SalesKey
                   FROM        [assessor_datastore].[asr_datastore].[sale_account] sa INNER JOIN
                                   [assessor_datastore].[asr_datastore].[sale] sl ON sa.recording_no = sl.recording_no INNER JOIN
                                   [assessor_datastore].[asr_datastore].[account] ac ON sa.account_no = ac.account_no
                   WHERE     account_status = 'A' AND LEFT(ac.account_no, 1) IN ('M', 'R') AND sl.non_sale_flag = 0) a LEFT OUTER JOIN
                      (SELECT     *
                       FROM        (SELECT     Account_Number, location, row_number() OVER (partition BY Account_Number
                                          ORDER BY location) AS orderval
                       FROM        location.location_data) ld
WHERE     orderval = 1) b ON a.ACCOUNT_NO = b.Account_Number) x
WHERE     x.DedupKey = 1
