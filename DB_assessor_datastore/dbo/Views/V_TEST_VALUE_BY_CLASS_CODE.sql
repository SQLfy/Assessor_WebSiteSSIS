﻿CREATE VIEW dbo.V_TEST_VALUE_BY_CLASS_CODE
AS
SELECT        TOP (10) asr_adv_search_query.v_summed_values_by_class_code.account_no AS asr_adv_search_query_v_summed_values_by_class_code_account_no, 
                         asr_adv_search_query.v_summed_values_by_class_code.valuation_class_code AS asr_adv_search_query_v_summed_values_by_class_code_valuation_class_code, 
                         asr_adv_search_query.v_summed_values_by_class_code.valuation_class_code_description AS asr_adv_search_query_v_summed_values_by_class_code_valuation_class_code_description, 
                         asr_adv_search_query.v_summed_values_by_class_code.actual_value AS asr_adv_search_query_v_summed_values_by_class_code_actual_value, 
                         asr_adv_search_query.v_summed_values_by_class_code.assessed_value AS asr_adv_search_query_v_summed_values_by_class_code_assessed_value, 
                         asr_adv_search_query.v_summed_values_by_class_code.net_acres AS asr_adv_search_query_v_summed_values_by_class_code_net_acres, 
                         anon_1.asr_adv_search_query_v_flat_account_account_no AS anon_1_asr_adv_search_query_v_flat_account_account_no
FROM            (SELECT        asr_adv_search_query.v_flat_account.account_no AS asr_adv_search_query_v_flat_account_account_no
                          FROM            asr_adv_search_query.v_flat_account LEFT OUTER JOIN
                                                    asr_adv_search_query.account_number ON asr_adv_search_query.v_flat_account.account_no = asr_adv_search_query.account_number.account_no
                          WHERE        (asr_adv_search_query.account_number.id BETWEEN 1 AND 25000)) AS anon_1 LEFT OUTER JOIN
                         asr_adv_search_query.v_summed_values_by_class_code ON anon_1.asr_adv_search_query_v_flat_account_account_no = asr_adv_search_query.v_summed_values_by_class_code.account_no
ORDER BY anon_1_asr_adv_search_query_v_flat_account_account_no

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
         Begin Table = "anon_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 85
               Right = 388
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_summed_values_by_class_code (asr_adv_search_query)"
            Begin Extent = 
               Top = 6
               Left = 426
               Bottom = 136
               Right = 689
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEST_VALUE_BY_CLASS_CODE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEST_VALUE_BY_CLASS_CODE';

