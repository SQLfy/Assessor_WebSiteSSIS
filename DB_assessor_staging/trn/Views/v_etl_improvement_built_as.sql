




CREATE VIEW [trn].[v_etl_improvement_built_as]
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
                   mobile_home_skirt, mobile_home_skirt_linear_feet, mobile_home_wall_type
*************************************************************************************/

AS
SELECT        i.ACCOUNTNO AS account_no, i.IMPNO AS improvement_no, i.DETAILID AS built_as_detail_id, i.BLTASCODE AS built_as_code, c.BLTASDESCRIPTION AS built_as_code_description, 
                         i.HVACPERCENT AS hvac_percent, i.IMPEXTERIOR AS exterior_construction_type, i.IMPINTERIOR AS interior_finish_type, i.BLTASSTORIES AS no_of_story, i.BLTASSTORYHEIGHT AS typical_story_height, 
                         i.ROOFTYPE AS roof_construction_type, i.ROOFCOVER AS roof_material_type, i.FLOORCOVER AS floor_material_type, i.ROOMCOUNT AS room_count, i.BEDROOMCOUNT AS bedroom_count, 
                         i.BLTASTOTALUNITCOUNT AS total_unit_count, i.CLASSCODE AS class_code, ccd.CLASSDESCRIPTION AS class_code_description, i.BLTASYEARBUILT AS built_year, i.YEARREMODELED AS remodeled_year, 
                         i.REMODELEDPERCENT AS remodeled_percent, i.EFFECTIVEAGE AS effective_age, i.BLTASSF AS built_as_sf, i.SPRINKLERSF AS sprinkler_coverage_sf, i.BATHCOUNT AS bathroom_count, 
                         i.HVACTYPE AS heat_type, CAST(i.IMPSBLTASON2 AS bit) AS primary_flag, i.BLTASLENGTH AS built_as_length, i.BLTASWIDTH AS built_as_width, i.BLTASHEIGHT AS built_as_height, 
						 i.MHMAKE AS mobile_home_make, i.MHMODELNAME AS mobile_home_model_type, i.MHSKIRT AS mobile_home_skirt, i.MHSKIRTLINEARFEET AS mobile_home_skirt_linear_feet,
						 i.MHWALLTYPE AS mobile_home_wall_type, 
						 GETDATE() AS create_datetime, SUSER_NAME() AS create_user_id, HASHBYTES('SHA2_256', ISNULL(RTRIM(i.ACCOUNTNO), 'DBNULL_TEXT') + ISNULL(RTRIM(i.IMPNO), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(i.DETAILID), 'DBNULL_TEXT') + ISNULL(RTRIM(i.BLTASCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(c.BLTASDESCRIPTION), 'DBNULL_TEXT') + ISNULL(RTRIM(i.HVACPERCENT), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(i.IMPEXTERIOR), 'DBNULL_TEXT') + ISNULL(RTRIM(i.IMPINTERIOR), 'DBNULL_TEXT') + ISNULL(RTRIM(i.BLTASSTORIES), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(i.BLTASSTORYHEIGHT), 'DBNULL_TEXT') + ISNULL(RTRIM(i.ROOFTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(i.ROOFCOVER), 'DBNULL_TEXT') + ISNULL(RTRIM(i.FLOORCOVER), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(i.ROOMCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(i.BEDROOMCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(i.BLTASTOTALUNITCOUNT), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(i.CLASSCODE), 'DBNULL_TEXT') + ISNULL(RTRIM(ccd.CLASSDESCRIPTION), 'DBNULL_TEXT') + ISNULL(RTRIM(i.BLTASYEARBUILT), 'DBNULL_TEXT') + ISNULL(RTRIM(i.YEARREMODELED), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(i.REMODELEDPERCENT), 'DBNULL_TEXT') + ISNULL(RTRIM(i.EFFECTIVEAGE), 'DBNULL_TEXT') + ISNULL(RTRIM(i.BLTASSF), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(i.SPRINKLERSF), 'DBNULL_TEXT') + ISNULL(RTRIM(i.BATHCOUNT), 'DBNULL_TEXT') + ISNULL(RTRIM(i.HVACTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(i.IMPSBLTASON2), 'DBNULL_TEXT')) AS rowhash
FROM            dqm.q_tblimpsbltas AS i LEFT OUTER JOIN
                         asr_staging.s_tlkpimpsbltastype AS c ON i.BLTASCODE = c.BLTASCODE LEFT OUTER JOIN
                         asr_staging.s_tlkpimpscomclasstype AS ccd ON i.CLASSCODE = ccd.CLASSCODE INNER JOIN
                         dqm.valid_account AS v ON i.ACCOUNTNO = v.account_no






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
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ccd"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 304
               Bottom = 119
               Right = 477
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_improvement_built_as';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_improvement_built_as';

