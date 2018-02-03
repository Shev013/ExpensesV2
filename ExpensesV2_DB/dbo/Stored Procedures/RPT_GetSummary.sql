-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_GetSummary]
	-- Add the parameters for the stored procedure here
	 @year int,
	 @month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @EUR as decimal (8,4)
	declare @CHF as decimal (8,4)

	SELECT @EUR=[Value]	
	FROM ExchangeRates 
	WHERE [to] = 'CHF'
		AND [from] = 'EUR'
		AND[month] = @month
		AND [year] = @year
	ORDER BY [year],[month] desc

	SELECT @CHF=[Value]	
	FROM ExchangeRates 
	WHERE [to] = 'EUR'
		AND [from] = 'CHF'
		AND[month] = @month
		AND [year] = @year

	SELECT 'Contas' as [Type],
	SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf
	FROM vAccounts
	WHERE ([month] = @month
		AND [year] = @year)
	UNION
	SELECT 'Bens' as [Type],
	SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf
	FROM vAssets
	WHERE [month] = @month
		AND [year] = @year
	UNION
	SELECT 'Responsabilidades' as [Type],
	- SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	- SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf
	FROM vResponsabilities
	WHERE [month] = @month
		AND [year] = @year
	UNION
	SELECT 'Pendentes' as [Type],
	SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf
	FROM vPendings
	WHERE [month] = @month
		AND [year] = @year

END

