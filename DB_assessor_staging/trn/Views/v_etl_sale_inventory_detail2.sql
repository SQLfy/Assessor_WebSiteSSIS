

CREATE VIEW [trn].[v_etl_sale_inventory_detail2]
WITH SCHEMABINDING
AS
SELECT        sid.INVENTORYDETAILID AS inventorydetailid, sid.RECEPTIONNO AS recording_no, sid.ACCOUNTNO AS account_no, sid.DETAILTYPE AS detail_type, sid.INVENTORYDETAILTYPE AS inventory_detail_type, 
                         sid.INVENTORYDETAILDESCRIPTION AS inventory_detail_description, sid.INVENTORYUNITCOUNT AS inventory_unit_count, GETDATE() AS create_datetime, SUSER_NAME() AS create_user_id, 
                         HASHBYTES('SHA2_256', ISNULL(RTRIM(sid.RECEPTIONNO), 'DBNULL_TEXT') + ISNULL(RTRIM(sid.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(sid.DETAILTYPE), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(sid.INVENTORYDETAILTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(sid.INVENTORYUNITCOUNT), 'DBNULL_TEXT')) AS rowhash
FROM            dqm.q_tbnsaleinventorydetail2 AS sid INNER JOIN
                         dqm.valid_account AS v ON sid.ACCOUNTNO = v.account_no


