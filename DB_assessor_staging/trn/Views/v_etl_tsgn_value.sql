

CREATE VIEW [trn].[v_etl_tsgn_value]
WITH SCHEMABINDING 
AS
SELECT        tv.ACCOUNTNO AS account_no, ac.ACCTTYPE AS account_type, tv.TAXYEAR AS tax_year, tv.VALUEGROUPCODE AS value_group_code, tv.TAXDISTRICT AS tax_district_no, tv.RAWASSESSEDVALUE AS raw_assessed_value, 
                         tv.RAWTAXDOLLARS AS raw_tax_dollars, tv.ACTUALVALUE AS actual_value, tv.MILLLEVY AS mill_levy, v.create_datetime AS create_datetime, v.create_user_id AS create_user_id, HASHBYTES('SHA2_256', 
                         ISNULL(RTRIM(tv.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(ac.ACCTTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(tv.TAXYEAR), 'DBNULL_TEXT') + ISNULL(RTRIM(tv.VALUEGROUPCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(tv.TAXDISTRICT), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(tv.RAWASSESSEDVALUE), 'DBNULL_TEXT') + ISNULL(RTRIM(tv.RAWTAXDOLLARS), 'DBNULL_TEXT') + ISNULL(RTRIM(tv.ACTUALVALUE), 'DBNULL_TEXT') + ISNULL(RTRIM(tv.MILLLEVY), 
                         'DBNULL_TEXT')) AS rowhash
FROM            asr_staging.s_tsgnvalue AS tv LEFT JOIN
                [asr_staging].[s_tblacct] ac ON tv.ACCOUNTNO = ac.ACCOUNTNO INNER JOIN
                dqm.valid_account AS v ON tv.ACCOUNTNO = v.account_no



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
         Begin Table = "tv"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 321
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 359
               Bottom = 119
               Right = 532
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
      Begin ColumnWidths = 12
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_tsgn_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_tsgn_value';

