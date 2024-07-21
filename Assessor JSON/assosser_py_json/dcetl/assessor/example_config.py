"""Provides example environment-specific configuration values for etl.py.
   Copy this file to 'config.py' and set values appropriately before running.
"""


def build():
    return {
        # The db_connection_config should contain a PYODBC-compliant
        # connection string, either in the form of an ODBC DSN, like
        # 'some_odbc_dsn', or in the form of:
        # '{username}:{password}@{server}:{port}/{database}?driver={driver}'
        # where driver is something like 'SQL%20Server%20Native%20Client%2011.0'
        # (Notice that spaces are escaped.)
        'db_connection_config': 'some_conn_string_here',

        # The Elasticsearch connection, es_connection_config, should contain
        # one or more hosts for the target Elasticsearch cluster.
        'es_connection_config': [
            {
                'host': 'dv-api.dcgd.douglas.co.us',
                'port': '9500'
            }
        ]
    }
