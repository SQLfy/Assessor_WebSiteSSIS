



CREATE VIEW [asr_app_query].[v_improvement_built_as]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      3/2/2016
Developer:     Christine Lin
Comments:      Initial creation
               List details for updating the improvement built as table
*************************************************************************************/
/**************************************************************************************
Mod #:  2
Mod Date:      8/22/2016
Developer:     Richard Edwards
Comments:      Add built_as_length, built_as_width, built_as_height, mobile_home_make, mobile_home_model_type, 
                   mobile_home_skirt, mobile_home_skirt_linear_feet, mobile_home_wall_type columns
*************************************************************************************/

AS
SELECT        iba.account_no, iba.improvement_no, iba.built_as_detail_id, iba.built_as_code, iba.built_as_code_description, iba.hvac_percent, iba.exterior_construction_type, iba.interior_finish_type, iba.no_of_story, 
                         iba.typical_story_height, iba.roof_construction_type, iba.roof_material_type, iba.floor_material_type, iba.room_count, iba.bedroom_count, iba.total_unit_count, iba.class_code, iba.class_code_description, 
                         iba.built_year, iba.remodeled_year, iba.remodeled_percent, iba.effective_age, iba.built_as_sf, iba.sprinkler_coverage_sf, iba.bathroom_count, iba.heat_type, iba.create_datetime, iba.create_user_id, 
                         iba.update_datetime, iba.update_user_id, iba.rowhash, iba.primary_flag, iba.built_as_length, iba.built_as_width, iba.built_as_height, 
						 iba.mobile_home_make, iba.mobile_home_model_type, iba.mobile_home_skirt, iba.mobile_home_skirt_linear_feet,
						 iba.mobile_home_wall_type
FROM            asr_datastore.improvement_built_as AS iba INNER JOIN
                         asr_datastore.account AS a ON iba.account_no = a.account_no AND a.account_status = 'A'





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
         Begin Table = "iba"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 304
               Bottom = 136
               Right = 536
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
', @level0type = N'SCHEMA', @level0name = N'asr_app_query', @level1type = N'VIEW', @level1name = N'v_improvement_built_as';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'asr_app_query', @level1type = N'VIEW', @level1name = N'v_improvement_built_as';

