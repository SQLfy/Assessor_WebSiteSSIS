


CREATE procedure [dqm].[drop_dqm_indexes]
as
begin


-- indexes for s_tblacct

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblacct_ClusteredIndex-accountno')
DROP INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct] WITH ( ONLINE = OFF )



-- indexes for s_tblacctpropertyaddress

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblacctpropertyaddress_accountno')
DROP INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress] WITH ( ONLINE = OFF )



-- indexes for s_tbladdresssecure

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-CITY')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-CITY] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-STATECODE')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE')
DROP INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE] ON [asr_staging].[s_tbladdresssecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ix_tbladdresssecure')
DROP INDEX [ix_tbladdresssecure] ON [asr_staging].[s_tbladdresssecure]





-- indexes for s_tblimps

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblimps_ClusteredIndex-accountno_impno')
DROP INDEX [s_tblimps_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimps] WITH ( ONLINE = OFF )



-- indexes for s_tblimpsbltas

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblimpsbltas_ACCOUNTNO')
DROP INDEX [IX_s_tblimpsbltas_ACCOUNTNO] ON [asr_staging].[s_tblimpsbltas]

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblimpsbltas_IMPNO')
DROP INDEX [IX_s_tblimpsbltas_IMPNO] ON [asr_staging].[s_tblimpsbltas]



-- indexes for s_tblimpsdetail

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblimpsdetail_ClusteredIndex-accountno_impno')
DROP INDEX [s_tblimpsdetail_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsdetail] WITH ( ONLINE = OFF )



-- indexes for s_tblimpsocc

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblimpsocc_ClusteredIndex-accountno_impno')
DROP INDEX [s_tblimpsocc_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsocc] WITH ( ONLINE = OFF )

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblimpsocc_impno')
DROP INDEX [IX_s_tblimpsocc_impno] ON [asr_staging].[s_tblimpsocc] WITH ( ONLINE = OFF )



-- indexes for s_tbllandabstract

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tbllandabstract_ClusteredIndex-accountno')
DROP INDEX [s_tbllandabstract_ClusteredIndex-accountno] ON [asr_staging].[s_tbllandabstract] WITH ( ONLINE = OFF )


-- indexes for s_tbllandattribute

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tbllandattribute_ClusteredIndex-accountno')
DROP INDEX [s_tbllandattribute_ClusteredIndex-accountno] ON [asr_staging].[s_tbllandattribute] WITH ( ONLINE = OFF )

-- indexes for s_tblpersonsecure

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblpersonsecure_NonClusteredIndex-NAME1')
DROP INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblpersonsecure_NonClusteredIndex-NAME2')
DROP INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]


IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ix_tblpersonsecure')
DROP INDEX [ix_tblpersonsecure] ON [asr_staging].[s_tblpersonsecure]



-- indexes for s_tblsale

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblsale_ClusteredIndex-receptionno')
DROP INDEX [s_tblsale_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsale] WITH ( ONLINE = OFF )


-- indexes for s_tblsale_err

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblsale_err_ClusteredIndex-receptionno')
DROP INDEX [s_tblsale_err_ClusteredIndex-receptionno] ON [dqm].[s_tblsale_err] WITH ( ONLINE = OFF )



-- indexes for s_tblsaleacct

IF EXISTS (SELECT name FROM sysindexes WHERE name = 's_tblsaleacct_ClusteredIndex-receptionno')
DROP INDEX [s_tblsaleacct_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsaleacct] WITH ( ONLINE = OFF )


-- indexes for s_tbnsaleinventory

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbnsaleinventory_ClusteredIndex-receptionno')
DROP INDEX [IX_s_tbnsaleinventory_ClusteredIndex-receptionno] ON [asr_staging].[s_tbnsaleinventory] WITH ( ONLINE = OFF )

-- indexes for s_tbnsaleinventorydetail

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tbnsaleinventorydetail_ClusteredIndex-receptionno')
DROP INDEX [IX_s_tbnsaleinventorydetail_ClusteredIndex-receptionno] ON [asr_staging].[s_tbnsaleinventorydetail] WITH ( ONLINE = OFF )

-- indexes for s_tblsubaccount

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tblsubaccount_ClusteredIndex-accountno')
DROP INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount] WITH ( ONLINE = OFF )

-- indexes for s_tsgnvalue

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_s_tsgnvalue_ClusteredIndex-accountno')
DROP INDEX [IX_s_tsgnvalue_ClusteredIndex-accountno] ON [asr_staging].[s_tsgnvalue] WITH ( ONLINE = OFF )


end




