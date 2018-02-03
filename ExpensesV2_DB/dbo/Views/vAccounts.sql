
CREATE VIEW [dbo].[vAccounts]
AS
SELECT        dbo.Accounts.id, dbo.Accounts.Description, dbo.Accounts.Liquid, dbo.AccountType.Description AS AccountDescription, dbo.Banks.Short AS BankShortName, dbo.Banks.Description AS BankName, 
                         dbo.Currencies.Description AS CurrencyDescription, dbo.Accounts.CodCurrency, dbo.Persons.Description AS Pessoa, dbo.AccountsStatements.Value, dbo.AccountsStatements.month, 
                         dbo.AccountsStatements.year, dbo.Persons.id AS IdPessoa
FROM            dbo.Accounts INNER JOIN
                         dbo.AccountType ON dbo.Accounts.CodAccountType = dbo.AccountType.Cod INNER JOIN
                         dbo.Banks ON dbo.Accounts.idBank = dbo.Banks.id INNER JOIN
                         dbo.Currencies ON dbo.Accounts.CodCurrency = dbo.Currencies.Cod INNER JOIN
                         dbo.Persons ON dbo.Accounts.idPerson = dbo.Persons.id INNER JOIN
                         dbo.AccountsStatements ON dbo.Accounts.id = dbo.AccountsStatements.idAccount

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[8] 2[21] 3) )"
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
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 86
               Left = 0
               Bottom = 216
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountType"
            Begin Extent = 
               Top = 5
               Left = 225
               Bottom = 101
               Right = 395
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Banks"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 165
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Currencies"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 156
               Right = 844
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pessoas"
            Begin Extent = 
               Top = 132
               Left = 284
               Bottom = 228
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountsStatements"
            Begin Extent = 
               Top = 156
               Left = 674
               Bottom = 286
               Right = 844
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Width ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vAccounts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vAccounts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vAccounts';

