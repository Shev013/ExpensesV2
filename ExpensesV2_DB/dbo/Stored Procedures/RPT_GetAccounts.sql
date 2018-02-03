-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_GetAccounts]
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

	--set @month = 6
	--set @year = 2016

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

		--IIF(Obsolete = 'N' or InStock = 'Y', 1, 0) as Saleable
    -- Insert statements for procedure here
	SELECT * , 
	IIF(codcurrency = 'EUR', [Value], [value] * @EUR) as ValueEur,
	IIF(codcurrency = 'CHF', [Value], [value] * @CHF) as ValueChf
	FROM vAccounts
	WHERE [month] = @month
		AND [year] = @year
	ORDER BY CodCurrency DESC, BankShortName ASC

END

