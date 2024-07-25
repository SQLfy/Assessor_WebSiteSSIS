CREATE VIEW asr_app_query.[v_realnov_old]
AS
SELECT        rn.ACCOUNTNO, rn.TAXYEAR, rn.PARCELNO, rn.PROPADDRESS, rn.LEGALDESCRIPTION1, rn.LEGALDESCRIPTION2, rn.LEGALDESCRIPTION3, rn.NAME1, rn.NAME2, rn.PNAME1, rn.PNAME2, 
                         rn.OWNERADDRESS1, rn.OWNERADDRESS2, rn.OWNERCITY, rn.OWNERSTATE, rn.OWNERZIP, rn.PROPCLASS1, rn.PRIORVALUE1, rn.CURRENTVALUE1, rn.INCREASEDECREASE1, rn.PROPCLASS2, 
                         rn.PRIORVALUE2, rn.CURRENTVALUE2, rn.INCREASEDECREASE2, rn.PROPCLASS3, rn.PRIORVALUE3, rn.CURRENTVALUE3, rn.INCREASEDECREASE3, rn.PROPCLASS4, rn.PRIORVALUE4, rn.CURRENTVALUE4, 
                         rn.INCREASEDECREASE4, rn.PROPCLASS5, rn.PRIORVALUE5, rn.CURRENTVALUE5, rn.INCREASEDECREASE5, rn.PROPCLASS6, rn.PRIORVALUE6, rn.CURRENTVALUE6, rn.INCREASEDECREASE6, 
                         rn.TOTALPRIOR, rn.TOTALCURRENT, rn.TOTALINCREASEDECREASE, rn.VALUEYEAR, rn.PROPERTYTYPE, rn.PRIMARYBUILDING, rn.BUILDINGCOUNT, rn.SUBDIVISION, rn.NEIGHBORHOOD, rn.RESIDENTIALSF, 
                         rn.STYLE, rn.QUALITY, rn.YEARBUILT, rn.HEATTYPE, rn.BASEMENTSF, rn.FINISHEDBSMNTSF, rn.BASEMENTTYPE, rn.GARAGESF, rn.IMPSF, rn.COMMERCIALSF, rn.OUTBUILDINGSF, rn.LANDTYPE, rn.ACREAGE,
                          rn.LEA, rn.LANDATTRIBUTES, rn.APPRDATEYEAR, rn.REAPPRYEAR, rn.BEGPERYEAR, rn.ENDPERYEAR, rn.CBOEDEADLINE, rn.PRINTFLAG, rn.BULKNOVFLAG, rn.PRIVATEFLAG, rn.create_datetime, 
                         rn.create_user_id, rn.update_datetime, rn.update_user_id, rn.ASSESSOR
FROM            asr_datastore.realnov AS rn INNER JOIN
                         assessor_app.asr_app.account AS ac ON rn.ACCOUNTNO = ac.account_no

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
         Begin Table = "rn"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ac"
            Begin Extent = 
               Top = 6
               Left = 310
               Bottom = 136
               Right = 542
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
      Begin ColumnWidths = 78
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
       ', @level0type = N'SCHEMA', @level0name = N'asr_app_query', @level1type = N'VIEW', @level1name = N'v_realnov_old';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'  Width = 1500
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
', @level0type = N'SCHEMA', @level0name = N'asr_app_query', @level1type = N'VIEW', @level1name = N'v_realnov_old';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'asr_app_query', @level1type = N'VIEW', @level1name = N'v_realnov_old';

