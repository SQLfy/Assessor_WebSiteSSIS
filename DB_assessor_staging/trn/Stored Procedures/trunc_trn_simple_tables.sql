
create procedure trn.trunc_trn_simple_tables
as
BEGIN

TRUNCATE TABLE assessor_staging.asr_staging.T_PRE_LAND;
TRUNCATE TABLE [assessor_datastore].[asr_datastore].[land];
TRUNCATE TABLE [assessor_datastore].[asr_datastore].[subdivision];
TRUNCATE TABLE [assessor_datastore].[asr_datastore].[heat_type];
TRUNCATE TABLE [assessor_datastore].[asr_datastore].[occupancy_code];
TRUNCATE TABLE [assessor_datastore].[asr_datastore].[built_as_code];
TRUNCATE TABLE [assessor_datastore].[asr_datastore].[PropertyLocation];

END

