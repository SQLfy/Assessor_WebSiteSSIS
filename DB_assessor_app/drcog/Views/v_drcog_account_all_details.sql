





CREATE VIEW [drcog].[v_drcog_account_all_details]
AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT a.account_no
      ,a.state_parcel_no
	  ,lav.total_land_value
	  ,v.imp_value
	  ,sda.max_sale_date
	  ,sda.total_sale_price
	  ,isnull(iba.units,0) units
  FROM assessor_app.drcog.v_drcog_account a
  LEFT OUTER JOIN assessor_app.drcog.v_drcog_improvement_built_as iba on iba.account_no = a.account_no
  LEFT OUTER JOIN assessor_app.drcog.v_drcog_sale_data_by_account sda on sda.account_no = a.account_no
  LEFT OUTER JOIN assessor_app.drcog.v_drcog_value v on v.account_no = a.account_no
  LEFT OUTER JOIN drcog.v_drcog_land_abstract_value lav on lav.account_no = a.account_no
--WHERE ACCOUNT_NO = 'R0000799'








