-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE RPT_GetAssetsCostOverTime
	 @AssetID int
	 ,@codcurrency varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT (IIF(codcurrency = @codcurrency, e.[Value], e.[value] * er.[Value])) as despesa,
		Datepart(MONTH,ExpenseDate) as Mes,Datepart(YEAR,ExpenseDate) as ano, ExpenseDate,
		type, subtype,e.id
	FROM vExpenses e INNER JOIN ExchangeRates er ON er.[month] = DATEPART(MONTH,e.expensedate)
			AND er.[year] = DATEPART(YEAR,e.expensedate)
	WHERE AssetID = @AssetID
		AND er.[from] = @codcurrency
	--GROUP BY Datepart(MONTH,ExpenseDate),Datepart(YEAR,ExpenseDate) , ExpenseDate
	ORDER BY ano, mes ASC
END
