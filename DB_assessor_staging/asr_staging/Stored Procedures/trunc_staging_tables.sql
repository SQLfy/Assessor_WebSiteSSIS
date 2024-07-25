
CREATE procedure [asr_staging].[trunc_staging_tables]
as
begin

truncate table asr_staging.s_account_location;

truncate table asr_staging.s_tblacct;
truncate table asr_staging.s_tblacctlegal;
truncate table asr_staging.s_tblacctlegallocation;
truncate table asr_staging.s_tblacctnbhd;
truncate table asr_staging.s_tblacctowneraddress;
truncate table asr_staging.s_tblacctpropertyaddress;
truncate table asr_staging.s_tblacctreal;
truncate table asr_staging.s_tblacctwebnotes;

truncate table asr_staging.s_tbladdresssecure;
truncate table asr_staging.s_tblimps;
truncate table asr_staging.s_tblimpsbltas;
truncate table asr_staging.s_tblimpsdetail;
truncate table asr_staging.s_tblimpsocc;
truncate table asr_staging.s_tbllandabstract;
truncate table asr_staging.s_tbllandattribute;
truncate table asr_staging.s_tblpersonsecure;
truncate table asr_staging.s_tblsale;
truncate table asr_staging.s_tblsaleacct;
truncate table asr_staging.s_tblsubaccount;

truncate table asr_staging.s_tbnsubdivision;
truncate table asr_staging.s_tbnsubfiling;
truncate table asr_staging.s_tbnsaleinventory;
truncate table asr_staging.s_tbnsaleinventorydetail;
truncate table asr_staging.s_tsgnvalue;

truncate table asr_staging.s_tlkpabstractcode;
truncate table asr_staging.s_tlkpabstractcodevalue;
truncate table asr_staging.s_tlkpabstractcodetype;
truncate table asr_staging.s_tlkpaccttype;
truncate table asr_staging.s_tlkpdeedtype;
truncate table asr_staging.s_tlkpimpsaddons;
truncate table asr_staging.s_tlkpimpsbltastype;
truncate table asr_staging.s_tlkpimpscomclasstype;
truncate table asr_staging.s_tlkpimpsocctype;
truncate table asr_staging.s_tlkpleatype;
truncate table asr_staging.s_tlkpsaleexclude;
truncate table asr_staging.s_tlkpstatusacct;
truncate table asr_staging.s_tlkptaxauthority;
truncate table asr_staging.s_tlkptaxauthoritydetail;
truncate table asr_staging.s_tlkptaxdistrict;
truncate table asr_staging.s_tlkptaxfund;
truncate table asr_staging.s_tlkpzoning;
truncate table asr_staging.s_tlkpvaluegroup;


truncate table asr_staging.s_tmaptaxauthoritydetailfund;
truncate table asr_staging.s_tmaptaxdistrictauthority;
truncate table asr_staging.s_tsylevytype;

truncate table asr_staging.s_tsgvacctabstvalue;
truncate table asr_staging.s_tsgvacctabstvalue_state_assessed;


truncate table asr_staging.s_tsgvacctabstvalue_npp_frz;
truncate table asr_staging.s_tsgvacctabstvalue_npp_reg;
truncate table asr_staging.s_tsgvacctabstvalue_pp_frz;
truncate table asr_staging.s_tsgvacctabstvalue_pp_reg;
truncate table asr_staging.s_account_valuation;

truncate table asr_staging.s_tblacctparentparcel;

truncate table w_verified_account
truncate table w_defective_account
truncate table w_published_account
truncate table valuation_class_code

truncate table asr_staging.s_realnov

truncate table asr_staging.s_tblacctpp
truncate table asr_staging.s_tblacctppdetail
truncate table asr_staging.s_tblacctnewconstruction
truncate table asr_staging.s_tlkpbusinesstype
truncate table asr_staging.s_tlkpppogdescriptiontype
truncate table asr_staging.s_tlkpppogtype

truncate table asr_staging.s_tblappealacct
truncate table asr_staging.s_tblappeal

truncate table asr_staging.s_ppnov

-- Assessor tables used in the PBI Property Report
truncate table [asr_staging].[s_RESMODELANALYSISDATA];
truncate table [asr_staging].[s_RESMODELSALES];
truncate table [asr_staging].[s_TBLMLSHISTORY];


end


