
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_GetStatusLiquidAll]
	-- Add the parameters for the stored procedure here
	@year int,
	@month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    EXEC	[dbo].[RPT_GetStatusLiquid]
		@year = @year,
		@month = @month,
		@All = 1
END
