


CREATE VIEW [asr_spatialest_query].[v_account]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      8/23/2016
Developer:     Richard Edwards
Comments:      Add CSVClean function to remove problem characters for Spatialest CSV format
*************************************************************************************/
AS
SELECT   account_no, state_parcel_no, tax_district_no, sub_filing_recording_no, account_type, 
         dbo.fn_CSVClean(legal_description) AS legal_description, longitude_x, 
         latitude_y, elevation_z, create_datetime, create_user_id, update_datetime, update_user_id, HASHBYTES('SHA2_256', ISNULL(RTRIM(account_no), 'DBNULL_TEXT') + ISNULL(RTRIM(state_parcel_no), 
         'DBNULL_TEXT') + ISNULL(RTRIM(tax_district_no), 'DBNULL_TEXT') + ISNULL(RTRIM(sub_filing_recording_no), 'DBNULL_TEXT') + ISNULL(RTRIM(account_type), 'DBNULL_TEXT') 
         + ISNULL(RTRIM(dbo.fn_CSVClean(legal_description)), 'DBNULL_TEXT') + ISNULL(RTRIM(longitude_x), 'DBNULL_TEXT') + ISNULL(RTRIM(latitude_y), 
         'DBNULL_TEXT') + ISNULL(RTRIM(elevation_z), 'DBNULL_TEXT') + ISNULL(RTRIM(location), 'DBNULL_TEXT')) AS rowhash
FROM     asr_datastore.account
WHERE    1=1
		   --AND  (appraisal_type = 'Real') 
         AND (account_status = 'A')
		 AND account_no not like 'C%'




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[5] 2[40] 3) )"
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
         Begin Table = "account (asr_datastore)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 270
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
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 6960
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
', @level0type = N'SCHEMA', @level0name = N'asr_spatialest_query', @level1type = N'VIEW', @level1name = N'v_account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'asr_spatialest_query', @level1type = N'VIEW', @level1name = N'v_account';

