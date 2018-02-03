
CREATE procedure [dbo].[RPT_IncomeVsExpense]
	@YearStart int,
	@MonthStart int,
	@YearEnd int,
	@MonthEnd int
AS
BEGIN

	
	DECLARE @retTableDesp table (ano int,mes int, Expense money)
	DECLARE @retTableInc table (ano int,mes int,  income money)

	DECLARE @retTableDespSum table (ano int,mes int, Expense money)
	DECLARE @retTableIncSum table (ano int,mes int,  income money)
	
	DECLARE @begindate DATETIME, @enddate DATETIME

	SET @begindate	=	CONVERT(DATETIME, cast(@YearStart as varchar) + '/' + cast(@MonthStart as varchar) + '/01' ,111)
	SET @enddate	=	CONVERT(DATETIME, cast(@YearEnd as varchar) + '/' + cast(@MonthEnd as varchar) + '/' + cast(dbo.udf_DaysInMonth(@MonthEnd,@YearEnd) as varchar),111)

	SET @enddate = DATEADD(DAY,1,@enddate)
	SET @enddate = DATEADD(minute,-1,@enddate)
	
	INSERT INTO @retTableInc (income,ano ,mes ) 
	SELECT IIF(codcurrency = 'EUR', 
	i.[Value], i.[value] * 
	(SELECT [Value]	
	FROM ExchangeRates 
	WHERE [to] = 'CHF'
		AND [from] = 'EUR'
		AND[month] = DATEPART(MONTH,i.RecordDate)
		AND [year] = DATEPART(YEAR,i.RecordDate))), 
	DATEPART(YEAR,RecordDate) as Ano,DATEPART(MONTH,RecordDate) as mesnum
	FROM income i
	WHERE i.RecordDate BETWEEN @begindate AND @enddate
	
	INSERT INTO @retTableDesp (Expense,ano ,mes ) 
	SELECT 	IIF(codcurrency = 'EUR', 
	e.[Value], e.[value] * 
	(SELECT [Value]	
	FROM ExchangeRates 
	WHERE [to] = 'CHF'
		AND [from] = 'EUR'
		AND[month] = DATEPART(MONTH,e.expensedate)
		AND [year] = DATEPART(YEAR,e.expensedate))),
	DATEPART(YEAR,e.expensedate) as Ano,
	DATEPART(MONTH,e.expensedate) as mesnum
	FROM Expenses e
	WHERE e.expensedate BETWEEN @begindate AND @enddate 

	INSERT INTO @retTableIncSum (income,ano ,mes ) 
	SELECT SUM(income),ano,mes
	FROM @retTableInc i
	GROUP BY ano,mes

	INSERT INTO @retTableDespSum (expense,ano ,mes ) 
	SELECT SUM(expense),ano,mes
	FROM @retTableDesp d
	GROUP BY ano,mes


	SELECT desp.ano, CASE desp.mes
			WHEN 1 THEN		'Janeiro'
			WHEN 2 THEN		'Fevereiro'
			WHEN 3 THEN		'Março'
			WHEN 4 THEN		'Abril'
			WHEN 5 THEN		'Maío'
			WHEN 6 THEN		'Junho'
			WHEN 7 THEN		'Julho'
			WHEN 8 THEN		'Agosto'
			WHEN 9 THEN		'Setembro'
			WHEN 10 THEN	'Outubro'
			WHEN 11 THEN	'Novembro'
			ELSE			'Dezembro'
		END AS mes, desp.mes  as mesnum, desp.Expense, inc.Income, (inc.income - desp.Expense) as Outcome
	from @retTableIncSum inc
		inner join @retTableDespSum desp ON desp.ano = inc.ano AND desp.mes = inc.mes
	ORDER BY ANO ASC,mesnum ASC 


	
	/*
	select * from @retTableInc inc
		

  SELECT IIF(codcurrency = 'EUR', 
	i.[Value], i.[value] * 
	(SELECT [Value]	
	FROM ExchangeRates 
	WHERE [to] = 'CHF'
		AND [from] = 'EUR'
		AND[month] = DATEPART(MONTH,i.entranceDate)
		AND [year] = DATEPART(YEAR,i.entranceDate))) as ValueEUR, Value,
		(SELECT [Value]	
	FROM ExchangeRates 
	WHERE [to] = 'CHF'
		AND [from] = 'EUR'
		AND[month] = DATEPART(MONTH,i.RecordDate)
		AND [year] = DATEPART(YEAR,i.RecordDate)) as ExchangeRate,
	DATEPART(YEAR,RecordDate) as Ano,DATEPART(MONTH,RecordDate) as mesnum
	FROM income i
	WHERE i.RecordDate BETWEEN @begindate AND @enddate

	*/



END