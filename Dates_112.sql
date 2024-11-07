DECLARE @today VARCHAR(10);
DECLARE @yesterday VARCHAR(10);
DECLARE @lastBusinessDay VARCHAR(10);

-- Set today's date in YYYYMMDD format
SET @today = CONVERT(VARCHAR(10), GETDATE(), 112);

-- Set yesterday's date in YYYYMMDD format
SET @yesterday = CONVERT(VARCHAR(10), DATEADD(DAY, -1, GETDATE()), 112);

-- Calculate the last business day (ignores weekends)
SET @lastBusinessDay = CONVERT(VARCHAR(10), 
    DATEADD(DAY, 
        CASE 
            WHEN DATEPART(WEEKDAY, GETDATE()) = 2 THEN -3  -- Monday
            WHEN DATEPART(WEEKDAY, GETDATE()) = 1 THEN -2  -- Sunday
            ELSE -1                                       -- Other weekdays
        END, 
        GETDATE()), 
    112);

-- Select the results
SELECT @today AS Today, @yesterday AS Yesterday, @lastBusinessDay AS LastBusinessDay;
