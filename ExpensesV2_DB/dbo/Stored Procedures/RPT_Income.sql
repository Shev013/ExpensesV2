CREATE PROCEDURE [dbo].[RPT_Income]
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

	SELECT i.id,it.Description as IncomeTypes,i.RecordDate,p.Description as pessoa, p.id as pid, i.value,i.Observations,i.EntranceDate,
		i.CodCurrency, IIF(codcurrency = 'EUR', i.[Value], i.[value] * @EUR) as ValueEUR
	FROM income i
		INNER JOIN IncomeTypes it ON i.type = it.id
		INNER JOIN Persons p ON i.Person = p.id
	WHERE i.RecordDate BETWEEN @begindate AND @enddate

END

