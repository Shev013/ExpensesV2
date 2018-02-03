CREATE PROCEDURE [dbo].[RPT_Expenses]
	@Month int, @Year int
AS
BEGIN
	DECLARE @begindate DATETIME, @enddate DATETIME

	SET @begindate	=	CONVERT(DATETIME, cast(@year as varchar) + '/' + cast(@Month as varchar) + '/01' ,111)
	SET @enddate	=	CONVERT(DATETIME, cast(@year as varchar) + '/' + cast(@Month as varchar) + '/' + cast(dbo.udf_DaysInMonth(@Month,@year) as varchar),111)

	SET @enddate = DATEADD(DAY,1,@enddate)
	SET @enddate = DATEADD(minute,-1,@enddate)

	declare @EUR as decimal (8,4)
	--declare @CHF as decimal (8,4)
	SELECT @EUR=[Value]	
	FROM ExchangeRates 
	WHERE [to] = 'CHF'
		AND [from] = 'EUR'
		AND[month] = @month
		AND [year] = @year
	/*
	SELECT @CHF=[Value]	
	FROM ExchangeRates 
	WHERE [to] = 'EUR'
		AND [from] = 'CHF'
		AND[month] = @month
		AND [year] = @year
	*/

	SELECT e.id, e.Description, e.ExpenseDate,dt.Description as Type,dst.Description as SubType, 
		e.Value,e.Observations,dst.id as idsubtipo, e.codCurrency,
		IIF(codcurrency = 'EUR', e.[Value], e.[value] * @EUR) as ValueEUR
	FROM expenses e
		INNER JOIN ExpensesSubTypes dst ON e.SubType = dst.id
		INNER JOIN ExpensesTypes dt ON dst.idType = dt.id
	WHERE e.ExpenseDate BETWEEN @begindate AND @enddate

END
