
CREATE VIEW [asr_adv_search_query].[v_flat_account]
AS
 /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     6/24/2020
Developer:    David Guillen
Comments:     Add default_lea, neighborhood_code, neighborhood_extension

*************************************************************************************/
SELECT        a.account_no, a.state_parcel_no, a.tax_district_no, a.sub_filing_recording_no, a.account_type, a.appraisal_type, a.account_status, a.account_status_description, a.legal_description, a.longitude_x, a.latitude_y, a.location, 
                         a.create_datetime, a.create_user_id, a.update_datetime, a.update_user_id, a.rowhash, a.elevation_z, a.bldg_permit_auth_id, a.qtr AS quarter, a.section, a.township, a.range, oa.owner_name AS primary_owner_name, 
                         oa.full_address AS primary_owner_address, aoa.address_line_1 as owner_address_line_1, aoa.address_line_2 as owner_address_line_2
						,aoa.city_name as owner_city_name ,aoa.state as owner_state ,aoa.zip_code as owner_zip_code ,aoa.country as owner_country,
						 av.actual_value_sum, av.assessed_value_sum, av.net_acres_sum, f.subdivision_name, f.subdivision_no, f.filing_no, f.filing_description, addr.primary_property_unit_no, addr.primary_property_address_number, 
                         addr.primary_property_address_number_suffix, addr.primary_property_pre_direction_code, addr.primary_property_street_name, addr.primary_property_street_type_code, addr.primary_property_post_direction_code, 
                         addr.primary_property_city, addr.primary_property_zip_code, apl.LOT AS lot, apl.TRACT AS tract, apl.BLOCK AS block, sa.recording_nos, t .tax_authority_nos, la.land_attributes,
						 ra.default_lea
					     ,an.neighborhood_code ,an.neighborhood_extension
FROM            asr_datastore.account a LEFT OUTER JOIN
                             (/*include primary owners that are not marked as private*/ SELECT account_no, owner_name, STUFF(CONCAT(' ' + address_line_1, ' ' + address_line_2, ' ' + city_name, ' ' + state, ' ' + zip_code, ' ' + country), 1, 1, '') 
                                                         AS full_address
                               FROM            asr_datastore.account_owner_address
                               WHERE        primary_owner_flag = 1 AND private_flag = 0) AS oa ON oa.account_no = a.account_no LEFT OUTER JOIN
                             (SELECT        account_no, SUM(actual_value) AS actual_value_sum, SUM(assessed_value) AS assessed_value_sum, SUM(net_acres) AS net_acres_sum
                               FROM            asr_datastore.account_valuation
                               GROUP BY account_no) AS av ON av.account_no = a.account_no LEFT OUTER JOIN
                             (/*sub filing information*/ SELECT sub_filing_recording_no, subdivision_no, subdivision_name, filing_no, filing_description
                               FROM            asr_datastore.sub_filing) AS f ON f.sub_filing_recording_no = a.sub_filing_recording_no LEFT OUTER JOIN
                             (/* account primary property address*/ SELECT account_no, unit_no AS primary_property_unit_no, address_number AS primary_property_address_number, 
                                                         address_number_suffix AS primary_property_address_number_suffix, pre_direction_code AS primary_property_pre_direction_code, street_name AS primary_property_street_name, 
                                                         street_type_code AS primary_property_street_type_code, post_direction_code AS primary_property_post_direction_code, city_name AS primary_property_city, 
                                                         location_zip_code AS primary_property_zip_code
                               FROM            asr_datastore.account_property_address
                               WHERE        primary_address_flag = 1) AS addr ON addr.account_no = a.account_no LEFT OUTER JOIN
                             (/* account platted lot*/ SELECT ACCOUNT_NO, PARCEL_NO, LOT, TRACT, BLOCK
                               FROM            asr_datastore.account_platted_lot) AS apl ON apl.ACCOUNT_NO = a.account_no AND apl.PARCEL_NO = a.state_parcel_no LEFT OUTER JOIN
                             (SELECT        account_no, recording_nos = STUFF
                                                             ((SELECT        ',' + recording_no
                                                                 FROM            asr_datastore.sale_account b
                                                                 WHERE        b.account_no = a.account_no FOR XML PATH('')), 1, 1, '')
                               FROM            asr_datastore.sale_account a
                               GROUP BY account_no) AS sa ON sa.account_no = a.account_no LEFT OUTER JOIN
                             (SELECT        tax_district_no, tax_authority_nos = STUFF
                                                             ((SELECT        ',' + b.tax_authority_no
                                                                 FROM            asr_datastore.tax_district_authority b
                                                                 WHERE        b.tax_district_no = a.tax_district_no FOR XML PATH('')), 1, 1, '')
                               FROM            asr_datastore.tax_district_authority a
                               GROUP BY tax_district_no) AS t ON a.tax_district_no = t .tax_district_no LEFT OUTER JOIN
                             (SELECT        account_no, land_attributes = STUFF
                                                             ((SELECT        ',' + concat(b.attribute_type, ' - ', b.attribute_subtype)
                                                                 FROM            asr_datastore.land_attribute b
                                                                 WHERE        b.account_no = a.account_no FOR XML PATH('')), 1, 1, '')
                               FROM            asr_datastore.land_attribute a
                               GROUP BY account_no) AS la ON la.account_no = a.account_no LEFT OUTER JOIN
							(select account_no, address_line_1 ,address_line_2 ,city_name ,state ,zip_code ,country
							FROM [asr_datastore].[account_owner_address] ) as aoa
							ON a.account_no = aoa.account_no           
							                                                               LEFT OUTER JOIN
							(select account_no, default_lea
							FROM [assessor_datastore].[asr_datastore].[real_account]) as ra
							ON a.account_no = ra.account_no
							                                                               LEFT OUTER JOIN
							(SELECT account_no, neighborhood_code ,neighborhood_extension
							FROM [assessor_datastore].[asr_datastore].[account_neighborhood]) as an
							ON a.account_no = an.account_no
WHERE        a.account_status = 'A';

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[3] 2[51] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'asr_adv_search_query', @level1type = N'VIEW', @level1name = N'v_flat_account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'asr_adv_search_query', @level1type = N'VIEW', @level1name = N'v_flat_account';

