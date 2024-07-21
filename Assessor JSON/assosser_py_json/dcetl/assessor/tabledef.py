"""Defines SQLAlchemy Table objects for the assessor_datastore.asr_datastore
   schema.
"""

from sqlalchemy import (Column, String, Numeric, DateTime, LargeBinary, Integer,
                        Unicode, VARCHAR, NUMERIC, INTEGER, DATETIME,
                        ForeignKey, ForeignKeyConstraint, Table)
from sqlalchemy.dialects.mssql.base import BIT
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship


Base = declarative_base()


class AccountNumber(Base):
    __tablename__ = 'account_number'
    __table_args__ = {'schema': 'asr_adv_search_query'}

    id = Column(Numeric(30, 0), primary_key=True)
    account_no = Column(String(30))


# class SaleAccount(Base):
#     __tablename__ = 'sale_account'
#     __table_args__ = {'schema': 'asr_datastore'}

#     account_no = Column(
#         ForeignKey('asr_adv_search_query.v_flat_account.account_no'), 
#         primary_key=True, nullable=False)
#     recording_no = Column(
#         ForeignKey('asr_adv_search_query.v_sale.recording_no'), 
#         primary_key=True, nullable=False)


sale_account = Table(
    'sale_account', 
    Base.metadata,
    Column('account_no', 
           Integer, 
           ForeignKey('asr_adv_search_query.v_flat_account.account_no')),
    Column('recording_no', 
           Integer, 
           ForeignKey('asr_adv_search_query.v_sale.recording_no')),
    schema='asr_datastore'
)


class FlatAccount(Base):
    __tablename__ = 'v_flat_account'
    __table_args__ = {'schema': 'asr_adv_search_query'}

    account_no = Column(String(30), primary_key=True)
    state_parcel_no = Column(String(30))
    tax_district_no = Column(String(30))
    account_type = Column(String(30))
    appraisal_type = Column(String(30))
    account_status = Column(String(30))
    account_status_description = Column(String(100))
    legal_description = Column(String)
    longitude_x = Column(Numeric(30, 8))
    latitude_y = Column(Numeric(30, 8))
    location = Column(String(50))
    elevation_z = Column(Numeric(30, 8))
    bldg_permit_auth_id = Column(Integer)
    quarter = Column(String(15))
    section = Column(String(15))
    township = Column(String(15))
    range = Column(String(15))
    primary_owner_name = Column(String(256))
    owner_address_line_1 = Column(String(436))
    owner_address_line_2 = Column(String(436))
    owner_city_name = Column(String(436))
    owner_state = Column(String(436))
    owner_zip_code = Column(String(436))
    actual_value_sum = Column(Numeric(38, 2))
    assessed_value_sum = Column(Numeric(38, 2))
    net_acres_sum = Column(Numeric(38, 4))
    subdivision_no = Column(String(30))
    subdivision_name = Column(String(256))
    filing_no = Column(String(30))
    filing_description = Column(String(80))
    sub_filing_recording_no = Column(String(30))
    primary_property_unit_no = Column(String(30))
    primary_property_address_number = Column(String(15))
    primary_property_address_number_suffix = Column(String(30))
    primary_property_pre_direction_code = Column(String(50))
    primary_property_street_name = Column(String(80))
    primary_property_street_type_code = Column(String(30))
    primary_property_post_direction_code = Column(String(50))
    primary_property_city = Column(String(50))
    primary_property_zip_code = Column(String(10))
    lot = Column(String(30))
    tract = Column(String(30))
    block = Column(String(30))
    recording_nos = Column(Unicode)
    tax_authority_nos = Column(Unicode)
    default_lea = Column(String(30))
    neighborhood_code = Column(String(50))
    neighborhood_extension = Column(String(50))
    land_attributes = Column(Unicode)
    land_segments = relationship('LandAbstract', lazy='joined')
    buildings = relationship('Building', lazy='subquery')
    sales = relationship('Sale', secondary=sale_account, lazy='subquery')
    value_history = relationship('ValueHistory', lazy='subquery')
    class_code_values = relationship('ClassCodeValue', lazy='subquery')


