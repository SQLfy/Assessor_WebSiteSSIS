"""Extracts data from the assessor database,
   Transforms the data into JSON objects, and
   Loads the JSON objects into Elasticsearch.
"""

import csv
import logging
import os
import sys
from contextlib import contextmanager
from io import StringIO
from time import perf_counter
from zipfile import ZipFile, ZIP_DEFLATED

import dcetl.assessor.config as config_builder
import dcetl.assessor.jsondef as json
import dcetl.assessor.queries as queries
import dcetl.assessor.tabledef as tables
import elasticsearch
import sqlalchemy as sqal
import sqlalchemy.orm as orm
# import json
# import urllib.parse as parse
from dcetl.assessor.elastic_indexes import index_settings
from elasticsearch.helpers import parallel_bulk
from flask_restful import marshal

class ContextAwareSessionMaker:
    def __init__(self, db_conn_string):
        self.engine = sqal.create_engine(f'mssql+pyodbc://{db_conn_string}')
        self.session_maker = orm.sessionmaker(bind=self.engine)

    @contextmanager
    def make_session(self) -> orm.Session:
        """Provide a transactional scope around a series of operations."""
        session = self.session_maker()
        try:
            yield session
            session.commit()
        except Exception:
            session.rollback()
            raise
        finally:
            session.close()

    def __call__(self) -> orm.Session:
        return self.make_session()


def populate_accounts_index(es_config, session_maker):
    """Extracts, marshals, and passes chunks of data to a Pipe"""
    logger = logging.getLogger('assessor.jsonetl')
    logger.info('Starting Process...')
    start = perf_counter()

    batch_size = 25000

    es_client = elasticsearch.Elasticsearch(es_config)
    results = list()

    with session_maker.make_session() as db_session:
        id_range_result = db_session.execute(queries.id_range_query)
        first_id, last_id, id_count = id_range_result.first()
        i = first_id
        while i <= last_id:
            j = min((i + batch_size - 1), last_id)
            logger.info('Starting %s to %s', i, j)
            batch = db_session.query(tables.FlatAccount) \
                .join(tables.AccountNumber,
                      tables.FlatAccount.account_no ==
                      tables.AccountNumber.account_no) \
                .filter(tables.AccountNumber.id.between(i, j)) \
                .all()
            marshaled_batch = marshal(batch, json.ELASTIC_FLAT_ACCOUNT)

            results.extend(list(parallel_bulk(es_client,
                                              marshaled_batch,
                                              thread_count=10,
                                              chunk_size=250,
                                              request_timeout=10,
                                              queue_size=10)))

            logger.info('Completed %s to %s', i, j)
            i = i + batch_size

    errors = [error for okay, error in results if not okay]
    logger.info('Indexed %s accounts with %s errors', len(results), len(errors))
    for error in errors:
        logger.error(error)
    logger.info('Entire process done in %s', perf_counter() - start)


def populate_advsearch_lookups_index(es_config, db_session):
#    es_client = elasticsearch.Elasticsearch(es_config)
    # account_types = [value[0] for value in
    #                  db_session.query(tables.FlatAccount.account_type)
    #                      .order_by(tables.FlatAccount.account_type)
    #                      .distinct()]
    # building_styles = [{
    #                        'code': r.style_code,
    #                        'description': r.style_code_description
    #                    } for r
    #                    in db_session.query(tables.BuildingStyle.style_code,
    #                                        tables.BuildingStyle.style_code_description)
    #                        .order_by(
    #         tables.BuildingStyle.style_code_description)
    #                        .distinct()]
                           
    adv_search_lookups = {
        'zip_codes': look_up_zip_codes(db_session)
#        'account_types': account_types,
#        'building_styles': building_styles,
#        'building_uses': look_up_building_uses(db_session),
#        'land_attributes': look_up_land_attributes(db_session),
#        'land_uses': look_up_land_uses(db_session),
#        'subdivisions': look_up_subdivisions(db_session),
#        'tax_districts': look_up_tax_districts(db_session),
#        'tax_authorities': look_up_tax_authorities(db_session),
#        'deed_types': look_up_deed_types(db_session),
#        'neighborhoods':look_up_neighborhoods(db_session),
#        'leas': look_up_leas(db_session),
    }

