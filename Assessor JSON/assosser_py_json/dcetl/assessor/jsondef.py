"""This module defines the mappings for DC Assessor JSON documents."""

from collections import OrderedDict
from flask_restful import fields
import dcetl.dcfields as dcfields
from dcetl.assessor.elastic_indexes import index_settings

SALE = OrderedDict([
    ('recording_number', fields.String(attribute='recording_no')),
    ('grantor', fields.String),
    ('grantee', fields.String),
    ('sale_date', dcfields.IsoDateOnly()),
    ('sale_price', fields.Float),   
    ('deed_type', fields.String(attribute='deed_code_description')),
    ('book', fields.String),
    ('page', fields.String),
    ('non_sale', fields.Boolean(attribute='non_sale_flag')),
    ('improved', fields.Boolean(attribute='improved_flag')),    
    ('qualified_sale', fields.Boolean(attribute='valid1_flag')),
    ('multi_parcel', fields.Boolean(attribute='multi_parcel_flag')),
])


LAND_SEGMENT_ABSTRACT_CODE_JOINER = dcfields.Joiner(
    ' - ',
    'abstract_code',
    'abstract_code_description',
)


LAND_SEGMENT = OrderedDict([
    # ('account_number', fields.String(attribute='account_no')),
    ('class_code', fields.String(attribute='abstract_code')),
    ('class_code_description',
     fields.String(attribute='abstract_code_description')),
    ('class_code_concat', LAND_SEGMENT_ABSTRACT_CODE_JOINER),
    # ('land_abstract_detail_id', fields.String),
    ('type', fields.String(attribute='land_type')),
    ('acres', fields.Float(attribute='land_acres')),
    ('square_feet', fields.Float(attribute='land_sf')),
    ('unit_count', fields.Float(attribute='land_unit_count')),
    ('value_measure', fields.String(attribute='land_value_measure')),
    ('value_per', fields.Float(attribute='land_value_per')),
    ('value', fields.Float(attribute='land_value')),
    ('use_override_value', fields.Boolean(attribute='land_override_flag')),
    ('override_value', fields.Float(attribute='land_override_total')),
    ('actual_published_value', fields.Float(attribute='land_actual_value')),
    ('valued_by', fields.String(attribute='land_valued_by')),
])


BUILDING_STYLE_CODE_JOINER = dcfields.Joiner(
    ' - ',
    'style_code',
    'style_code_description',
)


BUILDING_STYLE = OrderedDict([
    # ('account_number', fields.String),
    # ('building_number', fields.Integer),
    ('style_code', fields.String),
    ('style_code_description', fields.String),
    ('style_code_concat', BUILDING_STYLE_CODE_JOINER),
    ('year_built', fields.Integer),
    ('number_of_stories', fields.Integer),
    ('room_count', fields.Integer),
    ('bedroom_count', fields.Float),
    ('bathroom_count', fields.Float),
    ('year_remodeled', fields.Integer),
    ('remodeled_percent', fields.Float),
    ('effective_age', fields.Integer),
    ('style_square_feet', fields.Integer),
    ('heat_type', fields.String),
    ('exterior_construction_type', fields.String),
    ('interior_finish_type', fields.String),
    ('roof_construction_type', fields.String),
    ('roof_material_type', fields.String),
    ('floor_material_type', fields.String),
    ('hvac_percent', fields.Float),
])


BUILDING_USE_CODE_JOINER = dcfields.Joiner(
    ' - ',
    'use_code',
    'use_code_description',
)


BUILDING_USE = OrderedDict([
    # ('account_number', fields.String),
    # ('building_number', fields.Integer),
    ('use_code', fields.String),
    ('use_code_description', fields.String),
    ('use_code_concat', BUILDING_USE_CODE_JOINER),
    ('use_percentage', fields.String),
    ('class_code', fields.String(attribute='abstract_code')),
    ('class_code_description', 
     fields.String(attribute='abstract_code_description')),
    ('class_code_value', fields.String(attribute='abstract_value')),
])


BUILDING = OrderedDict([
    ('building_number', fields.Integer),
    ('completed_percent', fields.Float),
    ('build_quality', fields.String),
    ('perimeter', fields.Integer(attribute='building_perimeter')),
    ('property_type', fields.String),
    ('condition', fields.String(attribute='condition_type')),
    ('approach', fields.String(attribute='approach_type')),
    ('primary_building', fields.Boolean(attribute='primary_flag')),
    ('unit_type', fields.String(attribute='building_unit_type')),
    ('above_grade_square_feet', fields.Integer),
    ('total_finished_square_feet', fields.Integer),
    ('square_feet_with_basement', fields.Integer),
    ('basement', OrderedDict([
        ('square_feet',
         fields.Integer(attribute='basement_total_square_feet')),
        ('finished_square_feet',
         fields.Integer(attribute='basement_finished_square_feet')),
        ('finished',
         dcfields.BooleanCheck(attribute='basement_finished_square_feet')),
        ('garden_level',
         fields.Boolean(attribute='basement_garden_level')),
        ('walkout',
         fields.Boolean(attribute='basement_walkout')),
    ])),
    ('fireplaces', fields.String),
    ('features', dcfields.Splitter('features', ',')),
    ('garage_total_square_feet', fields.Integer(attribute='garage_total_sf')),
    ('porch_total_square_feet', fields.Integer(attribute='porch_total_sf')),
    ('styles', fields.List(fields.Nested(BUILDING_STYLE))),
    ('uses', fields.List(fields.Nested(BUILDING_USE))),
])


