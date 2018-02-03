-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[RPT_GetAssetsCostOverTime]
	 @AssetID int
	 ,@codcurrency varchar(3)
	 ,@subtype int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT (IIF(codcurrency = @codcurrency, e.[Value], e.[value] * er.[Value])) as despesa,
		Datepart(MONTH,ExpenseDate) as Mes,
		CASE Datepart(MONTH,ExpenseDate)
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
		END AS MesExtenso,
		Datepart(YEAR,ExpenseDate) as ano, 
		ExpenseDate,
		type, subtype,e.id
	FROM vExpenses e INNER JOIN ExchangeRates er ON er.[month] = DATEPART(MONTH,e.expensedate)
			AND er.[year] = DATEPART(YEAR,e.expensedate)
	WHERE AssetID = @AssetID
		AND er.[from] = @codcurrency
	--GROUP BY Datepart(MONTH,ExpenseDate),Datepart(YEAR,ExpenseDate) , ExpenseDate
	ORDER BY ano, mes ASC
END
