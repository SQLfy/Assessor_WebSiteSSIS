

CREATE procedure [asr_staging].[select_count_dqm_err_tables]
as
begin

select count(*) from dqm.s_tblacct_err;
select count(*) from dqm.s_tblacctnbhd_err;
select count(*) from dqm.s_tblacctowneraddress_err;
select count(*) from dqm.s_tblacctpropertyaddress_err;
select count(*) from dqm.s_tblacctreal_err;
select count(*) from dqm.s_tbladdresssecure_err;
select count(*) from dqm.s_tblimps_err;
select count(*) from dqm.s_tblimpsbltas_err;
select count(*) from dqm.s_tblimpsdetail_err;
select count(*) from dqm.s_tblimpsocc_err;
select count(*) from dqm.s_tblpersonsecure_err;
select count(*) from dqm.s_tblsale_err;
select count(*) from dqm.s_tblsaleacct_err;
select count(*) from dqm.s_tblsubaccount_err;
select count(*) from dqm.s_tbnsubfiling_err;
select count(*) from dqm.s_tlkpabstractcode_err;
select count(*) from dqm.s_tlkpimpsaddons_err;
select count(*) from dqm.s_tlkpimpsocctype_err;
select count(*) from dqm.s_tlkpleatype_err;
select count(*) from dqm.s_tmaptaxauthoritydetailfund_err;
select count(*) from dqm.s_tmaptaxdistrictauthority_err;

end;


