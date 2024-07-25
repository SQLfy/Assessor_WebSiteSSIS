


CREATE VIEW [asr_app_query].[v_sale_inventory_detail]
WITH SCHEMABINDING
AS
SELECT        sid.inventorydetailid, sid.recording_no, sid.account_no, sid.detail_type, sid.inventory_detail_type, sid.inventory_detail_description, sid.inventory_unit_count, sid.create_datetime, sid.create_user_id, 
                         sid.update_datetime, sid.update_user_id, sid.rowhash
FROM            asr_datastore.sale_inventory_detail AS sid INNER JOIN
                         asr_datastore.account AS a ON sid.account_no = a.account_no AND a.account_status = 'A'

