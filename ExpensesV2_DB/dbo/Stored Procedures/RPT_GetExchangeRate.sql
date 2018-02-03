-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_GetExchangeRate]
	-- Add the parameters for the stored procedure here
	 @year int,
	 @month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/*
	SELECT @EUR=[Value]	
	FROM ExchangeRates 
	WHERE [to] = 'CHF'
		AND [from] = 'EUR'
		AND[month] = @month
		AND [year] = @year
    */
	SELECT [Value]	
	FROM ExchangeRates 
	WHERE [to] = 'EUR'
		AND [from] = 'CHF'
		AND[month] = @month
		AND [year] = @year

END

