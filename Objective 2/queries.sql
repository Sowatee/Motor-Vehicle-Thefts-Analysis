-- FIND THE VEHICLE TYPES THAT ARE MOST OFTEN AND LEAST OFTEN STOLEN
SELECT vehicle_type, COUNT(*) AS 'Amount Stolen'
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY COUNT(*) DESC;

-- FOR EACH VEHICLE TYPE, FIND THE AVERAGE AGE OF THE CARS THAT ARE STOLEN
SELECT vehicle_type, AVG(YEAR(date_stolen) - model_year) AS avg_age
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY vehicle_type;

-- FOR EACH VEHICLE TYPE, FIND THE PERCENT OF VEHICLES STOLEN THAT ARE LUXURY VS STANDARD
SELECT 
	vehicle_type,
	CONCAT(ROUND(SUM(CASE WHEN md.make_type = 'Luxury' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS luxury_percentage,
    CONCAT(ROUND(SUM(CASE WHEN md.make_type = 'Standard' THEN 1 ELSE 0 END) / COUNT(*) * 100,2), '%') AS standard_percentage
FROM stolen_vehicles sv
JOIN make_details md ON sv.make_id = md.make_id
GROUP BY vehicle_type;

/*
Create a table where the rows represent the top 10 vehicle types, the columns represent the top 7 vehicle colors 
(plus 1 column for all other colors) and the values are the number of vehicles stolen
*/
SELECT
	vehicle_type,
    SUM(CASE WHEN color = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN color = 'White' THEN 1 ELSE 0 END) AS White,
	SUM(CASE WHEN color = 'Black' THEN 1 ELSE 0 END) AS Black,
    SUM(CASE WHEN color = 'Blue' THEN 1 ELSE 0 END) AS Blue,
    SUM(CASE WHEN color = 'Red' THEN 1 ELSE 0 END) AS Red,
    SUM(CASE WHEN color = 'Grey' THEN 1 ELSE 0 END) AS Grey,
    SUM(CASE WHEN color = 'Green' THEN 1 ELSE 0 END) AS Green,
    SUM(CASE WHEN color NOT IN ('Silver', 'White', 'Black', 'Blue', 'Red', 'Grey', 'Green') THEN 1 ELSE 0 END) AS Other
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY COUNT(*) DESC
LIMIT 10;

