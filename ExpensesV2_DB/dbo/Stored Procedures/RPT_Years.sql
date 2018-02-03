CREATE PROCEDURE [dbo].[RPT_Years]
AS
BEGIN
	Declare @sYears Varchar(MAX), @iYears int, @iCurYear int,@iCurMonth int
	SET @sYears = '2005'
	SET @iYears = 2005
	
	SET @iCurYear = DATEPART(YEAR,GETDATE())
	SET @iCurMonth = DATEPART(MONTH,GETDATE())

	if (@iCurMonth =12)
	BEGIN
		SET @iCurYear = @iCurYear + 1
	END


	SET @iYears = @iYears	+	1
	WHILE (@iYears <= @iCurYear)
	BEGIN
		SET @sYears = @sYears +	',' +CAST(@iYears as varchar)
		IF (@iYears = @iCurYear)
			BEGIN
				BREAK
			END
		ELSE
			BEGIN
				SET @iYears = @iYears	+	1
				CONTINUE
		END
	END
	SELECT FieldValue as year 
	FROM udf_TableFromString(@sYears)
END

