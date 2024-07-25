


CREATE procedure [dqm].[RUN_ALL_DQM_UNIT_TESTS]
as
begin

execute [dqm].[dqm_s_tblacct_unit_test]
execute [dqm].[dqm_s_tblacctnbhd_unit_test]
execute [dqm].[dqm_s_tblacctowneraddress_unit_test]
execute [dqm].[dqm_s_tblacctpropertyaddress_unit_test]
execute [dqm].[dqm_s_tblacctreal_unit_test]
execute [dqm].[dqm_s_tbladdresssecure_unit_test]
execute [dqm].[dqm_s_tblimps_unit_test]
execute [dqm].[dqm_s_tblimpsbltas_unit_test]
execute [dqm].[dqm_s_tblimpsdetail_unit_test]
execute [dqm].[dqm_s_tblimpsocc_unit_test]
execute [dqm].[dqm_s_tblpersonsecure_unit_test]
execute [dqm].[dqm_s_tblsale_unit_test]
execute [dqm].[dqm_s_tblsaleacct_unit_test]
execute [dqm].[dqm_s_tblsubaccount_unit_test]
execute [dqm].[dqm_s_tbnsubfiling_unit_test]
execute [dqm].[dqm_s_tlkpabstractcode_unit_test]
execute [dqm].[dqm_s_tlkpimpsocctype_unit_test]
execute [dqm].[dqm_s_tlkpleatype_unit_test]
execute [dqm].[dqm_s_tmaptaxauthoritydetailfund_unit_test]
execute [dqm].[dqm_s_tmaptaxdistrictauthority_unit_test]

end;



