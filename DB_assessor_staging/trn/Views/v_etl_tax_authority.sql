/*
-- 
*/
CREATE VIEW trn.v_etl_tax_authority
AS
SELECT        TAXAUTHORITY AS tax_authority_no, AUTHORITYNAME AS tax_authority_name, AUTHORITYTYPE AS authority_type, CONTACTPERSON AS contact_person, CONTACTADDRESS1 AS contact_address_line_1, 
                         CONTACTADDRESS2 AS contact_address_line_2, CONTACTCITY AS contact_city_name, CONTACTSTATE AS contact_state, CONTACTZIPCODE AS contact_zip_code, CONTACTPHONE AS contact_phone, 
                         ACTIVEFLAG AS active_flag, GETDATE() AS create_datetime, SUSER_NAME() AS create_user_id, HASHBYTES('SHA2_256', ISNULL(RTRIM(TAXAUTHORITY), 'DBNULL_TEXT') + ISNULL(RTRIM(AUTHORITYNAME), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(AUTHORITYTYPE), 'DBNULL_TEXT') + ISNULL(RTRIM(CONTACTPERSON), 'DBNULL_TEXT') + ISNULL(RTRIM(CONTACTADDRESS1), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(CONTACTADDRESS2), 'DBNULL_TEXT') + ISNULL(RTRIM(CONTACTCITY), 'DBNULL_TEXT') + ISNULL(RTRIM(CONTACTSTATE), 'DBNULL_TEXT') + ISNULL(RTRIM(CONTACTZIPCODE), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(CONTACTPHONE), 'DBNULL_TEXT') + ISNULL(RTRIM(ACTIVEFLAG), 'DBNULL_TEXT')) AS rowhash
FROM            asr_staging.s_tlkptaxauthority AS ta

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[35] 4[5] 2[42] 3) )"
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
         Begin Table = "ta"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 327
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
      Begin ColumnWidths = 15
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_tax_authority';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_tax_authority';

