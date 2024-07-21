import csv
import logging
import queries
import sqlalchemy as sqla
import sqlalchemy.orm as orm
import urllib.parse as parse
import tabledef as tables
import queries as queries
import jsondef as jsondef
import json
#import pandas as pd

from flask_restful import fields, marshal
from collections import defaultdict
from sqlalchemy.inspection import inspect

logging.basicConfig(filename='test.log', level=logging.INFO)
'''
db_username = 'cboe_web_user'
db_password = 'cboe_web_user'
db_host = 'dvcboesql.dcgd.douglas.co.us'
db_port = '1433'
db_database = 'cboe'
'''
# db_string = 'mssql pyodbc'
# db_username = 'py_etl'
# db_password = 'sun123'
# db_host = 'dvassrrpt.dcgd.douglas.co.us'
# db_port = '1433'
# db_database = 'assessor_datastore'

db_string = 'mssql pyodbc'
db_username = 'assessor_app_user'
db_password = 'j6S#E&di3)z$'
db_host = 'uadcetl-sql01.dcgov.douglas.co.us'
db_port = '1433'
db_database = 'assessor_datastore'

mssql_driver = 'ODBC Driver 17 for SQL Server'

def build_db_conn_url():
    #gmdc_cv_url = 'mssql+pyodbc://{0}:{1}@{2}:{3}/{4}?driver={5}'.format(
    gmdc_cv_url = '{0}:{1}@{2}:{3}/{4}?driver={5}'.format(
    #gmdc_cv_url = '{0}://{1}:{2}@{3}:{4}/{5}?driver={6}'.format(        
        #parse.quote_plus(db_string),
        parse.quote_plus(db_username),
        parse.quote_plus(db_password),
        parse.quote_plus(db_host),
        parse.quote_plus(db_port),
        parse.quote_plus(db_database),
        parse.quote_plus(mssql_driver)
    )
    return gmdc_cv_url

def build():
    return {
        'db_connection': build_db_conn_url(),
        'db_connection_config': 'assessor-etl-py',
        
    }

def look_up_zip_codes(db_session):
    zip_codes = [
        row.zip_code
        for row in db_session.query(tables.ValidPropertyZipCode) \
            .order_by(tables.ValidPropertyZipCode.zip_code) \
            .all()
    ]
    return zip_codes

def look_up_account_types(db_session):
    results = [value[0] for value in db_session.query(tables.FlatAccount.account_type)
        .order_by(tables.FlatAccount.account_type).distinct()]
    print(type(results))
    #for result in results:
    #    print(result)

def query_to_list(rset):
    result = []
    for obj in rset:
        instance = inspect(obj)
        items = instance.attrs.items()
        result.append([x.value for _,x in items])
    return instance.attrs.keys(), result

def query_to_dict(rset):
    result = defaultdict(list)
    for obj in rset:
        instance = inspect(obj)
        for key, x in instance.attrs.items():
            result[key].append(x.value)
    return result

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
            .order_by(tables.Subdivision.number)
            .all()
    ]
    return subdivisions

def look_up_deed_types(db_session):
    deed_types = [value[0] for value in 
        db_session.query(tables.Sale.deed_code_description)
            .order_by(tables.Sale.deed_code_description)
            .distinct()]
    return deed_types

def main(*args, **kargs) -> None:
    db_config = build()
    #print(db_config['db_connection_config']);
    db_conn_string = db_config['db_connection']
    #print(db_conn_string)
    #print(f'mssql+pyodbc://{db_conn_string}')
    print(db_config['db_connection'])
    print(db_config['db_connection_config'])
    #engine = sqla.create_engine(f'mssql+pyodbc://{db_conn_string}', echo=False)
    engine = sqla.create_engine(f'mssql+pyodbc://{db_conn_string}', echo=False)

    logger = logging.getLogger('assessor.jsonetl')
    logger.info('Starting Process...')
    logger.info('db_conn_string: ' + db_conn_string)

    Session = orm.sessionmaker(bind=engine)
    session = Session()
    # output = look_up_zip_codes(session)
    # output = look_up_account_types(session)

    subdivisions = look_up_subdivisions(session);
    with open('test.json', 'w') as outfile:
        # json.dump(output, outfile, indent=4)
        json.dump(subdivisions, outfile, indent=4)
        
    logger.info('Finishing Process...')



if __name__ == "__main__":
    main()
