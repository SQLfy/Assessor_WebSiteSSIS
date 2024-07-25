

/*
-- 
*/

CREATE VIEW [dqm].[bad_account]
WITH SCHEMABINDING
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/27/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all accountnos from all *_err tables that have an accountno column
Mod #:  2
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      added tables for parcel details
*************************************************************************************/
AS
SELECT DISTINCT accountno
FROM (	
		SELECT accountno FROM [dqm].[s_tblacct_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblacctnbhd_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblacctowneraddress_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblacctpropertyaddress_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblsubaccount_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimps_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimpsbltas_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimpsdetail_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblimpsocc_err]
		UNION ALL
		SELECT accountno FROM [dqm].[s_tblsaleacct_err]
      ) l





