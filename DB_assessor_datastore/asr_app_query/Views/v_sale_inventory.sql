CREATE VIEW asr_app_query.v_sale_inventory
AS
SELECT        si.recording_no, si.account_no, si.inventory_effective_date, si.adjusted_sale_price, si.time_adjusted_sale_price, si.account_type, si.land_economic_area, si.land_economic_area_description, si.property_type, 
                         si.improvement_condition_type, si.improvement_quality, si.improvement_abstract_code, si.improvement_abstract_code_description, si.built_as_description, si.built_as_year_built, si.physical_age, 
                         si.adjusted_year_built, si.effective_age, si.improvement_exterior, si.class_code, si.class_code_description, si.improvement_count, si.built_as_total_unit_count, si.room_count, si.bedroom_count, si.bath_count, 
                         si.total_improvement_square_footage, si.residential_square_footage, si.commercial_square_footage, si.outbuilding_square_footage, si.improvement_built_as_other, si.land_net_square_footage, 
                         si.multiple_use_flag, si.land_type, si.land_abstract_code, si.land_abstract_code_description, si.zoning_code, si.zoning_code_description, si.platted_flag, si.land_net_acre_count, si.hvac_type, 
                         si.improvement_unit_type, si.improvement_interior, si.roof_cover, si.roof_type, si.neighborhood_code_1, si.neighborhood_code_2, si.neighborhood_extension_1, si.neighborhood_extension_2, 
                         si.outbuilding_count, si.floor_cover, si.occupancy_code_description_1, si.occupancy_code_description_2, si.total_finished_square_footage, si.total_unfinished_square_footage, si.create_datetime, 
                         si.create_user_id, si.update_datetime, si.update_user_id, si.rowhash
FROM            asr_datastore.sale_inventory AS si INNER JOIN
                         asr_datastore.account AS a ON si.account_no = a.account_no AND a.account_status = 'A'

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "si"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 341
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 379
               Bottom = 136
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
', @level0type = N'SCHEMA', @level0name = N'asr_app_query', @level1type = N'VIEW', @level1name = N'v_sale_inventory';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'asr_app_query', @level1type = N'VIEW', @level1name = N'v_sale_inventory';

