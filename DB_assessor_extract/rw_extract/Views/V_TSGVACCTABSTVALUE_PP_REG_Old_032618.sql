




CREATE VIEW [rw_extract].[V_TSGVACCTABSTVALUE_PP_REG_Old_032618]
AS
SELECT     T1.VERSTART, T1.VEREND, T1.ACCOUNTNO, T1.ABSTRACTCODE, T1.TAXDISTRICT, T1.TAXYEAR, T1.ACTUALVALUE, T1.RAWASSESSEDVALUE, T1.NEWCONSTVALUECHANGE, T1.NEWCONSTVALUECHANGEASSESSED, T1.JURISDICTIONID, 
                  CAST(T1.WRITEDATE AS VARCHAR(22)) AS WRITEDATE, T1.SEQID, MILL.MILLLEVY
FROM        PRRW.ENCOMPASS.TSGVACCTABSTVALUE AS T1 INNER JOIN
                      (SELECT     DA.TAXDISTRICT, AF.TAXYEAR, SUM(AF.ASSESSEDMILLLEVY) AS MILLLEVY
                       FROM        PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY AS DA INNER JOIN
                                         PRRW.ENCOMPASS.TMAPTAXAUTHORITYDETAILFUND AS AF ON DA.TAXAUTHORITY = AF.TAXAUTHORITY AND DA.TAXYEAR = AF.TAXYEAR
                       WHERE     (DA.TAXDISTRICT <> '9999')
                       GROUP BY DA.TAXDISTRICT, AF.TAXYEAR) AS MILL ON T1.TAXDISTRICT = MILL.TAXDISTRICT AND T1.TAXYEAR = MILL.TAXYEAR INNER JOIN
                      (SELECT     CAST(PARAMETER_VALUE AS NUMERIC(11, 0)) AS regular_verstart
                       FROM        rw_extract.etl_parameter
                       WHERE     (PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE')) AS P1 ON T1.VERSTART <= P1.regular_verstart INNER JOIN
                      (SELECT     CAST(PARAMETER_VALUE AS NUMERIC(11, 0)) AS regular_verend
                       FROM        rw_extract.etl_parameter AS etl_parameter_2
                       WHERE     (PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE')) AS P2 ON T1.VEREND > P2.regular_verend INNER JOIN
                      (SELECT     CAST(PARAMETER_VALUE AS NUMERIC(4, 0)) AS regular_taxyear
                       FROM        rw_extract.etl_parameter AS etl_parameter_1
                       WHERE     (PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR')) AS P3 ON T1.TAXYEAR = P3.regular_taxyear
WHERE     (T1.ACCOUNTNO LIKE 'P%')




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
         Begin Table = "T1"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 395
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MILL"
            Begin Extent = 
               Top = 7
               Left = 443
               Bottom = 148
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P1"
            Begin Extent = 
               Top = 7
               Left = 685
               Bottom = 104
               Right = 882
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P2"
            Begin Extent = 
               Top = 7
               Left = 930
               Bottom = 104
               Right = 1124
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P3"
            Begin Extent = 
               Top = 7
               Left = 1172
               Bottom = 104
               Right = 1368
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         O', @level0type = N'SCHEMA', @level0name = N'rw_extract', @level1type = N'VIEW', @level1name = N'V_TSGVACCTABSTVALUE_PP_REG_Old_032618';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'utput = 720
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
End
', @level0type = N'SCHEMA', @level0name = N'rw_extract', @level1type = N'VIEW', @level1name = N'V_TSGVACCTABSTVALUE_PP_REG_Old_032618';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'rw_extract', @level1type = N'VIEW', @level1name = N'V_TSGVACCTABSTVALUE_PP_REG_Old_032618';