FLAT_ACCT_STREET_ADDR_JOINER = dcfields.Joiner(
    ' ',
    'primary_property_address_number',
    'primary_property_pre_direction_code',
    'primary_property_street_name',
    'primary_property_street_type_code',
    'primary_property_unit_no',
)


GEO_LOCATION_JOINER = dcfields.GeoLocation(
    ',',
    'latitude_y',
    'longitude_x'
)


ANNUAL_ACCOUNT_VALUE = OrderedDict([
    ('tax_year', fields.Integer),
    ('actual_value', fields.Float),
    ('assessed_value', fields.Float(attribute='raw_assessed_value')),
    ('taxable_value', fields.Float),
    ('taxable_assessed_value', fields.Float),
])


CLASS_CODE_VALUE = OrderedDict([
    ('valuation_class_code', fields.String),
    ('valuation_class_code_description', fields.String),
    ('actual_value_sum', fields.Float(attribute='actual_value')),
    ('assessed_value_sum', fields.Float(attribute='assessed_value')),
    ('net_acres_sum', fields.Float(attribute='net_acres')),
])


FLAT_ACCOUNT = OrderedDict([
    ('account_number', fields.String(attribute='account_no')),
    ('state_parcel_number', fields.String(attribute='state_parcel_no')),
    ('legal_description', fields.String),
    # For details on the survey section below, please see the following link:
    # https://en.wikipedia.org/wiki/Section_(United_States_land_surveying)
    ('land_survey', OrderedDict([
        ('state', fields.Raw('Colorado')),
        ('county', fields.Raw('Douglas')),
        ('township', fields.String),
        ('range', fields.String),
        ('section', fields.String),
        ('quarter_section', fields.String(attribute='quarter'))
    ])),
    ('location', fields.String),
    ('geo_location', GEO_LOCATION_JOINER),
    ('account_type', fields.String),
    ('appraisal_type', fields.String),
    ('account_status', fields.String(attribute='account_status_description')),
    ('building_permit_authority_id',
     fields.Integer(attribute='bldg_permit_auth_id')),
    ('tax_district_number', fields.String(attribute='tax_district_no')),
    ('actual_value_sum', fields.Float),
    ('assessed_value_sum', fields.Float),
    ('net_acres_sum', fields.Float),
    ('lea', fields.String(attribute='default_lea')), 
    ('neighborhood_code', fields.String(attribute='neighborhood_code')),
    ('neighborhood_extension', fields.String(attribute='neighborhood_extension')),  
    ('recording_number', fields.String(attribute='sub_filing_recording_no')), 
    ('primary_address', OrderedDict([
        ('address_number',
         fields.String(attribute='primary_property_address_number')),
        ('pre_direction_code',
         fields.String(attribute='primary_property_pre_direction_code')),
        ('street_name',
         fields.String(attribute='primary_property_street_name')),
        ('street_type',
         fields.String(attribute='primary_property_street_type_code')),
        ('unit_number',
         fields.String(attribute='primary_property_unit_no')),
        ('street_address', FLAT_ACCT_STREET_ADDR_JOINER),
        ('city', fields.String(attribute='primary_property_city')),
        ('zip_code', dcfields.ZipCode(attribute='primary_property_zip_code')),
    ])),
    ('primary_owner', {
        'name': fields.String(attribute='primary_owner_name'),
        'address1': fields.String(attribute='owner_address_line_1'),
        'address2': fields.String(attribute='owner_address_line_2'),
        'city': fields.String(attribute='owner_city_name'),
        'state': fields.String(attribute='owner_state'),
        'zip_code': dcfields.ZipCode(attribute='owner_zip_code'),
    }),
    ('subdivision', OrderedDict([
        ('number', fields.String(attribute='subdivision_no')),
        ('name', fields.String(attribute='subdivision_name')),
        ('filing', OrderedDict([
            ('number', fields.String(attribute='filing_no')),
            ('detail', fields.String(attribute='filing_description')),
            ('recording_number',
             fields.String(attribute='sub_filing_recording_no')),
        ])),
        ('tract', fields.String),
        ('block', fields.String),
        ('lot', fields.String),
    ])),
    ('tax_authority_ids', dcfields.Splitter('tax_authority_nos', ',')),
    ('land_attributes', dcfields.Splitter('land_attributes', ',')),
    ('land_segments', fields.List(fields.Nested(LAND_SEGMENT))),
    ('buildings', fields.List(fields.Nested(BUILDING))),
    ('sales', fields.List(fields.Nested(SALE))),
    ('class_code_values', fields.List(fields.Nested(CLASS_CODE_VALUE))),
    ('value_history', fields.List(fields.Nested(ANNUAL_ACCOUNT_VALUE))),    
])


ELASTIC_FLAT_ACCOUNT = OrderedDict([
    ('_index', fields.Raw(index_settings['accounts']['index'])),
    ('_type', fields.Raw(index_settings['accounts']['doc_type'])),
    ('_id', fields.String(attribute='account_no')),
    ('_source', OrderedDict([
        *FLAT_ACCOUNT.items()
    ]))
])

ELASTIC_ADV_SEARCH_LOOKUPS = {
    '_index': index_settings['advsearch_lookups']['index'],
    '_type': index_settings['advsearch_lookups']['doc_type'],
    '_id': 'all',
}