class ValueHistory(Base):
    __tablename__ = 'v_valuation_history_export'
    __table_args__ = {'schema': 'asr_adv_search_query'}

    account_no = Column(
        VARCHAR(30),
        ForeignKey('asr_adv_search_query.v_flat_account.account_no'),
        primary_key=True)
    tax_year = Column(Numeric(4, 0), primary_key=True)
    state_parcel_no = Column(VARCHAR(30))
    actual_value = Column(Numeric(15, 2))
    raw_assessed_value = Column(Numeric(15, 2))
    taxable_value = Column(Numeric(15, 2))
    taxable_assessed_value = Column(Numeric(15, 2))


class ClassCodeValue(Base):
    __tablename__ = 'v_summed_values_by_class_code'
    __table_args__ = {'schema': 'asr_adv_search_query'}

    account_no = Column(
        VARCHAR(30),
        ForeignKey('asr_adv_search_query.v_flat_account.account_no'),
        primary_key=True)
    valuation_class_code = Column(String(50), primary_key=True)
    valuation_class_code_description = Column(String(500))
    actual_value = Column(Numeric(38, 2))
    assessed_value = Column(Numeric(38, 2))
    net_acres = Column(Numeric(38, 4))


class Sale(Base):
    __tablename__ = 'v_sale'
    __table_args__ = {'schema': 'asr_adv_search_query'}

    recording_no = Column(VARCHAR, primary_key=True)
    grantor = Column(VARCHAR)
    grantee = Column(VARCHAR)
    sale_date = Column(DATETIME)
    deed_code_description = Column(String(100))
    sale_price = Column(NUMERIC(15, 2))
    book = Column(VARCHAR)
    page = Column(VARCHAR)
    non_sale_flag = Column(BIT)
    improved_flag = Column(BIT)     
    valid1_flag = Column(BIT)
    multi_parcel_flag = Column(BIT)
       
    # The following are additional columns, but not to be published:
    # exclude_code_1 = Column(String(50))
    # exclude_code_1_description = Column(String(100))
    # exclude_code_2 = Column(String(50))
    # exclude_code_2_description = Column(String(100))   
    # valid2_flag = Column(BIT)    
    # deed_code = Column(VARCHAR)
    # confirmed_flag = Column(Integer)
    # create_datetime = Column(DateTime)
    # create_user_id = Column(String(60))
    # update_datetime = Column(DateTime)
    # update_user_id = Column(String(60))
    # rowhash = Column(LargeBinary(8000))


class LandAbstract(Base):
    __tablename__ = 'v_land_abstract'
    __table_args__ = {'schema': 'asr_adv_search_query'}

    account_no = Column(
        ForeignKey('asr_adv_search_query.v_flat_account.account_no'), 
        primary_key=True)
    abstract_code = Column(String(50), primary_key=True)
    abstract_code_description = Column(String(100))
    land_abstract_detail_id = Column(Numeric(15, 0), primary_key=True)
    land_type = Column(String(50))
    land_acres = Column(Numeric(20, 6))
    land_sf = Column(Numeric(20, 6))
    land_unit_count = Column(Numeric(20, 6))
    land_value_per = Column(Numeric(15, 2))
    land_value = Column(Numeric(15, 2))
    land_override_flag = Column(BIT)
    land_override_total = Column(Numeric(15, 2))
    land_actual_value = Column(Numeric(15, 2))
    land_class = Column(String(10))
    land_subclass = Column(String(10))
    land_valued_by = Column(String(50))
    land_value_measure = Column(String(50))
    # The following are additional columns, but not to be published:
    # create_datetime = Column(DateTime)
    # create_user_id = Column(String(60))
    # update_datetime = Column(DateTime)
    # update_user_id = Column(String(60))
    # rowhash = Column(LargeBinary(8000))


class LandAttribute(Base):
    __tablename__ = 'land_attribute'
    __table_args__ = {'schema': 'asr_datastore'}

    account_number = Column('account_no', String(30), primary_key=True)
    detail_id = Column(Numeric(15), primary_key=True)
    code = Column('attribute_type', String(30))
    description = Column('attribute_subtype', String(50))


