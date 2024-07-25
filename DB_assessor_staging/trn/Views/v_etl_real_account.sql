/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW trn.v_etl_real_account
AS
SELECT        s.ACCOUNTNO AS account_no, CAST(dbo.get_building_count(s.ACCOUNTNO) AS varchar(10)) AS NO_OF_BUILDINGS, s.VACANTFLAG AS vacant_flag, s.IMPONLYFLAG AS improvement_only_flag, 
                         s.TIFFLAG AS tif_flag, s.ZONINGCODE AS zoning_code, zc.ZONINGDESCRIPTION AS zoning_code_description, s.PLATTEDFLAG AS platted_flag, s.DEFAULTLEA AS default_lea, 
                         l.LEADESCRIPTION AS default_lea_description, s.TOTALACCTIMPINTERESTPCT AS total_improvement_interest_percent, s.TOTALACCTLANDINTERESTPCT AS total_land_interest_percent, GETDATE() 
                         AS create_datetime, SUSER_NAME() AS create_user_id, HASHBYTES('SHA2_256', ISNULL(RTRIM(s.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(s.VACANTFLAG), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(s.IMPONLYFLAG), 'DBNULL_TEXT') + ISNULL(RTRIM(s.TIFFLAG), 'DBNULL_TEXT') + ISNULL(RTRIM(s.ZONINGCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(zc.ZONINGDESCRIPTION), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(s.PLATTEDFLAG), 'DBNULL_TEXT') + ISNULL(RTRIM(s.DEFAULTLEA), 'DBNULL_TEXT') + ISNULL(RTRIM(l.LEADESCRIPTION), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(s.TOTALACCTIMPINTERESTPCT), 'DBNULL_TEXT') + ISNULL(RTRIM(s.TOTALACCTLANDINTERESTPCT), 'DBNULL_TEXT')) AS rowhash
FROM            dqm.q_tblacctreal AS s LEFT OUTER JOIN
                         asr_staging.s_tlkpzoning AS zc ON s.ZONINGCODE = zc.ZONINGCODE LEFT OUTER JOIN
                         dqm.q_tlkpleatype AS l ON s.DEFAULTLEA = l.LEA INNER JOIN
                         dqm.valid_account AS v ON s.ACCOUNTNO = v.account_no

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
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 299
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "zc"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 138
               Left = 283
               Bottom = 268
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 383
               Right = 211
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
         Width = 2295
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_real_account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_real_account';

