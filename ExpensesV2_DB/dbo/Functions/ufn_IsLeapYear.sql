create FUNCTION [dbo].[ufn_IsLeapYear] (@year INT)
	RETURNS BIT
AS
BEGIN
    RETURN(SELECT CASE datepart(mm, dateadd(dd, 1, cast((cast(@year AS VARCHAR(4)) + '0228') AS DATETIME)))
    WHEN 2 THEN 1
    ELSE 0
    END)
END

