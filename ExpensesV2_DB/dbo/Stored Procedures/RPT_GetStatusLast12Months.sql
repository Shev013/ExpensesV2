-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_GetStatusLast12Months]
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
	

	SELECT @CHF=[Value]	
	FROM ExchangeRates 
	WHERE [to] = 'EUR'
		AND [from] = 'CHF'
		AND[month] = @month
		AND [year] = @year

	declare @last12 TABLE  (
		[name] varchar(20),
		ValueEur decimal(10,2),
		ValueChf decimal(10,2),
		[year] int, 
		[month] int)
	

	INSERT INTO @last12 ([name],ValueEur,ValueChf,[year],[month])
	SELECT 'Contas' as [Type],
	SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf,[year],[month]
	FROM vAccounts
	WHERE [year] in (@year,@year -1)
	GROUP BY [year],[month]
	UNION
	SELECT 'Bens' as [Type],
	SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf,[year],[month]
	FROM vAssets
	WHERE [year] in (@year,@year -1)
	GROUP BY [year],[month]
	UNION
	SELECT 'Responsabilidades' as [Type],
	- SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	- SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf,[year],[month]
	FROM vResponsabilities
	WHERE [year] in (@year,@year -1)
	GROUP BY [year],[month]
	UNION
	SELECT 'Pendentes' as [Type],
	SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf,[year],[month]
	FROM vPendings
	WHERE [year] in (@year,@year -1)
	GROUP BY [year],[month]
	ORDER BY [year],[month] desc


	SELECT TOP 12 SUM(ValueEur) as ValueEur, 
		SUM(ValueChf) as ValueChf,
		[year],
		[month]
	FROM @last12
	GROUP BY [year],[month]
	ORDER BY [year],[month] asc
END