#    es_client.create(index_settings['advsearch_lookups']['index'],
#                     index_settings['advsearch_lookups']['doc_type'],
#                     'all',
#                     adv_search_lookups)


def look_up_zip_codes(db_session):
    zip_codes = [
        row.zip_code
        for row in db_session.query(tables.ValidPropertyZipCode)
                             .order_by(tables.ValidPropertyZipCode.zip_code)
                             .all()
    ]
    return zip_codes


def look_up_building_uses(db_session):
    building_uses = [
        {
            'code': r.use_code,
            'description': r.use_code_description
        }
        for r in db_session.query(tables.BuildingUse.use_code,
                                  tables.BuildingUse.use_code_description)
                           .order_by(tables.BuildingUse.use_code_description)
                           .distinct()
    ]
    return building_uses


def look_up_land_attributes(db_session):
    land_attributes = [
        {
            'code': r.code,
            'description': r.description
        }
        for r in db_session.query(tables.LandAttribute.code,
                                  tables.LandAttribute.description)
                           .order_by(tables.LandAttribute.code)
                           .distinct()
    ]
    return land_attributes


def look_up_land_uses(db_session):
    land_uses = [
        {
            'code': r.abstract_code,
            'description': r.abstract_code_description
        }
        for r in db_session.query(tables.LandAbstract.abstract_code,
                                  tables.LandAbstract.abstract_code_description)
                           .order_by(tables.LandAbstract.abstract_code)
                           .distinct()
    ]
    return land_uses


def look_up_subdivisions(db_session):
    subdivisions = [
        {
            'number': row.number,
            'name': row.name,
            'sub_filings': [
                {
                    'recording_number': sf.recording_number,
                    'filing_number': sf.filing_number,
                    'description': sf.description
                }
                for sf in row.sub_filings
            ]
        }
        for row in db_session.query(tables.Subdivision)
            .options(orm.joinedload(tables.Subdivision.sub_filings))
            .order_by(tables.Subdivision.name)
            .all()
    ]
    return subdivisions


def look_up_tax_districts(db_session):
    tax_districts = [
        {
            'number': row.number,
            'name': row.name,
            'tax_authority_numbers': [
                tan.tax_authority_number
                for tan in row.tax_authority_numbers
            ]
        }
        for row in db_session.query(tables.TaxDistrict)
            .options(orm.joinedload(tables.TaxDistrict.tax_authority_numbers))
            .order_by(tables.TaxDistrict.number)
            .all()
    ]
    return tax_districts


def look_up_tax_authorities(db_session):
    tax_authorities = [
        {
            'number': row.number,
            'name': row.name,
            'type': row.type
        }
        for row in db_session.query(tables.TaxAuthority)
            .order_by(tables.TaxAuthority.number)
            .all()
    ]
    return tax_authorities

def look_up_deed_types(db_session):
    deed_types = [value[0] for value in 
        db_session.query(tables.Sale.deed_code_description)
            .filter(tables.Sale.non_sale_flag == 0)
            .order_by(tables.Sale.deed_code_description)
            .distinct()]
    return deed_types


def look_up_neighborhoods(db_session):
    neighborhoods = [
        {
            'name': row.neighborhood_code,
            'extension': row.neighborhood_extension
        }
        for row in db_session.query(tables.FlatAccount.neighborhood_code, tables.FlatAccount.neighborhood_extension)
            .filter(tables.FlatAccount.neighborhood_code.isnot(None)) 
            .order_by(tables.FlatAccount.neighborhood_code, tables.FlatAccount.neighborhood_extension)
            .distinct()
    ] 
    return neighborhoods

def look_up_leas(db_session):
    leas = [
        {
            'label': row.default_lea,
            'value': row.default_lea
        }
        for row in db_session.query(tables.FlatAccount.default_lea)
            .filter(tables.FlatAccount.default_lea.isnot(None))        
            .order_by(tables.FlatAccount.default_lea)
            .distinct()]
    return leas


