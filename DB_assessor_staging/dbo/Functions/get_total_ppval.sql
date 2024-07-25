
-- =============================================
-- Author:		tony golden
-- Create date: 2/13/2017
-- Description:	get the total ppv for an account
-- =============================================

CREATE FUNCTION  [dbo].[get_total_ppval](@inAccountNo  VARCHAR(10)) 
  RETURNS NUMERIC(15,2)

AS
BEGIN
	DECLARE @lvTotalValue NUMERIC(15,2)


   SELECT @lvTotalValue = round(sum(isnull(ppabstractvalue,0)),15,2)
     FROM asr_staging.s_tblacctppdetail 
		where accountno = @inAccountNo 
		--where accountno = 'R123456789'


     RETURN @lvTotalValue

END
