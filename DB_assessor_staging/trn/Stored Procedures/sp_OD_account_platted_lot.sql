





-- ======================================================================
-- Author:		David Guillen
-- Create date: 09/08/2017
-- Description:	transformation for account platted lot for Assessor Open Data
-- ======================================================================

CREATE PROCEDURE [trn].[sp_OD_account_platted_lot]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [assessor_datastore].[asr_datastore].[OD_account_platted_lot]
   (
   ACCOUNT_NO, SUB_FILING_RECORDING_NO, PLATTED_LOT_EID
   )
	select 
	a.account_no,
	qsa.subno, 
	(select platted_lot_eid from assessor_datastore.asr_datastore.OD_platted_lot where state_parcel_no = a.state_parcel_no and   lot_no = isnull(qsa.lot, '')  and block_no = isnull(qsa.block, '') and tract_no = isnull(qsa.tract, '') ) platted_lot_eid
	from assessor_datastore.asr_datastore.account a, assessor_staging.dqm.q_tblsubaccount qsa
	where a.account_no = qsa.accountno
	and a.state_parcel_no is not null



END




