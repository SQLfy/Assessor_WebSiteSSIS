"""Provides example environment-specific configuration values for etl.py.
   Copy this file to 'config.py' and set values appropriately before running.
"""
import urllib.parse as parse
import os

def build():
    return {
        # The db_connection_config should contain a PYODBC-compliant
        # connection string, either in the form of an ODBC DSN, like
        # 'some_odbc_dsn', or in the form of:
        # '{username}:{password}@{server}:{port}/{database}?driver={driver}'
        # where driver is something like 'SQL%20Server%20Native%20Client%2011.0'
        # (Notice that spaces are escaped.)
        'db_connection_config': 'mssql+pyodbc://sa_ua_assretl:dogN$V#%Um\eP6Ba4UX8X&=33b6xTm@uadcetl-sql01.dcgov.douglas.co.us:1433/assessor_datastore?driver=ODBC+Driver+13+for+SQL+Server',

        # The Elasticsearch connection, es_connection_config, should contain
        # one or more hosts for the target Elasticsearch cluster.
        'es_connection_config': [
            {
                'host': 'uaelasticassessor-int-n1.vm.douglas.co.us',
                'port': '9201'
            },
            {
                'host': 'uaelasticassessor-int-n2.vm.douglas.co.us',
                'port': '9201'
            },
        ],
	# The folder where the comprehensive data downloads, as zip files,
        # will be written.
        'downloads_folder': os.path.join(os.sep + os.sep + 'UARealware-App',
                                         'Photos', 'DOWNLOADS'),
    }
