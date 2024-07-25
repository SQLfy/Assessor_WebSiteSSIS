CREATE VIEW trn.v_etl_sale_inventory
WITH SCHEMABINDING 
AS
SELECT        si.RECEPTIONNO AS recording_no, si.ACCOUNTNO AS account_no, si.INVENTORYEFFECTIVEDATE AS inventory_effective_date, si.ADJSALEPRICE AS adjusted_sale_price, 
                         si.TIMEADJSALEPRICE AS time_adjusted_sale_price, si.ACCTTYPE AS account_type, si.LEA AS land_economic_area, lt.LEADESCRIPTION AS land_economic_area_description, 
                         si.PROPERTYTYPE AS property_type, si.IMPCONDITIONTYPE AS improvement_condition_type, si.IMPQUALITY AS improvement_quality, si.IMPABSTRACTCODE AS improvement_abstract_code, 
                         ac.ABSTRACTDESCRIPTION AS improvement_abstract_code_description, si.BLTASDESCRIPTION AS built_as_description, si.BLTASYEARBUILT AS built_as_year_built, si.PHYSICALAGE AS physical_age, 
                         si.ADJUSTEDYEARBUILT AS adjusted_year_built, si.EFFECTIVEAGE AS effective_age, si.IMPEXTERIOR AS improvement_exterior, si.CLASSCODE AS class_code, 
                         ccd.CLASSDESCRIPTION AS class_code_description, si.IMPCOUNT AS improvement_count, si.BLTASTOTALUNITCOUNT AS built_as_total_unit_count, si.ROOMCOUNT AS room_count, 
                         si.BEDROOMCOUNT AS bedroom_count, si.BATHCOUNT AS bath_count, si.TOTALIMPSF AS total_improvement_square_footage, si.RESIDENTIALSF AS residential_square_footage, 
                         si.COMMERCIALSF AS commercial_square_footage, si.OUTBUILDINGSF AS outbuilding_square_footage, si.IMPBLTASOTHER AS improvement_built_as_other, si.LANDNETSF AS land_net_square_footage, 
                         si.MULTIPLEUSEFLAG AS multiple_use_flag, si.LANDTYPE AS land_type, si.LANDABSTRACTCODE AS land_abstract_code, ac2.ABSTRACTDESCRIPTION AS land_abstract_code_description, 
                         si.ZONINGCODE AS zoning_code, z.ZONINGDESCRIPTION AS zoning_code_description, si.PLATTEDFLAG AS platted_flag, si.LANDNETACRECOUNT AS land_net_acre_count, si.HVACTYPE AS hvac_type, 
                         si.IMPUNITTYPE AS improvement_unit_type, si.IMPINTERIOR AS improvement_interior, si.ROOFCOVER AS roof_cover, si.ROOFTYPE AS roof_type, si.NBHDCODE1 AS neighborhood_code_1, 
                         si.NBHDCODE2 AS neighborhood_code_2, si.NBHDEXTENSION1 AS neighborhood_extension_1, si.NBHDEXTENSION2 AS neighborhood_extension_2, si.OUTBUILDINGCOUNT AS outbuilding_count, 
                         si.FLOORCOVER AS floor_cover, si.OCCCODEDESCRIPTION1 AS occupancy_code_description_1, si.OCCCODEDESCRIPTION2 AS occupancy_code_description_2, 
                         si.TOTALFINISHEDSF AS total_finished_square_footage, si.TOTALUNFINISHEDSF AS total_unfinished_square_footage, v.create_datetime, v.create_user_id, HASHBYTES('SHA2_256', 
                         ISNULL(RTRIM(si.RECEPTIONNO), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(si.INVENTORYEFFECTIVEDATE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ADJSALEPRICE), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(si.TIMEADJSALEPRICE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ACCTTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.LEA), 'DBNULL_TEXT') + ISNULL(RTRIM(lt.LEADESCRIPTION), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(si.PROPERTYTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.IMPCONDITIONTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.IMPQUALITY), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(si.IMPABSTRACTCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(ac.ABSTRACTDESCRIPTION), 'DBNULL_TEXT') + ISNULL(RTRIM(si.BLTASDESCRIPTION), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(si.BLTASYEARBUILT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.PHYSICALAGE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ADJUSTEDYEARBUILT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.EFFECTIVEAGE), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(si.IMPEXTERIOR), 'DBNULL_TEXT') + ISNULL(RTRIM(si.CLASSCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(ccd.CLASSDESCRIPTION), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(si.IMPCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.BLTASTOTALUNITCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ROOMCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.BEDROOMCOUNT), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(si.BATHCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.TOTALIMPSF), 'DBNULL_TEXT') + ISNULL(RTRIM(si.RESIDENTIALSF), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(si.COMMERCIALSF), 'DBNULL_TEXT') + ISNULL(RTRIM(si.OUTBUILDINGSF), 'DBNULL_TEXT') + ISNULL(RTRIM(si.IMPBLTASOTHER), 'DBNULL_TEXT') + ISNULL(RTRIM(si.LANDNETSF), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(si.MULTIPLEUSEFLAG), 'DBNULL_TEXT') + ISNULL(RTRIM(si.LANDTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.LANDABSTRACTCODE), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(ac2.ABSTRACTDESCRIPTION), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ZONINGCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(z.ZONINGDESCRIPTION), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(si.PLATTEDFLAG), 'DBNULL_TEXT') + ISNULL(RTRIM(si.LANDNETACRECOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.HVACTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.IMPUNITTYPE), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(si.IMPINTERIOR), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ROOFCOVER), 'DBNULL_TEXT') + ISNULL(RTRIM(si.ROOFTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(si.NBHDCODE1), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(si.NBHDCODE2), 'DBNULL_TEXT') + ISNULL(RTRIM(si.NBHDEXTENSION1), 'DBNULL_TEXT') + ISNULL(RTRIM(si.NBHDEXTENSION2), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(si.OUTBUILDINGCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(si.FLOORCOVER), 'DBNULL_TEXT') + ISNULL(RTRIM(si.OCCCODEDESCRIPTION1), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(si.OCCCODEDESCRIPTION2), 'DBNULL_TEXT') + ISNULL(RTRIM(si.TOTALFINISHEDSF), 'DBNULL_TEXT') + ISNULL(RTRIM(si.TOTALUNFINISHEDSF), 'DBNULL_TEXT')) AS rowhash
FROM            dqm.q_tbnsaleinventory AS si LEFT OUTER JOIN
                         dqm.q_tlkpleatype AS lt ON si.LEA = lt.LEA LEFT OUTER JOIN
                         dqm.q_tlkpabstractcode AS ac ON si.IMPABSTRACTCODE = ac.ABSTRACTCODE LEFT OUTER JOIN
                         asr_staging.s_tlkpimpscomclasstype AS ccd ON si.CLASSCODE = ccd.CLASSCODE LEFT OUTER JOIN
                         dqm.q_tlkpabstractcode AS ac2 ON si.LANDABSTRACTCODE = ac2.ABSTRACTCODE LEFT OUTER JOIN
                         asr_staging.s_tlkpzoning AS z ON si.ZONINGCODE = z.ZONINGCODE INNER JOIN
                         dqm.valid_account AS v ON si.ACCOUNTNO = v.account_no

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
         Begin Table = "si"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lt"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ac"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 323
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ccd"
            Begin Extent = 
               Top = 138
               Left = 258
               Bottom = 268
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ac2"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 323
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "z"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 347
               Bottom = 119
               Right = 520
            End
            DisplayFlags = 280
            TopColumn = 0
         ', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_sale_inventory';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 59
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_sale_inventory';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_sale_inventory';

