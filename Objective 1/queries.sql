-- I merged the replace number with name task in one query.
-- I also did this with the month for readability.


-- FIND THE NUMBER OF VEHICLES STOLEN EACH YEAR
SELECT YEAR(date_stolen) AS 'Year', COUNT(*) AS 'Vehicles Stolen'
FROM stolen_vehicles
GROUP BY YEAR(date_stolen)
ORDER BY YEAR(date_stolen);

-- FIND THE NUMBER OF VEHICLES STOLEN EACH MONTH
SELECT MONTH(date_stolen) AS month_num,
	CASE 
		WHEN MONTH(date_stolen) = 1 THEN 'January'
		WHEN MONTH(date_stolen) = 2 THEN 'February'
        WHEN MONTH(date_stolen) = 3 THEN 'March'
        WHEN MONTH(date_stolen) = 4 THEN 'April'
        WHEN MONTH(date_stolen) = 5 THEN 'May'
        WHEN MONTH(date_stolen) = 6 THEN 'June'
        WHEN MONTH(date_stolen) = 7 THEN 'July'
        WHEN MONTH(date_stolen) = 8 THEN 'August'
        WHEN MONTH(date_stolen) = 9 THEN 'September'
        WHEN MONTH(date_stolen) = 10 THEN 'October'
        WHEN MONTH(date_stolen) = 11 THEN 'November'
        ELSE 'December'
	END AS month_name,
    COUNT(*) AS vehicles_stolen
FROM stolen_vehicles
GROUP BY MONTH(date_stolen), month_name
ORDER BY month_num;

-- FIND THE NUMBER OF VEHICLES STOLEN EACH DAY OF THE WEEK
SELECT DAYOFWEEK(date_stolen) AS dow_num,
	CASE 
		WHEN DAYOFWEEK(date_stolen) = 1 THEN 'Sunday'
		WHEN DAYOFWEEK(date_stolen) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(date_stolen) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(date_stolen) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(date_stolen) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(date_stolen) = 6 THEN 'Friday'
        ELSE 'Saturday'
	END AS day_of_week,
    COUNT(*) AS vehicles_stolen
FROM stolen_vehicles
GROUP BY DAYOFWEEK(date_stolen), day_of_week
ORDER BY dow_num;        