def prepare_elasticsearch_index(es_config, settings, delete_existing=False):
    es_client = elasticsearch.Elasticsearch(es_config)
    index = settings['index']
    doc_type = settings['doc_type']
    config = settings['config']
    _logger = logging.getLogger('assessor.jsonetl')
    _logger.debug('Attempting to connect to Elasticsearch: %s',
                  es_client.transport.hosts)
    if es_client.ping():
        _logger.info('Connected to elasticsearch: %r',
                     es_client.transport.hosts)

        index_exists = es_client.indices.exists(index)

        if delete_existing and index_exists:
            es_client.indices.delete(index)
            index_exists = False

        if index_exists:
            match_all_query = {'query': {'match_all': {}}}
            es_client.delete_by_query(index=index,
                                      doc_type=doc_type,
                                      body=match_all_query)
        else:
            es_client.indices.create(index=index,
                                     body=config)
    else:
        raise IOError('Unable to ping the specified Elasticsearch instance: %r',
                      es_client.transport.hosts)


def process_advsearch_accounts(es_config, db_config):
    logger = logging.getLogger('assessor.jsonetl')

    prepare_elasticsearch_index(es_config,
                                index_settings['accounts'],
                                True)
    populate_accounts_index(es_config, db_config)


def process_advsearch_lookups(es_config, session_maker):
    with session_maker.make_session() as db_session:
        logger = logging.getLogger('assessor.jsonetl')
#        prepare_elasticsearch_index(es_config,
#                                    index_settings['advsearch_lookups'],
#                                    True)
#        populate_advsearch_lookups_index(es_config, db_session)


def configure_logging(config):
    logging.basicConfig(format='%(asctime)s - %(name)s - '
                               '%(levelname)s - %(message)s',
                        level=logging.DEBUG)
    logging.getLogger('sqlalchemy.engine').setLevel(logging.INFO)
    logging.getLogger('elasticsearch').setLevel(logging.WARNING)
    logging.getLogger('urllib3').setLevel(logging.WARNING)


def q_and_d(downloads_folder, session_maker):
    beg_process = perf_counter()
    for root, dirs, files in os.walk(downloads_folder):
        for f in files:
            os.unlink(os.path.join(root, f))
    for export in queries.export_queries:
        zip_file = os.path.join(downloads_folder,
                                export['name'] + '.zip')
        print(f'Filename: {zip_file}')
        with session_maker.make_session() as db_session, \
                StringIO() as csv_file, \
                ZipFile(zip_file, 'w', ZIP_DEFLATED) as csv_zip:

            csv_writer = csv.writer(csv_file, delimiter=',',
                                    quotechar='"',
                                    quoting=csv.QUOTE_MINIMAL)

            result = db_session.execute(export['query'])
            csv_writer.writerow(export['headers'])

            for row in result:
                csv_writer.writerow(row)

            csv_zip.writestr(export['name'] + '.csv',
                             csv_file.getvalue())
        end_process = perf_counter()
        print(f'Total time for {export["name"] + ".csv"} '
              f'= {(end_process - beg_process)}')


def page(beg, end, page_size):
    i = beg
    while i <= end:
        yield i, min((i + page_size - 1), end)
        i = i + page_size


def main(*args, **kargs) -> None:
    config = config_builder.build()
    configure_logging(config)
    logger = logging.getLogger('assessor.jsonetl')
    es_config = config['es_connection_config']
    db_config = config['db_connection_config']
    session_maker = ContextAwareSessionMaker(db_config)
    with session_maker.make_session() as db_session:
        #05/12/2021 call [asr_adv_search_query].[usp_create_flat_account] to
        #populate [asr_adv_search_query].[flat_account] table
        logger.info('Starting the execution of a stored procedure')
#        db_session.execute("exec assessor_datastore.asr_adv_search_query.usp_create_flat_account")
    try:
        logger.info('db_config: '+db_config);
        logger.info('downloads_folder: '+config['downloads_folder'])
        #q_and_d(config['downloads_folder'], session_maker)

        logger.info('Extracting and loading advanced search lookups')
#        process_advsearch_lookups(es_config, session_maker)

        logger.info('Extracting and loading account documents')
        #process_advsearch_accounts(es_config, session_maker)

    except Exception as e:
        logger.error('An error occured while performing ETL:\n %r', e)
        sys.exit(-1)


if __name__ == "__main__":
    main()
    