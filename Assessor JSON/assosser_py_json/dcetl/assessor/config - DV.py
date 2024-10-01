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
        'db_connection_config': 'mssql+pyodbc://sa_dv_assretl:4oByhXlartyqbP$Yh0rKpNA5#3IEPd@dvdcetl-sql01.dcgov.douglas.co.us:1433/assessor_datastore?driver=ODBC+Driver+13+for+SQL+Server',

        # The Elasticsearch connection, es_connection_config, should contain
        # one or more hosts for the target Elasticsearch cluster.
        'es_connection_config': [
            {
                'host': 'dvelasticassessor-int-n1.vm.douglas.co.us',
                'port': '9201'
            },
            {
                'host': 'dvelasticassessor-int-n2.vm.douglas.co.us',
                'port': '9201'
            },
        ],
	# The folder where the comprehensive data downloads, as zip files,
        # will be written.
        'downloads_folder': os.path.join(os.sep + os.sep + 'dvRealware-App',
                                         'Photos', 'DOWNLOADS'),
    }
