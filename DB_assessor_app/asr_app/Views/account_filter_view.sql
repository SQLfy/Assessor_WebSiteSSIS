
create view asr_app.account_filter_view  
as (select distinct account.account_no,  account.state_parcel_no, account.account_type, account_fact.owner_name, account_fact.address_number, account_fact.address_number_suffix,  
account_fact.unit_no, account_fact.unit_designator, account_fact.post_direction_code, account_fact.pre_direction_code, account_fact.street_type_code, account_fact.street_name,  
account_fact.city_name,  account_fact.location_zip_code,  account_fact.total_net_acres,  account_fact.total_actual_value,  improvement_built_as.built_as_code,  
improvement_occupancy.abstract_code as improvement_occupancy_abstract_code, improvement_occupancy.occupancy_code,  improvement.condition_type, improvement.improvement_quality, improvement.property_type, 
land_abstract.abstract_code as land_abstract_abstract_code, land_attribute.attribute_type, land_attribute.attribute_subtype, sub_filing.filing_no, sub_filing.sub_filing_recording_no, sub_filing.subdivision_no, 
tax_district.tax_district_no, tax_district_authority.tax_authority_no, sale_inventory.adjusted_sale_price, sale_inventory.residential_square_footage, 
sale_inventory.land_net_acre_count 
from asr_app.account account 
left join asr_app.account_fact account_fact on account_fact.account_no = account.account_no 
left join asr_app.improvement_fact improvement_fact on improvement_fact.account_no = account.account_no  
left join asr_app.improvement_built_as improvement_built_as on improvement_built_as.account_no = account.account_no 
left join asr_app.improvement_occupancy improvement_occupancy on improvement_occupancy.account_no = account.account_no 
left join asr_app.improvement improvement on improvement.account_no = account.account_no 
left join asr_app.land_abstract land_abstract on land_abstract.account_no = account.account_no 
left join asr_app.land_attribute land_attribute on land_attribute.account_no = account.account_no 
left join asr_app.sub_filing sub_filing on sub_filing.sub_filing_recording_no = account.sub_filing_recording_no 
left join asr_app.tax_district tax_district on tax_district.tax_district_no = account.tax_district_no 
left join asr_app.tax_district_authority tax_district_authority on tax_district_authority.tax_district_no = account.tax_district_no 
left join asr_app.sale_inventory sale_inventory on sale_inventory.account_no = account.account_no 
where account.account_type != 'state assessed' and account.state_parcel_no is not null); 
 
