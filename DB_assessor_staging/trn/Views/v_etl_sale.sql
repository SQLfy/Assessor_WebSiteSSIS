




/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [trn].[v_etl_sale]
AS
 /**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:     6/24/2020
Developer:    David Guillen
Comments:     Add s.EXCLUDECODE2 AS exclude_code_2, se2.EXCLUDEDESCRIPTION AS exclude_code_2_description

*************************************************************************************/
SELECT        s.RECEPTIONNO AS recording_no, s.BOOK, s.PAGE, s.GRANTOR, s.GRANTEE, s.SALEDATE AS sale_date, s.DEEDCODE AS deed_code, d.DEEDDESCRIPTION AS deed_code_description, 
                         s.SALEPRICE AS sale_price, s.VALID1FLAG AS valid1_flag, s.CONFIRMEDFLAG AS confirmed_flag, s.EXCLUDECODE1 AS exclude_code_1, se1.EXCLUDEDESCRIPTION AS exclude_code_1_description, 
						 s.EXCLUDECODE2 AS exclude_code_2, se2.EXCLUDEDESCRIPTION AS exclude_code_2_description,
                         s.IMPROVEDFLAG AS improved_flag, s.NONSALEFLAG AS non_sale_flag, GETDATE() AS create_datetime, SUSER_NAME() AS create_user_id, HASHBYTES('SHA2_256', ISNULL(RTRIM(s.RECEPTIONNO), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(s.GRANTOR), 'DBNULL_TEXT') + ISNULL(RTRIM(s.GRANTEE), 'DBNULL_TEXT') + ISNULL(RTRIM(s.SALEDATE), 'DBNULL_TEXT') + ISNULL(RTRIM(s.DEEDCODE), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(s.SALEPRICE), 'DBNULL_TEXT') + ISNULL(RTRIM(s.VALID1FLAG), 'DBNULL_TEXT') + ISNULL(RTRIM(s.CONFIRMEDFLAG), 'DBNULL_TEXT') 
                         + ISNULL(RTRIM(s.EXCLUDECODE1), 'DBNULL_TEXT') + ISNULL(RTRIM(s.EXCLUDECODE2), 'DBNULL_TEXT') + ISNULL(RTRIM(se1.EXCLUDEDESCRIPTION), 'DBNULL_TEXT') + ISNULL(RTRIM(s.IMPROVEDFLAG), 'DBNULL_TEXT') + ISNULL(RTRIM(s.NONSALEFLAG), 
                         'DBNULL_TEXT') + ISNULL(RTRIM(se2.EXCLUDEDESCRIPTION), 'DBNULL_TEXT' + ISNULL(RTRIM(s.BOOK), 'DBNULL_TEXT') + ISNULL(RTRIM(s.PAGE), 'DBNULL_TEXT'))) AS rowhash, 
                         s.VALID2FLAG AS valid2_flag
FROM            dqm.q_tblsale AS s LEFT OUTER JOIN
                         asr_staging.s_tlkpsaleexclude AS se1 ON s.EXCLUDECODE1 = se1.EXCLUDECODE LEFT OUTER JOIN
						 asr_staging.s_tlkpsaleexclude AS se2 ON s.EXCLUDECODE2 = se2.EXCLUDECODE LEFT OUTER JOIN
                         asr_staging.s_tlkpdeedtype AS d ON s.DEEDCODE = d.DEEDCODE

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
               Right = 291
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "se"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 287
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
', @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_sale';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'trn', @level1type = N'VIEW', @level1name = N'v_etl_sale';

