CREATE VIEW trn.[v_etl_tsgn_value_from_tsgvacctabstvalue_old]
AS
SELECT     AV.VERSTART, AV.VEREND, AV.ACCOUNTNO AS account_no, ac.ACCTTYPE AS account_type, AV.TAXYEAR AS tax_year, AV.ABSTRACTCODE AS valuation_class_code, AV.TAXDISTRICT AS tax_district_no, SUM(AV.RAWASSESSEDVALUE) AS raw_assessed_value, 
                  CAST(ROUND(ISNULL(AV.MILLLEVY / 1000 * SUM(AV.RAWASSESSEDVALUE), 0), 2) AS numeric(38, 2)) AS raw_tax_dollars, SUM(AV.ACTUALVALUE) AS actual_value, AV.MILLLEVY AS mill_levy, ISNULL(SUM(la.LANDACRES), 0) AS net_acres, v.create_datetime, 
                  v.create_user_id, HASHBYTES('SHA2_256', ISNULL(RTRIM(AV.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(ac.ACCTTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(AV.TAXYEAR), 'DBNULL_TEXT') + ISNULL(RTRIM(AV.ABSTRACTCODE), 'DBNULL_TEXT') 
                  + ISNULL(RTRIM(AV.TAXDISTRICT), 'DBNULL_TEXT') + ISNULL(RTRIM(SUM(AV.RAWASSESSEDVALUE)), 'DBNULL_TEXT') + ISNULL(RTRIM(ROUND(ISNULL(AV.MILLLEVY / 1000 * SUM(AV.RAWASSESSEDVALUE), 0), 2)), 'DBNULL_TEXT') 
                  + ISNULL(RTRIM(SUM(AV.ACTUALVALUE)), 'DBNULL_TEXT') + ISNULL(RTRIM(AV.MILLLEVY), 'DBNULL_TEXT') + ISNULL(RTRIM(SUM(la.LANDACRES)), 'DBNULL_TEXT')) AS rowhash
FROM        asr_staging.s_tsgvacctabstvalue AS AV LEFT OUTER JOIN
                  asr_staging.s_tblacct AS ac ON AV.ACCOUNTNO = ac.ACCOUNTNO INNER JOIN
                  dqm.valid_account AS v ON AV.ACCOUNTNO = v.account_no INNER JOIN
                  asr_staging.s_tlkpabstractcode AS ABSTC ON AV.ABSTRACTCODE = ABSTC.ABSTRACTCODE LEFT OUTER JOIN
                  asr_staging.s_tbllandabstract AS la ON AV.ACCOUNTNO = la.ACCOUNTNO AND AV.ABSTRACTCODE = la.ABSTRACTCODE
WHERE     (1 = 1) AND (AV.VERSTART <= 20170420000) AND (AV.VEREND > 20170420000)
GROUP BY AV.VERSTART, AV.VEREND, AV.ACCOUNTNO, ac.ACCTTYPE, AV.ABSTRACTCODE, AV.TAXYEAR, AV.TAXDISTRICT, AV.MILLLEVY, v.create_datetime, v.create_user_id

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
         Begin Table = "AV"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ac"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 359
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 484
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ABSTC"
            Begin Extent = 
               Top = 490
               Left = 48
               Bottom = 653
               Right = 399
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "la"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 347
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
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
En', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_tsgn_value_from_tsgvacctabstvalue_old';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'd
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_tsgn_value_from_tsgvacctabstvalue_old';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_tsgn_value_from_tsgvacctabstvalue_old';

