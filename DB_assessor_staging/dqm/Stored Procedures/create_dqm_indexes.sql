



CREATE procedure [dqm].[create_dqm_indexes]
as
begin

-- indexes for s_tblacct

CREATE CLUSTERED INDEX [IX_s_tblacct_ClusteredIndex-accountno] ON [asr_staging].[s_tblacct]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 


-- indexes for s_tblacctpropertyaddress


CREATE CLUSTERED INDEX [IX_s_tblacctpropertyaddress_accountno] ON [asr_staging].[s_tblacctpropertyaddress]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tbladdresssecure


CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESS2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-CITY] ON [asr_staging].[s_tbladdresssecure]
(
	[CITY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE] ON [asr_staging].[s_tbladdresssecure]
(
	[STATECODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE] ON [asr_staging].[s_tbladdresssecure]
(
	[ZIPCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


CREATE NONCLUSTERED INDEX [ix_tbladdresssecure] ON [asr_staging].[s_tbladdresssecure]
(
	[ADDRESSCODE] ASC,
	[PERSONCODE] ASC
)
INCLUDE ( 	[ADDRESS1],
	[ADDRESS2],
	[CITY],
	[STATECODE],
	[ZIPCODE],
	[COUNTRY]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimps

CREATE CLUSTERED INDEX [s_tblimps_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimps]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimpsbltas

CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_ACCOUNTNO] ON [asr_staging].[s_tblimpsbltas]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

CREATE NONCLUSTERED INDEX [IX_s_tblimpsbltas_IMPNO] ON [asr_staging].[s_tblimpsbltas]
(
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimpsdetail

CREATE CLUSTERED INDEX [s_tblimpsdetail_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsdetail]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblimpsocc

CREATE CLUSTERED INDEX [s_tblimpsocc_ClusteredIndex-accountno_impno] ON [asr_staging].[s_tblimpsocc]
(
	[ACCOUNTNO] ASC,
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

CREATE NONCLUSTERED INDEX [IX_s_tblimpsocc_impno] ON [asr_staging].[s_tblimpsocc]
(
	[IMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


-- indexes for s_tbllandabstract

CREATE CLUSTERED INDEX [s_tbllandabstract_ClusteredIndex-accountno] ON [asr_staging].[s_tbllandabstract]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

-- indexes for s_tbllandattribute

CREATE CLUSTERED INDEX [s_tbllandattribute_ClusteredIndex-accountno] ON [asr_staging].[s_tbllandattribute]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

-- indexes for s_tblpersecure

CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2] ON [asr_staging].[s_tblpersonsecure]
(
	[NAME2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


CREATE NONCLUSTERED INDEX [ix_tblpersonsecure] ON [asr_staging].[s_tblpersonsecure]
(
	[PERSONCODE] ASC
)
INCLUDE ( 	[NAME1],
	[NAME2],
	[FEDERALIDNO]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblsale

CREATE CLUSTERED INDEX [s_tblsale_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsale]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)



-- indexes for s_tblsale_err

CREATE CLUSTERED INDEX [s_tblsale_err_ClusteredIndex-receptionno] ON [dqm].[s_tblsale_err]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)




-- indexes for s_tblsaleacct

CREATE CLUSTERED INDEX [s_tblsaleacct_ClusteredIndex-receptionno] ON [asr_staging].[s_tblsaleacct]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

-- indexes for s_tbnsaleinventory

CREATE CLUSTERED INDEX [IX_s_tbnsaleinventory_ClusteredIndex-receptionno] ON [asr_staging].[s_tbnsaleinventory]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

-- indexes for s_tbnsaleinventorydetail

CREATE CLUSTERED INDEX [IX_s_tbnsaleinventorydetail_ClusteredIndex-receptionno] ON [asr_staging].[s_tbnsaleinventorydetail]
(
	[RECEPTIONNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

-- indexes for s_tblsubaccount


CREATE CLUSTERED INDEX [IX_s_tblsubaccount_ClusteredIndex-accountno] ON [asr_staging].[s_tblsubaccount]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 


-- indexes for s_tsgnvalue


CREATE CLUSTERED INDEX [IX_s_tsgnvalue_ClusteredIndex-accountno] ON [asr_staging].[s_tsgnvalue]
(
	[ACCOUNTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 

end





