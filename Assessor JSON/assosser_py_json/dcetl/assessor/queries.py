"""Defines queries used in the ETL process"""

id_range_query = """
select
    min(id),
    max(id),
    count(id)
from
    asr_adv_search_query.account_number
"""

export_queries = [
    {
        'name': 'PropertyOwnershipAndLocationReport',
        'query': """
SELECT
    state_parcel_no,
    account_no,
    primary_owner_name,
    owner_street_address,
    owner_city_name,
    owner_state,
    owner_zip_code,
    situs_street_address,
    primary_property_city,
    primary_property_zip_code,
    legal_description,
    default_lea,
    account_type,
    actual_value,
    raw_assessed_value    
FROM
    asr_adv_search_query.v_owner_export
ORDER BY
    account_no
        """,
        'headers': ['State Parcel #',
                    'Account #',
                    'Owner Name',
                    'Owner Street Address',
                    'Owner City',
                    'Owner State',
                    'Owner Zip Code',
                    'Situs Street Address',
                    'Situs City',
                    'Situs Zip Code',
                    'Legal Description',
                    'LEA',
                    'Account Type',
                    'Actual Value',
                    'Assessed Value']
    },
    {
        'name': 'ParcelValueReport',
        'query': """
SELECT
    state_parcel_no,
    account_no,
    primary_owner_name,
    owner_street_address,
    owner_city_name,
    owner_state,
    owner_zip_code,
    situs_street_address,
    primary_property_city,
    primary_property_zip_code,
    valuation_class_code,
    code_descr,
    actual_value_sum,
    assessed_value_sum,
    valuation_type_code,
    net_acres_sum
FROM 
    asr_adv_search_query.v_parcel_values_export
ORDER BY
    account_no
        """,
        'headers': ['State Parcel #',
                    'Account #',
                    'Owner Name',
                    'Owner Street Address',
                    'Owner City',
                    'Owner State',
                    'Owner Zip Code',
                    'Situs Street Address',
                    'Situs City',
                    'Situs Zip Code',
                    'Valuation Class Code',
                    'Valuation Class Description',
                    'Actual Value',
                    'Assessed Value',
                    'Valuation Type',
                    'Net Acres']
    },
    {
        'name': 'PropertyImprovementOccupancyReport',
        'query': """
SELECT
    state_parcel_no,
    account_no,
    primary_owner_name,
    owner_street_address,
    owner_city_name,
    owner_state,
    owner_zip_code,
    situs_street_address,
    primary_property_city,
    primary_property_zip_code,
    property_type,
    use_code,
    use_percentage,
    use_code_description,
    condition_type,
    build_quality,
    completed_percent
FROM 
    asr_adv_search_query.v_imp_occ_export
ORDER BY
    account_no
        """,
        'headers': ['State Parcel #',
                    'Account #',
                    'Owner Name',
                    'Owner Street Address',
                    'Owner City',
                    'Owner State',
                    'Owner Zip Code',
                    'Situs Street Address',
                    'Situs City',
                    'Situs Zip Code',
                    'Property Type',
                    'Occupancy Code',
                    'Occupancy Percentage',
                    'Occ Code Description',
                    'Condition',
                    'Quality',
                    'Completion Percentage']
    },
    {
        'name': 'PropertyImprovementSegmentsReport',
        'query': """
SELECT
    state_parcel_no,
    account_no,
    primary_owner_name,
    owner_street_address,
    owner_city_name,
    owner_state,
    owner_zip_code,
    situs_street_address,
    primary_property_city,
    primary_property_zip_code,
    property_type,
    building_number,
    build_quality,
    completed_percent,
    improvement_sf,
    style_code_description,
    built_year,
    number_of_stories,
    bedroom_count,
    bathroom_count,
    built_as_sf,
    roof_construction_type,
    interior_finish_type,
    exterior_construction_type,
    heat_type,
    roof_material_type,
    floor_material_type
FROM 
    asr_adv_search_query.v_imp_seg_export
ORDER BY
    account_no
        """,
        'headers': ['State Parcel #',
                    'Account #',
                    'Owner Name',
                    'Owner Street Address',
                    'Owner City',
                    'Owner State',
                    'Owner Zip Code',
                    'Situs Street Address',
                    'Situs City',
                    'Situs Zip Code',
                    'Property Type',
                    'Building #',
                    'Quality',
                    'Completion Percentage',
                    'Improvement SF',
                    'Style',
                    'Year Built',
                    'Stories',
                    'Bedroom Count',
                    'Bathroom Count',
                    'Built As SF',
                    'Roof Type',
                    'Interior Type',
                    'Exterior Type',
                    'Heat Type',
                    'Roof Material Type',
                    'Floor Type']
    },
    {
        'name': 'BuildingSummaryReport',
        'query': """
SELECT
    state_parcel_no,
    account_no,
    primary_owner_name,
    owner_street_address,
    owner_city_name,
    owner_state,
    owner_zip_code,
    situs_street_address,
    primary_property_city,
    primary_property_zip_code,
    property_type,
    building_number,
    build_quality,
    completed_percent,
    improvement_sf,
    building_unit_type,
    fireplaces,
    garage_sf,
    basement_sf,
    finished_basement_sf,
    unfinished_basement_sf,
    finished_basement_pct,
    unfinished_basement_pct,
    basement_walkout,
    total_porch_sf
FROM
    asr_adv_search_query.v_building_summary_export
ORDER BY
    account_no
        """,
        'headers': ['State Parcel #',
                    'Account #',
                    'Owner Name',
                    'Owner Street Address',
                    'Owner City',
                    'Owner State',
                    'Owner Zip Code',
                    'Situs Street Address',
                    'Situs City',
                    'Situs Zip Code',
                    'Property Type',
                    'Building #',
                    'Quality',
                    'Completion Percentage',
                    'Improvement SF',
                    'Unit Type',
                    'Fireplace Count',
                    'Garage SF',
                    'Basement SF',
                    'Finished Basement SF',
                    'Unfinished Basement SF',
                    'Finished Basement %',
                    'Unfinished Basement %',
                    'Walkout Basement',
                    'Total Porch SF']
    },
    {
        'name': 'SalesInformationReport',
        'query': """
SELECT
    state_parcel_no,
    account_no,
    primary_owner_name,
    owner_street_address,
    owner_city_name,
    owner_state,
    owner_zip_code,
    situs_street_address,
    primary_property_city,
    primary_property_zip_code,
    account_type,
    deed_code_description,
    recording_no,
    sale_date,
    sale_price,
    grantor,
    grantee,
    book,
    page,
    net_acres_sum,
    improved_flag,
    valid1_flag,
    multi_parcel_flag

FROM
    asr_adv_search_query.v_sales_export
ORDER BY
    account_no, sale_date DESC
        """,
        'headers': ['State Parcel #',
                    'Account #',
                    'Owner Name',
                    'Owner Street Address',
                    'Owner City',
                    'Owner State',
                    'Owner Zip Code',
                    'Situs Street Address',
                    'Situs City',
                    'Situs Zip Code',
                    'Account Type',
                    'Deed Type',
                    'Reception #',
                    'Sale Date',
                    'Sale Price',
                    'Grantor',
                    'Grantee',
                    'Book',
                    'Page',
                    'Acres',
                    'Improved',
                    'Qualified Sale',
                    'Multi Parcel']
    },
    {
        'name': 'ValuationHistoryReport',
        'query': """
SELECT
    state_parcel_no,
    account_no,
    tax_year,
    actual_value,
    raw_assessed_value,
    taxable_value,
    taxable_assessed_value
FROM
    asr_adv_search_query.v_valuation_history_export
ORDER BY
    account_no,
    tax_year DESC
        """,
        'headers': ['State Parcel #',
                    'Account #',
                    'Tax Year',
                    'Total Actual Value',
                    'Total Assessed Value',
                    'Taxable Actual Value',
                    'Taxable Assessed Value']
    },
]