class RealAccount(Base):
    __tablename__ = 'real_account'
    __table_args__ = {'schema': 'asr_datastore'}

    account_no = Column(primary_key=True)
    no_of_buildings = Column(String(10))
    vacant_flag = Column(BIT)
    improvement_only_flag = Column(BIT)
    tif_flag = Column(BIT)
    zoning_code = Column(String(50))
    zoning_code_description = Column(String(100))
    platted_flag = Column(BIT)
    default_lea = Column(String(30))
    default_lea_description = Column(String(100))
    total_improvement_interest_percent = Column(Numeric(9, 6))
    total_land_interest_percent = Column(Numeric(9, 6))
    # create_datetime = Column(DateTime)
    # create_user_id = Column(String(60))
    # update_datetime = Column(DateTime)
    # update_user_id = Column(String(60))
    # rowhash = Column(LargeBinary(8000))


class Building(Base):
    __tablename__ = 'v_building'
    __table_args__ = {
        'schema': 'asr_adv_search_query',
    }

    account_no = Column(
        ForeignKey('asr_adv_search_query.v_flat_account.account_no'), 
        primary_key=True)
    building_number = Column(Numeric(5, 0), primary_key=True)
    completed_percent = Column(Numeric(7, 4))
    build_quality = Column(String)
    building_perimeter = Column(Numeric(15, 0))
    property_type = Column(String(50))
    condition_type = Column(String(50))
    approach_type = Column(String(50))
    primary_flag = Column(BIT)
    building_unit_type = Column(String(30))
    above_grade_square_feet = Column(Numeric(15, 0))
    square_feet_with_basement = Column(Numeric(38, 0))
    basement_total_square_feet = Column(Numeric(38, 0))
    basement_finished_square_feet = Column(Numeric(38, 0))
    total_finished_square_feet = Column(Numeric(38, 0))
    basement_garden_level = Column(BIT)
    basement_walkout = Column(BIT)
    fireplaces = Column(Unicode)
    features = Column(Unicode)
    garage_total_sf = Column(Numeric(16, 0))
    porch_total_sf = Column(Numeric(16, 0))
    uses = relationship('BuildingUse', lazy='joined')
    styles = relationship('BuildingStyle', lazy='joined')


class BuildingStyle(Base):
    __tablename__ = 'improvement_built_as'
    detail_id = Column('built_as_detail_id', Numeric(15, 0), primary_key=True)
    account_no = Column(String(30))
    building_number = Column('improvement_no', Numeric(5, 0))
    style_code = Column('built_as_code', String(50))
    style_code_description = Column('built_as_code_description', String(100))
    number_of_stories = Column('no_of_story', Numeric(5, 2))
    room_count = Column(Numeric(7, 0))
    bedroom_count = Column(Numeric(7, 2))
    year_built = Column('built_year', String(4))
    year_remodeled = Column('remodeled_year', String(4))
    remodeled_percent = Column(Numeric(7, 4))
    effective_age = Column(Numeric(5, 0))
    style_square_feet = Column('built_as_sf', Numeric(15, 0))
    bathroom_count = Column(Numeric(7, 2))
    heat_type = Column(String(50))
    hvac_percent = Column(Numeric(7, 4))
    exterior_construction_type = Column(String(50))
    interior_finish_type = Column(String(50))
    roof_material_type = Column(String(50))
    floor_material_type = Column(String(50))
    roof_construction_type = Column(String(50))
    __table_args__ = (
        ForeignKeyConstraint(
            [account_no, building_number],
            [Building.account_no, Building.building_number]
        ),
        {
            'schema': 'asr_datastore',
        }
    )
    # typical_story_height = Column(Numeric(5, 0))
    # roof_construction_type = Column(String(50))
    # total_unit_count = Column(Numeric(7, 0))
    # class_code = Column(String(50))
    # class_code_description = Column(String(100))
    # sprinkler_coverage_sf = Column(Numeric(15, 0))
    # primary_flag = Column(BIT)
    # built_as_length = Column(Numeric(15, 0))
    # built_as_width = Column(Numeric(15, 0))
    # built_as_height = Column(Numeric(15, 0))
    # mobile_home_make = Column(String(50))
    # mobile_home_model_type = Column(String(30))
    # mobile_home_skirt = Column(String(30))
    # mobile_home_skirt_linear_feet = Column(Numeric(15, 0))
    # mobile_home_wall_type = Column(String(32))


