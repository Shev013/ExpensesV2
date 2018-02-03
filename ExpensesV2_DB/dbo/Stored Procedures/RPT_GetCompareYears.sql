-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_GetCompareYears]
	-- Add the parameters for the stored procedure here
	 @year int
	 --,@month int
	 ,@codcurrency varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @yearAnt int
	SET @yearAnt = @year - 1 

	CREATE TABLE #TEMP (
		mes INT,
		AnoAnt INT, 
		IncomeAnt money,
		DespesasAnt money,
		AnoCor INT, 
		IncomeCor money,
		DespesasCor money,
	);

	DECLARE @retTableInc table (ano int,mes int,  income money)
	DECLARE @begindate DATETIME, @enddate DATETIME

	SET @begindate	=	CONVERT(DATETIME, cast(@yearAnt as varchar) + '/01/01' ,111)
	SET @enddate	=	CONVERT(DATETIME, cast(@Year as varchar) + '/12/31' ,111)

	SET @enddate = DATEADD(DAY,1,@enddate)
	SET @enddate = DATEADD(minute,-1,@enddate)
	
	INSERT INTO @retTableInc (income,ano ,mes ) 
	SELECT SUM(IIF(codcurrency = @codcurrency, i.[Value], i.[value] * er.[Value])), 
		DATEPART(YEAR,RecordDate) as Ano,DATEPART(MONTH,RecordDate) as mesnum
	FROM Income i INNER JOIN ExchangeRates er ON er.[month] = DATEPART(MONTH,i.RecordDate)
		AND er.[year] = DATEPART(YEAR,i.RecordDate)
	WHERE i.RecordDate BETWEEN @begindate AND @enddate --AND er.[to] = 'CHF'
		AND er.[from] = @codcurrency

	GROUP BY DATEPART(YEAR,RecordDate),DATEPART(MONTH,RecordDate)

	INSERT INTO #TEMP (DespesasAnt,mes,AnoAnt,AnoCor)
	SELECT SUM(IIF(codcurrency = @codcurrency, e.[Value], e.[value] * er.[Value])) as despesa,
		Datepart(MONTH,ExpenseDate) as Mes,
		
		@yearAnt,@year
	FROM Expenses e INNER JOIN ExchangeRates er ON er.[month] = DATEPART(MONTH,e.expensedate)
			AND er.[year] = DATEPART(YEAR,e.expensedate)
	WHERE Datepart(YEAR,ExpenseDate) =@yearAnt 
		--AND er.[to] = 'CHF'
		AND er.[from] = @codcurrency
	group by Datepart(MONTH,ExpenseDate)
	ORDER BY mes asc
	
	UPDATE #TEMP
	SET  IncomeAnt= i.Income 
	FROM (
		SELECT Income, Mes
		FROM @retTableInc
		WHERE ano =@yearAnt
		) i
	WHERE 
		i.Mes = #TEMP.mes

	UPDATE #TEMP
	SET  DespesasCor= e.despesa
	FROM (
		SELECT SUM(IIF(codcurrency = @codcurrency, e.[Value], e.[value] * er.[Value])) as despesa,
			Datepart(MONTH,expensedate) as Mes
		FROM Expenses e INNER JOIN ExchangeRates er ON er.[month] = DATEPART(MONTH,e.expensedate)
			AND er.[year] = DATEPART(YEAR,e.expensedate)
		WHERE Datepart(YEAR,expensedate) =@year 
			--AND er.[to] = 'CHF'
			AND er.[from] = @codcurrency
		group by Datepart(MONTH,expensedate)
		) e
	WHERE 
		e.Mes = #TEMP.mes

	UPDATE #TEMP
	SET  IncomeCor= i.Income 
	FROM (
		SELECT Income, Mes
		FROM @retTableInc
		WHERE ano =@year
		) i
	WHERE 
		i.Mes = #TEMP.mes

   
	SELECT mes, 
		CASE mes
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
		END AS MesDesc,
		AnoAnt, 
		IncomeAnt, 
		DespesasAnt,
		IncomeAnt - DespesasAnt as OutcomeAnt,
		AnoCor , 
		IncomeCor,
		DespesasCor, 
		IncomeCor - DespesasCor as OutcomeCor
	FROM #TEMP
	ORDER BY mes asc
	
	DROP TABLE #TEMP 
END

