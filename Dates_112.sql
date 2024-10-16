DECLARE 
    @Today VARCHAR(10), 
    @Yesterday VARCHAR(10), 
    @LastBusinessDay VARCHAR(10);

-- Set current date and previous dates in YYYYMMDD format
SET @Today = CONVERT(VARCHAR(10), GETDATE(), 112);
SET @Yesterday = CONVERT(VARCHAR(10), DATEADD(DAY, -1, GETDATE()), 112);

-- Calculate the last business day (excluding weekends)
SET @LastBusinessDay = CONVERT(VARCHAR(10), 
    DATEADD(DAY, CASE 
        WHEN DATEPART(WEEKDAY, GETDATE()) = 1 THEN -2 -- If today is Sunday, go back to Friday
        WHEN DATEPART(WEEKDAY, GETDATE()) = 2 THEN -3 -- If today is Monday, go back to Friday
        ELSE -1                                      
    END, GETDATE()), 112);

-- Return the results
SELECT @Today AS Today, @Yesterday AS Yesterday, @LastBusinessDay AS LastBusinessDay;
