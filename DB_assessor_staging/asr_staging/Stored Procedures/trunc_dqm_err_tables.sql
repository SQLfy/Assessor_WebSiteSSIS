

CREATE procedure [asr_staging].[trunc_dqm_err_tables]
as
begin

truncate table dqm.s_tblacct_err;
truncate table dqm.s_tblacctnbhd_err;
truncate table dqm.s_tblacctowneraddress_err;
truncate table dqm.s_tblacctpropertyaddress_err;
truncate table dqm.s_tblacctreal_err;
truncate table dqm.s_tbllandattribute_err;
truncate table dqm.s_tbladdresssecure_err;
truncate table dqm.s_tblimps_err;
truncate table dqm.s_tblimpsbltas_err;
truncate table dqm.s_tblimpsdetail_err;
truncate table dqm.s_tblimpsocc_err;
truncate table dqm.s_tblpersonsecure_err;
truncate table dqm.s_tblsale_err;
truncate table dqm.s_tblsaleacct_err;
truncate table dqm.s_tbnsaleinventory_err;
truncate table dqm.s_tbnsaleinventorydetail_err;
truncate table dqm.s_tblsubaccount_err;
truncate table dqm.s_tbnsubfiling_err;
truncate table dqm.s_tlkpabstractcode_err;
truncate table dqm.s_tlkpimpsaddons_err;
truncate table dqm.s_tlkpimpsocctype_err;
truncate table dqm.s_tlkpleatype_err;
truncate table dqm.s_tmaptaxauthoritydetailfund_err;
truncate table dqm.s_tmaptaxdistrictauthority_err;
truncate table dqm.s_tsgnvalue_err;

truncate table dqm.s_tblacctpp_err;
truncate table dqm.s_tblacctppdetail_err;
truncate table dqm.s_tlkpbusinesstype_err;





end



