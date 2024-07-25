CREATE VIEW trn.[v_etl_realnov_old]
AS
SELECT        ACCOUNTNO, TAXYEAR, PARCELNO, PROPADDRESS, LEGALDESCRIPTION1, LEGALDESCRIPTION2, LEGALDESCRIPTION3, NAME1, NAME2, PNAME1, PNAME2, OWNERADDRESS1, OWNERADDRESS2, 
                         OWNERCITY, OWNERSTATE, OWNERZIP, PROPCLASS1, PRIORVALUE1, CURRENTVALUE1, INCREASEDECREASE1, PROPCLASS2, PRIORVALUE2, CURRENTVALUE2, INCREASEDECREASE2, PROPCLASS3, 
                         PRIORVALUE3, CURRENTVALUE3, INCREASEDECREASE3, PROPCLASS4, PRIORVALUE4, CURRENTVALUE4, INCREASEDECREASE4, PROPCLASS5, PRIORVALUE5, CURRENTVALUE5, INCREASEDECREASE5, 
                         PROPCLASS6, PRIORVALUE6, CURRENTVALUE6, INCREASEDECREASE6, TOTALPRIOR, TOTALCURRENT, TOTALINCREASEDECREASE, VALUEYEAR, PROPERTYTYPE, PRIMARYBUILDING, BUILDINGCOUNT, 
                         SUBDIVISION, NEIGHBORHOOD, RESIDENTIALSF, STYLE, QUALITY, YEARBUILT, HEATTYPE, BASEMENTSF, FINISHEDBSMNTSF, BASEMENTTYPE, GARAGESF, IMPSF, COMMERCIALSF, OUTBUILDINGSF, 
                         LANDTYPE, ACREAGE, LEA, LANDATTRIBUTES, APPRDATEYEAR, REAPPRYEAR, BEGPERYEAR, ENDPERYEAR, CBOEDEADLINE, PRINTFLAG, BULKNOVFLAG, PRIVATEFLAG, ASSESSOR
FROM            asr_staging.s_realnov

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
         Begin Table = "s_realnov (asr_staging)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 272
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_realnov_old';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_realnov_old';

