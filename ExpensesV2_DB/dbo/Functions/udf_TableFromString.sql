create FUNCTION [dbo].[udf_TableFromString]
    (
      @ParamaterList VARCHAR(8000)
      
    )
RETURNS @ReturnList TABLE
    (
      FieldValue VARCHAR(8000)
    )
AS BEGIN
	declare	@Delimiter CHAR(1)
	set @Delimiter = ','
    DECLARE @ArrayList TABLE
        (
          FieldValue VARCHAR(8000)
        )
    DECLARE @Value VARCHAR(8000)
    DECLARE @CurrentPosition INT
 
    SET @ParamaterList = LTRIM(RTRIM(@ParamaterList))
        + CASE WHEN RIGHT(@ParamaterList, 1) = @Delimiter THEN ''
               ELSE @Delimiter
          END
    SET @CurrentPosition = ISNULL(CHARINDEX(@Delimiter, @ParamaterList, 1), 0)  

    IF @CurrentPosition = 0
        INSERT  INTO @ArrayList ( FieldValue )
                SELECT  @ParamaterList
    ELSE
        BEGIN
            WHILE @CurrentPosition > 0
                BEGIN
                    SET @Value = LTRIM(RTRIM(LEFT(@ParamaterList,
                                                  @CurrentPosition - 1))) --make sure a value exists between the delimiters
                    IF LEN(@ParamaterList) > 0
                        AND @CurrentPosition <= LEN(@ParamaterList)
                        BEGIN
                            INSERT  INTO @ArrayList ( FieldValue )
                                    SELECT  @Value
                        END
                    SET @ParamaterList = SUBSTRING(@ParamaterList,
                                                   @CurrentPosition
                                                   + LEN(@Delimiter),
                                                   LEN(@ParamaterList))
                    SET @CurrentPosition = CHARINDEX(@Delimiter,
                                                     @ParamaterList, 1)
                END
        END
    INSERT  @ReturnList ( FieldValue )
            SELECT  FieldValue
            FROM    @ArrayList
    RETURN
   END

