USE [assessor_app]
GO

/****** Object:  View [asr_app].[v_freeze_parameters]    Script Date: 12/20/2016 10:51:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [asr_app].[v_freeze_parameters]
AS
SELECT        parameter_name, parameter_value
FROM            asr_app.etl_parameter
WHERE        (parameter_name LIKE '%FREEZE%')


GO
