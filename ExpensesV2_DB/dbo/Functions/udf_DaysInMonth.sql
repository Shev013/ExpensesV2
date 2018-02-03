create FUNCTION [dbo].[udf_DaysInMonth] 
(
	@Month INT, @year INT
)
RETURNS int
AS
BEGIN
	IF @Month IN (1,3,5,7,8,10,12)
		BEGIN
			RETURN 31
		END
	ELSE IF @Month IN (4,6,9,11)
		BEGIN
			RETURN 30
		END
	ELSE
		BEGIN
			IF dbo.ufn_IsLeapYear(@year) = 1
				BEGIN
					RETURN 29
				END
			ELSE
				BEGIN
					RETURN 28
			END
	END
	RETURN 0
END

