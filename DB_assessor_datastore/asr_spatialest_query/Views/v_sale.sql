
CREATE VIEW [asr_spatialest_query].[v_sale]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      5/10/2016
Developer:     Richard Edwards
Comments:      Initial creation
               Provide a view to access sale data for active accounts for 
			   loading data into the asssessor_app database for spatialest
**************************************************************************************
Mod #:  2
Mod Date:      8/23/2016
Developer:     Richard Edwards
Comments:      Add CSVClean function to remove problem characters for Spatialest CSV format
*************************************************************************************/
AS
SELECT   recording_no,
         dbo.fn_CSVClean(grantor) AS grantor, 
		 dbo.fn_CSVClean(grantee) AS grantee, sale_date, 
         dbo.fn_CSVClean(deed_code_description) AS deed_code_description, 
		 sale_price, valid1_flag, improved_flag, create_datetime, create_user_id, update_datetime, 
         update_user_id, 
		 HASHBYTES('SHA2_256', ISNULL(RTRIM(recording_no), 'DBNULL_TEXT') 
		 + ISNULL(RTRIM(dbo.fn_CSVClean(grantor)), 'DBNULL_TEXT') 
         + ISNULL(RTRIM(dbo.fn_CSVClean(grantee)), 'DBNULL_TEXT') + ISNULL(RTRIM(sale_date), 'DBNULL_TEXT') 
         + ISNULL(RTRIM(dbo.fn_CSVClean(deed_code_description)), 'DBNULL_TEXT') + ISNULL(RTRIM(sale_price), 'DBNULL_TEXT') 
		 + ISNULL(RTRIM(valid1_flag),'DBNULL_TEXT') + ISNULL(RTRIM(improved_flag), 'DBNULL_TEXT')) AS rowhash
FROM     asr_datastore.sale
WHERE    (sale_price > 10) AND (sale_date > DATEADD(yyyy, - 10, GETDATE())) AND (non_sale_flag = 0)


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[11] 4[2] 2[32] 3) )"
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
         Begin Table = "sale (asr_datastore)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 273
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 4275
         Width = 5910
         Width = 1935
         Width = 3315
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
', @level0type = N'SCHEMA', @level0name = N'asr_spatialest_query', @level1type = N'VIEW', @level1name = N'v_sale';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'asr_spatialest_query', @level1type = N'VIEW', @level1name = N'v_sale';

