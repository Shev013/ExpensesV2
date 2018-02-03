
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_GetStatusLiquid]
	-- Add the parameters for the stored procedure here
	 @year int,
	 @month int,
	 @All int=0
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


	SELECT SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf,[year],[month]
	FROM vAccounts
	WHERE [year] = @year
		And [month] =@month
		And Liquid=1
		And (@All = 1 OR (@All = 0 AND idPessoa IN (1,2)))
	GROUP BY [year],[month]
	UNION
	SELECT SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf,[year],[month]
	FROM vPendings
	WHERE [year] = @year
		And [month] =@month
		And idType =1001
	GROUP BY [year],[month]
	UNION
	SELECT -SUM(IIF(codcurrency = 'EUR', [Value], [value] * @EUR)) as ValueEur,
	-SUM(IIF(codcurrency = 'CHF', [Value], [value] * @CHF)) as ValueChf,[year],[month]
	FROM vResponsabilities
	WHERE [year] = @year
		And [month] =@month
		And idType =1001
	GROUP BY [year],[month]
END

