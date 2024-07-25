CREATE VIEW asr_adv_search_query.v_building_style
WITH SCHEMABINDING 
AS
SELECT        ba.account_no AS account_number, ba.improvement_no AS building_number, ba.built_as_code AS style_code, ba.built_as_code_description AS style_code_description, ba.hvac_percent, ba.exterior_construction_type, 
                         ba.interior_finish_type, ba.no_of_story AS number_of_stories, ba.typical_story_height, ba.roof_construction_type, ba.roof_material_type, ba.floor_material_type, ba.room_count, ba.bedroom_count, ba.total_unit_count, 
                         ba.class_code, ba.class_code_description, ba.built_year, ba.remodeled_year, ba.remodeled_percent, ba.effective_age, ba.built_as_sf, ba.sprinkler_coverage_sf, ba.bathroom_count, ba.heat_type, ba.primary_flag, 
                         ba.built_as_length, ba.built_as_width, ba.built_as_height, ba.mobile_home_make, ba.mobile_home_model_type, ba.mobile_home_skirt, ba.mobile_home_skirt_linear_feet, ba.mobile_home_wall_type
FROM            asr_datastore.improvement_built_as AS ba INNER JOIN
                         asr_datastore.account AS a ON ba.account_no = a.account_no AND a.account_status = 'A'

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filters the asr_datastore table to only active accounts by inner joining with v_building', @level0type = N'SCHEMA', @level0name = N'asr_adv_search_query', @level1type = N'VIEW', @level1name = N'v_building_style';


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
         Begin Table = "ba"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 286
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 324
               Bottom = 136
               Right = 556
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
      Begin ColumnWidths = 41
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
', @level0type = N'SCHEMA', @level0name = N'asr_adv_search_query', @level1type = N'VIEW', @level1name = N'v_building_style';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'         NewValue = 1170
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
', @level0type = N'SCHEMA', @level0name = N'asr_adv_search_query', @level1type = N'VIEW', @level1name = N'v_building_style';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'asr_adv_search_query', @level1type = N'VIEW', @level1name = N'v_building_style';

