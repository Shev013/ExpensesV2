create PROCEDURE [dbo].[RPT_Months]
AS
BEGIN
	Declare @sMonths Varchar(400)
	SET @sMonths = 'Janeiro,Fevereiro,Março,Abril,Maio,Junho,Julho,Agosto,Setembro,Outubro,Novembro,Dezembro'

	SELECT ROW_NUMBER() OVER (ORDER BY rand()) AS MonthNum ,FieldValue as MonthDesc
	from udf_TableFromString(@sMonths)
END

