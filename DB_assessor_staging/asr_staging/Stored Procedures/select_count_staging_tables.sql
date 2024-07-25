
CREATE procedure [asr_staging].[select_count_staging_tables]
as
begin

select count(*) from asr_staging.s_account_location;

select count(*) from asr_staging.s_tblacct;
select count(*) from asr_staging.s_tblacctlegal;
select count(*) from asr_staging.s_tblacctlegallocation;
select count(*) from asr_staging.s_tblacctnbhd;
select count(*) from asr_staging.s_tblacctowneraddress;
select count(*) from asr_staging.s_tblacctpropertyaddress;
select count(*) from asr_staging.s_tblacctreal;
select count(*) from asr_staging.s_tbladdresssecure;
select count(*) from asr_staging.s_tblimps;
select count(*) from asr_staging.s_tblimpsbltas;
select count(*) from asr_staging.s_tblimpsdetail;
select count(*) from asr_staging.s_tblimpsocc;
select count(*) from asr_staging.s_tbllandabstract;
select count(*) from asr_staging.s_tblpersonsecure;
select count(*) from asr_staging.s_tblsale;
select count(*) from asr_staging.s_tblsaleacct;
select count(*) from asr_staging.s_tblsubaccount;

select count(*) from asr_staging.s_tbnsubdivision;
select count(*) from asr_staging.s_tbnsubfiling;
select count(*) from asr_staging.s_tlkpabstractcode;
select count(*) from asr_staging.s_tlkpaccttype;
select count(*) from asr_staging.s_tlkpdeedtype;
select count(*) from asr_staging.s_tlkpimpsaddons;
select count(*) from asr_staging.s_tlkpimpsbltastype;
select count(*) from asr_staging.s_tlkpimpscomclasstype;
select count(*) from asr_staging.s_tlkpimpsocctype;
select count(*) from asr_staging.s_tlkpleatype;
select count(*) from asr_staging.s_tlkpsaleexclude;
select count(*) from asr_staging.s_tlkpstatusacct;
select count(*) from asr_staging.s_tlkptaxauthority;
select count(*) from asr_staging.s_tlkptaxauthoritydetail;
select count(*) from asr_staging.s_tlkptaxdistrict;
select count(*) from asr_staging.s_tlkptaxfund;
select count(*) from asr_staging.s_tlkpzoning;

select count(*) from asr_staging.s_tmaptaxauthoritydetailfund;
select count(*) from asr_staging.s_tmaptaxdistrictauthority;
select count(*) from asr_staging.s_tsylevytype;

select count(*) from asr_staging.s_tblacctparentparcel;
select count(*) from asr_staging.s_tsgvacctabstvalue;




end;

