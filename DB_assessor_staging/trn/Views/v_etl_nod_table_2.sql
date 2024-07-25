/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW trn.v_etl_nod_table_2
AS
SELECT        HEADER, AGENT_FLAG AS agent_flag, REVIEWNUMBER AS review_number, TAXYEAR AS tax_year, ACCOUNTNO AS account_no, SUBLOT AS sub_lot, SUBBLOCK AS sub_block, DESC1 AS desc_1, 
                         DESC2 AS desc_2, DESC3 AS desc_3, DESC4 AS desc_4, [A/D], PRIORVALUE1 AS prior_value_1, PRIORVALUE2 AS prior_value_2, PRIORVALUE3 AS prior_value_3, PRIORVALUE4 AS prior_value_4, 
                         CURRENTVALUE1 AS current_value_1, CURRENTVALUE2 AS current_value_2, CURRENTVALUE3 AS current_value_3, CURRENTVALUE4 AS current_value_4, PETVALUETOTAL AS pet_value_total, 
                         PRIORVALUETOTAL AS prior_value_total, CURRENTVALUETOTAL AS current_value_total, APPEALACCTADJUSTDENYREASON AS appeal_acct_adjust_deny_reason, 
                         APPEALACCTREASONDESC AS appeal_acct_reason_desc, SUBNAME AS sub_name, FILINGNO AS filing_no, GETDATE() AS create_datetime, SUSER_NAME() AS create_user_id
FROM            asr_staging.s_nodtable2

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
         Begin Table = "s_nodtable2 (asr_staging)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 316
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_nod_table_2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_nod_table_2';