class BuildingUse(Base):
    __tablename__ = 'improvement_occupancy'
    detail_id = Column('occupancy_detail_id', Numeric(15, 0), primary_key=True)
    account_no = Column(String(30))
    building_number = Column('improvement_no', Numeric(5, 0))
    use_code = Column('occupancy_code', String(50))
    use_code_description = Column('occupancy_code_description', String(100))
    use_percentage = Column('occupancy_percent', Numeric(7, 4))
    abstract_code = Column(String(50))
    abstract_code_description = Column(String(100))
    abstract_value = Column(Numeric(15, 2))
    __table_args__ = (
        ForeignKeyConstraint(
            [account_no, building_number],
            [Building.account_no, Building.building_number]
        ),
        {
            'schema': 'asr_datastore',
        }
    )


class ValidPropertyZipCode(Base):
    __tablename__ = 'v_valid_property_zip_code'
    __table_args__ = {
        'schema': 'asr_adv_search_query',
    }

    zip_code = Column(String(5), primary_key=True)


class Subdivision(Base):
    __tablename__ = 'subdivision'
    __table_args__ = {'schema': 'asr_datastore'}

    number = Column('subdivision_no', String(30), primary_key=True)
    name = Column('subdivision_name', String(256))
    # For the next line, see:
    # http://docs.sqlalchemy.org/en/latest/orm/relationship_api.html#sqlalchemy.orm.relationship.params.order_by
    sub_filings = relationship('SubFiling', order_by='SubFiling.filing_number')


class SubFiling(Base):
    __tablename__ = 'sub_filing'
    __table_args__ = {'schema': 'asr_datastore'}

    recording_number = Column('sub_filing_recording_no',
                              String(30),
                              primary_key=True)
    subdivision_number = Column('subdivision_no',
                                String(30),
                                ForeignKey('asr_datastore.subdivision.subdivision_no'))
    filing_number = Column('filing_no', String(30), primary_key=True)
    description = Column('filing_description', String(80))


class TaxDistrictAuthority(Base):
    __tablename__ = 'tax_district_authority'
    __table_args__ = {'schema': 'asr_datastore'}

    tax_district_number = Column('tax_district_no',
                                 String(30),
                                 ForeignKey('asr_datastore.tax_district.tax_district_no'),
                                 primary_key=True)
    tax_authority_number = Column('tax_authority_no',
                                  String(30),
                                  ForeignKey('asr_datastore.tax_authority.tax_authority_no'),
                                  primary_key=True)

#
# tax_district_authority = Table(
#     'tax_district_authority', Base.metadata,
#     Column('tax_district_no',
#            Integer,
#            ForeignKey('asr_datastore.tax_district.tax_district_no')),
#     Column('tax_authority_no',
#            Integer,
#            ForeignKey('asr_datastore.tax_authority.tax_authority_no')),
#     schema='asr_datastore'
# )


class TaxDistrict(Base):
    __tablename__ = 'tax_district'
    __table_args__ = {'schema': 'asr_datastore'}

    number = Column('tax_district_no', String(30), primary_key=True)
    name = Column('tax_district_name', String(256))
    tax_authority_numbers = relationship("TaxDistrictAuthority",
                                         order_by='TaxDistrictAuthority.tax_authority_number')


class TaxAuthority(Base):
    __tablename__ = 'tax_authority'
    __table_args__ = {'schema': 'asr_datastore'}

    number = Column('tax_authority_no', String(30), primary_key=True)
    name = Column('tax_authority_name', String(256))
    type = Column('authority_type', String(100))
    tax_district_numbers = relationship("TaxDistrictAuthority",
                                        order_by='TaxDistrictAuthority.tax_district_number')


# class AccountNeighborhood(Base):
#     __tablename__ = 'account_neighborhood'
#     __table_args__ = {'schema': 'asr_datastore'}

#     account_no = Column(
#         ForeignKey('asr_adv_search_query.v_flat_account.account_no'),
#         primary_key=True, nullable=False
#     )
#     neighborhood_code = Column(String(50))
#     property_type = Column(String(50))
#     neighborhood_extension = Column(String(50))
    #
    # create_datetime = Column(DateTime)
    # create_user_id = Column(String(60))
    # update_datetime = Column(DateTime)
    # update_user_id = Column(String(60))
